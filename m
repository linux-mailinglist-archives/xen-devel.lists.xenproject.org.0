Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F15284AD205
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 08:16:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267589.461345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHKjo-0004OD-PV; Tue, 08 Feb 2022 07:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267589.461345; Tue, 08 Feb 2022 07:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHKjo-0004LJ-MF; Tue, 08 Feb 2022 07:16:32 +0000
Received: by outflank-mailman (input) for mailman id 267589;
 Tue, 08 Feb 2022 07:16:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=co3W=SX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nHKjm-0004LD-Hk
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 07:16:30 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08945fd5-88af-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 08:16:28 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 680761F37C;
 Tue,  8 Feb 2022 07:16:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 24FB413483;
 Tue,  8 Feb 2022 07:16:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rOylB8wYAmLrIQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 08 Feb 2022 07:16:28 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 08945fd5-88af-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644304588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=h1Aps2fmeF2kXxgGc60gFYOcm/Eewiu7EEHlr6uHJUk=;
	b=CocLRIu/V9JZpqquPeYXvGD2g8uE3wBxK+6yZ5qbY+49w4jc7IwgydQex0DkMcTONoDTBU
	xdNn6xDyxOglkwUPsBYS4t8rcCCqgptpADAlTkhi4rTVI0d0GNLV3iC2+7Fju1mrr8VX+8
	nHacG/jYieGP48zSZOjzB0rpHzOyjp0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3] docs: document patch rules
Date: Tue,  8 Feb 2022 08:16:26 +0100
Message-Id: <20220208071626.6594-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a document to describe the rules for sending a proper patch.

As it contains all the information already being present in
docs/process/tags.pandoc remove that file.

The "Reviewed-by:" and "Acked-by:" tags are expanded to allow an
optional restriction of the tag.

A new tag "Origin:" is added to tag patches taken from another project.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
v3:
- add note regarding commit id length for Origin: (Julien Grall)
v2:
- expanded commit message (Roger Pau Monné)
- some rewordings (Roger Pau Monné, Jan Beulich)
- add "Requested-by:" description (Jan Beulich)
- rename "Taken-from:" to "Origin:" (Jan Beulich)
- add reviewers as recipients of patch (Jan Beulich)
- style fixes (Roger Pau Monné, Jan Beulich)
---
 docs/process/sending-patches.pandoc | 300 ++++++++++++++++++++++++++++
 docs/process/tags.pandoc            |  55 -----
 2 files changed, 300 insertions(+), 55 deletions(-)
 create mode 100644 docs/process/sending-patches.pandoc
 delete mode 100644 docs/process/tags.pandoc

