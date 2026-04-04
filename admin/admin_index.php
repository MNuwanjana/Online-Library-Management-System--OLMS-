<?php include('../includes/header.php'); ?>

<style>
.card-hover {
    transition: all 0.3s ease;
    cursor: pointer;
}

.card-hover:hover {
    transform: translateY(-10px); /* move up */
    box-shadow: 0 10px 25px rgba(0,0,0,0.3); /* stronger shadow */
}
</style>

<div class="container mt-4 mb-5">

    <div class="p-5 mb-5 rounded-4 shadow-lg text-white text-center" 
         style="background-image: linear-gradient(rgba(15, 23, 42, 0.8), rgba(15, 23, 42, 0.8)), url('../assets/images/hero-bg.jpg'); background-size: cover; background-position: center;">
        <h1 class="display-5 fw-bold mb-3">Admin Dashboard</h1>
        <p class="lead mb-0 text-white-50">
            Manage your library system efficiently. Add, update, and monitor books easily.
        </p>
    </div>

    <div class="row g-4 mt-2">

        <div class="col-md-4">
            <div class="card card-hover shadow-sm border-0 text-center p-4 rounded-4 h-100">
                <h4 class="fw-bold text-dark">➕ Add Book</h4>
                <p class="text-muted mb-4">Add new books to library</p>
                <a href="add_books.php" class="btn btn-success fw-bold w-100 mt-auto">Go to Add Book</a>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card card-hover shadow-sm border-0 text-center p-4 rounded-4 h-100">
                <h4 class="fw-bold text-dark">📚 Manage Books</h4>
                <p class="text-muted mb-4">Edit or delete books</p>
                <a href="manage_books.php" class="btn btn-primary fw-bold w-100 mt-auto">Go to Manage</a>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card shadow-sm border-0 text-center p-4 rounded-4 h-100 bg-light opacity-75">
                <h4 class="fw-bold text-secondary">📈 Reports</h4>
                <p class="text-muted mb-4">View library activity</p>
                <button class="btn btn-secondary fw-bold w-100 mt-auto" disabled>Coming Soon</button>
            </div>
        </div>

    </div>

</div>

<?php include('../includes/footer.php'); ?>