diff --git a/docs/process/sending-patches.pandoc b/docs/process/sending-patches.pandoc
new file mode 100644
index 0000000000..7ff7826c99
--- /dev/null
+++ b/docs/process/sending-patches.pandoc
@@ -0,0 +1,300 @@
+# How a proper patch should look like
+
+This is a brief description how a proper patch for the Xen project should
+look like. Examples and tooling tips are not part of this document, those
+can be found in the
+[Xen Wiki](https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches).
+
+## The patch subject
+
+The first line at the top of the patch should contain a short description of
+what the patch does, and hints as to what code it touches. This line is used
+as the **Subject** line of the mail when sending the patch.
+
+The hint which code is touched is usually in form of an abstract entity
+(like e.g. `build` for the build system), or a component (like `tools` or
+`iommu`). Further specification is possible via adding a sub-component with
+a slash (e.g. `tools/xenstore`):
+
+    <component>: <description>
+
+E.g.:
+
+    xen/arm: increase memory banks number define value
+    tools/libxenevtchn: deduplicate xenevtchn_fd()
+    MAINTAINERS: update my email address
+    build: correct usage comments in Kbuild.include
+
+The description should give a rough hint *what* is done in the patch.
+
+The subject line should in general not exceed 80 characters. It must be
+followed by a blank line.
+
+## The commit message
+
+The commit message is free text describing *why* the patch is done and
+*how* the goal of the patch is achieved. A good commit message will describe
+the current situation, the desired goal, and the way this goal is being
+achieved. Parts of that can be omitted in obvious cases.
+
+In case additional changes are done in the patch (like e.g. cleanups), those
+should be mentioned.
+
+When referencing other patches (e.g. `similar to patch xy ...`) those
+patches should be referenced via their commit id (at least 12 digits)
+and the patch subject, if the very same patch isn't referenced by the
+`Fixes:` tag, too:
+
+    Similar to commit 67d01cdb5518 ("x86: infrastructure to allow converting
+    certain indirect calls to direct ones") add ...
+
+The following ``git config`` settings can be used to add a pretty format for
+outputting the above style in the ``git log`` or ``git show`` commands:
+
+        [core]
+                abbrev = 12
+        [pretty]
+                fixes = Fixes: %h (\"%s\")
+
+Lines in the commit message should not exceed 75 characters, except when
+copying error output directly into the commit message.
+
+## Tags
+
+Tags are entries in the form
+
+    Tag: something
+
+In general tags are added in chronological order. So a `Reviewed-by:` tag
+should be added **after** the `Signed-off-by:` tag, as the review happened
+after the patch was written.
+
+Do not split a tag across multiple lines, tags are exempt from the
+"wrap at 75 columns" rule in order to simplify parsing scripts.
+
+### Origin:
+
+Xen has inherited some source files from other open source projects. In case
+a patch modifying such an inherited file is taken from that project (maybe in
+modified form), the `Origin:` tag specifies the source of the patch:
+
+    Origin: <repository-URL> <commit-id>
+
+E.g.:
+
+    Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f093b08c47b3
+
+The commit id should be shortened to its first 12 characters.
+
+All tags **above** the `Origin:` tag are from the original patch (which
+should all be kept), while tags **after** `Origin:` are related to the
+normal Xen patch process as described here.
+
+### Fixes:
+
+If your patch fixes a bug in a specific commit, e.g. you found an issue using
+``git bisect``, please use the `Fixes:` tag with the first 12 characters of
+the commit id, and the one line summary.
+
+    Fixes: <commit-id> ("<patch-subject>")
+
+E.g.:
+
+    Fixes: 67d01cdb5518 ("x86: infrastructure to allow converting certain indirect calls to direct ones")
+
+### Backport:
+
+A backport tag is an optional tag in the commit message to request a
+given commit to be backported to the released trees:
+
+    Backport: <version> [# <comment>]
+
+E.g.:
+
+    Backport: 4.9+
+
+It marks a commit for being a candidate for backports to all released
+trees from 4.9 onward.
+
+The backport requester is expected to specify which currently supported
+releases need the backport; but encouraged to specify a release as far
+back as possible which applies. If the requester doesn't know the oldest
+affected tree, they are encouraged to append a comment like the
+following:
+
+    Backport: 4.9+ # maybe older
+
+Maintainers request the Backport tag to be added on commit. Contributors
+are welcome to mark their patches with the Backport tag when they deem
+appropriate. Maintainers will request for it to be removed when that is
+not the case.
+
+Please note that the Backport tag is a **request** for backport, which
+will still need to be evaluated by the maintainers. Maintainers might
+ask the requester to help with the backporting work if it is not
+trivial.
+
+### Reported-by:
+
+This optional tag can be used to give credit to someone reporting an issue.
+It is in the format:
+
+    Reported-by: name <email@domain>
+
+E.g.:
+
+    Reported-by: Jane Doe <jane.doe@example.org>
+
+As the email address will be made public via git, the reporter of an issue
+should be asked whether he/she is fine with being mentioned in the patch.
+
+### Suggested-by:
+
+This optional tag can be used to give credit to someone having suggested the
+solution the patch is implementing. It is in the format:
+
+    Suggested-by: name <email@domain>
+
+E.g.:
+
+    Suggested-by: Jane Doe <jane.doe@example.org>
+
+As the email address will be made public via git, the reporter of an issue
+should be asked whether he/she is fine with being mentioned in the patch.
+
+### Requested-by:
+
+This tag is very similar to the `Suggested-by:` tag, but it refers to an
+explicit request to add the patch. It is in the format:
+
+    Requested-by: name <email@domain>
+
+E.g.:
+
+    Requested-by: Jane Doe <jane.doe@example.org>
+
+### Signed-off-by:
+
+This mandatory tag specifies the author(s) of a patch (for each author a
+separate `Signed-off-by:` tag is needed). It is in the format:
+
+    Signed-off-by: name <email@domain>
+
+E.g.:
+
+    Signed-off-by: Jane Doe <jane.doe@example.org>
+
+The author must be a natural person (not a team or just a company) and the
+`Signed-off-by:` tag must include the real name of the author (no pseudonym).
+
+By signing the patch with her/his name the author explicitly confirms to have
+made the contribution conforming to the `Developer's Certificate of Origin`:
+
+    Developer's Certificate of Origin 1.1
+    
+    By making a contribution to this project, I certify that:
+    
+    (a) The contribution was created in whole or in part by me and I
+        have the right to submit it under the open source license
+        indicated in the file; or
+    
+    (b) The contribution is based upon previous work that, to the best
+        of my knowledge, is covered under an appropriate open source
+        license and I have the right under that license to submit that
+        work with modifications, whether created in whole or in part
+        by me, under the same open source license (unless I am
+        permitted to submit under a different license), as indicated
+        in the file; or
+    
+    (c) The contribution was provided directly to me by some other
+        person who certified (a), (b) or (c) and I have not modified
+        it.
+    
+    (d) I understand and agree that this project and the contribution
+        are public and that a record of the contribution (including all
+        personal information I submit with it, including my sign-off) is
+        maintained indefinitely and may be redistributed consistent with
+        this project or the open source license(s) involved.
+
+### Reviewed-by:
+
+A `Reviewed-by:` tag can only be given by a reviewer of the patch. With
+responding to a sent patch adding the `Reviewed-by:` tag the reviewer
+(which can be anybody) confirms to have looked thoroughly at the patch and
+didn't find any issue (being it technical, legal or formal ones). If the
+review is covering only some parts of the patch, those parts can optionally
+be specified (multiple areas can be either separated by commas, or be covered
+with multiple `Reviewed-by:` tags). It is in the format:
+
+    Reviewed-by: name <email@domain> [# area[, area]]
+
+E.g.:
+
+    Reviewed-by: Jane Doe <jane.doe@example.org>
+    Reviewed-by: Jane Doe <jane.doe@example.org> # xen/x86
+
+In case a patch is being resent an already given `Reviewed-by:` tag can and
+should be included, if the patch didn't meaningfully change the portions of the
+patch covered by the tag, or if the reviewer already made clear it would be
+fine to make specific changes and no *other* changes have been made.
+
+### Acked-by:
+
+Similar to `Reviewed-by:` the `Acked-by:` tag is given by someone having looked
+at the patch. The `Acked-by:` tag can only be given by a **maintainer** of the
+modified code, and it only covers the code the maintainer is responsible for.
+With the `Acked-by:` tag the maintainer states, that he/she is fine with the
+changes in principle, but didn't do a thorough review. The format is:
+
+    Acked-by: name <email@domain> [# area[, area]]
+
+E.g.:
+
+    Acked-by: Jane Doe <jane.doe@example.org>
+
+Including the `Acked-by:` tag in a patch is done under the same rules as for
+the `Reviewed-by:` tag, with the implied code area the maintainer who gave the
+`Acked-by:` tag is responsible for (if no area was specified with the tag).
+
+### Tested-by:
+
+The `Tested-by:` tag is another tag given by someone else. The one giving it
+confirms to have tested the patch without finding any functional issues. The
+format is:
+
+    Tested-by: name <email@domain>
+
+E.g.:
+
+    Tested-by: Jane Doe <jane.doe@example.org>
+
+Including the `Tested-by:` tag in a patch is done under the same rules as for
+the `Reviewed-by:` tag, now limited to the patch not having been modified
+regarding code logic (having changed only coding style, comments, or message
+texts is fine).
+
+## Patch version history (change log), further comments
+
+When sending revised versions of a patch it is good practice to include a
+change log after a line containing only `---` (this line will result in the
+following text not being included in the commit message). This change log
+will help reviewers to spot which parts of the patch have changed. Attributing
+changes due to reviewer comments will help the reviewer even more, e.g.:
+
+    ---
+    Changes in v2:
+    - changed function foo() as requested by Jane Doe
+    - code style fixed
+
+In some cases it might be desirable to add some more information for readers
+of the patch, like potential enhancements, other possible solutions, etc.,
+which should not be part of the commit message. This information can be
+added after the `---` line, too.
+
+## Recipients of the patch
+
+A patch should always be sent **to** the xen-devel mailing list
+<xen-devel@lists.xenproject.org> and all maintainers and designated reviewers
+of all touched code areas should get a copy of the mail via **Cc**. In case
+some other recipients are known to be interested in the patch, they can be
+added via **Cc**, too.
diff --git a/docs/process/tags.pandoc b/docs/process/tags.pandoc
deleted file mode 100644
index 1841cb87a8..0000000000
--- a/docs/process/tags.pandoc
+++ /dev/null
@@ -1,55 +0,0 @@
-Tags: No line splitting
------------------------
-Do not split a tag across multiple lines, tags are exempt from the
-"wrap at 75 columns" rule in order to simplify parsing scripts.  For
-example:
-
-        Fixes: 67d01cdb5518 ("x86: infrastructure to allow converting certain indirect calls to direct ones")
-
-
-Fixes Tag
----------
-
-If your patch fixes a bug in a specific commit, e.g. you found an issue using
-``git bisect``, please use the 'Fixes:' tag with the first 12 characters of
-the SHA-1 ID, and the one line summary.
-
-The following ``git config`` settings can be used to add a pretty format for
-outputting the above style in the ``git log`` or ``git show`` commands:
-
-        [core]
-                abbrev = 12
-        [pretty]
-                fixes = Fixes: %h (\"%s\")
-
-
-Backport Tag
-------------
-
-A backport tag is an optional tag in the commit message to request a
-given commit to be backported to the released trees:
-
-    Backport: 4.9+
-
-It marks a commit for being a candidate for backports to all released
-trees from 4.9 onward.
-
-The backport requester is expected to specify which currently supported
-releases need the backport; but encouraged to specify a release as far
-back as possible which applies. If the requester doesn't know the oldest
-affected tree, they are encouraged to append a comment like the
-following:
-
-    Backport: 4.9+ # maybe older
-
-Maintainers request the Backport tag to be added on commit. Contributors
-are welcome to mark their patches with the Backport tag when they deem
-appropriate. Maintainers will request for it to be removed when that is
-not the case.
-
-Please note that the Backport tag is a **request** for backport, which
-will still need to be evaluated by the maintainers. Maintainers might
-ask the requester to help with the backporting work if it is not
-trivial.
-
-When possible, please use the Fixes tag instead (or in addition).
-- 
2.34.1


