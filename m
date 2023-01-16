Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB2A66CE6D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 19:11:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478924.742448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHTx1-0007Lr-9x; Mon, 16 Jan 2023 18:11:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478924.742448; Mon, 16 Jan 2023 18:11:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHTx1-0007J4-62; Mon, 16 Jan 2023 18:11:19 +0000
Received: by outflank-mailman (input) for mailman id 478924;
 Mon, 16 Jan 2023 18:11:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6LTC=5N=citrix.com=prvs=37359307f=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pHTx0-0007IZ-1N
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 18:11:18 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28588fb7-95c9-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 19:11:13 +0100 (CET)
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
X-Inumbo-ID: 28588fb7-95c9-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673892673;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FQsPn2VY1ezossDmCwDjrvIBl/7Wrz4t9IMbkRf9yVo=;
  b=iAdw/5TiN3AyzuUnYwmPhrZIpYW0V2DHNskSP3AtXYa5BtE5SqTlFZB+
   NFdCBB6VxPKwAAvFsA57Cr9u2w/jwpPY2LVyvfAqcsY9WI9A4qjScrbmC
   cn/ACsJy13kpkCyozqO/fLBWWuPMrYD+22cKf6FNWTFjtntOyJvNEujac
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93283753
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:SRwXnaP6K9DDRC7vrR2Gl8FynXyQoLVcMsEvi/4bfWQNrUpz02ZRz
 TMbXjiFPfqLYDH2eI90Po6x/ElT7MLdztRkSQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tB5wJmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0tRHE0oW5
 +ZbFABTUhKkrem2kZaRdsA506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUo3RH5UOwRvDz
 o7A10rXBhRDO/uV9TCq/GOPvtLuhwDDQI1HQdVU8dY12QbOlwT/EiY+V0a/oPS/ol6zXZRYM
 UN80igkoLU29UerZsLgRBD+q3mB1jYDX/JAHut87xuCooLP+BqQDGUASj9HafQludUwSDhs0
 UWG9/v5CDoqvLCLRHa18raPsSj0KSUTNXUFZyIPUU0C+daLnW0opkuRFJA5Svfz14CrX2iqm
 FhmsRTSmZ0hvdwgj7ehvmz33Q6ugbLCTl8RzDn+CzfNAhxCWGK1W2C5wQGFsq0dc9jFFQDpU
 GsswJbHsr1XZX2ZvGnUGbhWQun0jxqQGGeE6WODCaXN4NhEF5SLWYlLqA9zK05yWirvUW+4O
 RSD0e+9CXI6AZdLUUOUS9jrYyjS5fK8fekJr9iNBja0XrB/dRWc4AZlblOK0mbmnSAEyP9gY
 sfDLpj3XCxBV8yLKQZaoM9EgdcWKt0WnzuPFfgXMTz6uVZhWJJlYehcawbfBgzIxKiFvB/U4
 75i2ziikn1ivBnFSnCPq+Y7dAlaRUXX8Liq86S7gMbfeFs5cIzgYteNqY4cl3tNxPQEy76Ro
 iHgASe1CjPX3BX6FOlDUVg7AJuHYHq1hS9T0fAEVbpw50UeXA==
IronPort-HdrOrdr: A9a23:GF4IiaqFGMs76E7GoWEGFe0aV5oTeYIsimQD101hICG8cqSj+f
 xG+85rsyMc6QxhIE3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaTN5DNB7PoSjjPWLz9Z+qjkzJyV
X-IronPort-AV: E=Sophos;i="5.97,221,1669093200"; 
   d="scan'208";a="93283753"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v3 1/1] build: replace get-fields.sh by a python script
Date: Mon, 16 Jan 2023 18:10:48 +0000
Message-ID: <20230116181048.30704-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230116181048.30704-1-anthony.perard@citrix.com>
References: <20230116181048.30704-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The get-fields.sh which generate all the include/compat/.xlat/*.h
headers is quite slow. It takes for example nearly 3 seconds to
generate platform.h on a recent machine, or 2.3 seconds for memory.h.

Rewriting the mix of shell/sed/python into a single python script make
the generation of those file a lot faster.

No functional change, the headers generated are identical.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    To test the header generation, I've submit a branch to gitlab ci,
    where all the headers where generated, and for each one both the shell
    script and the python script where run and the result of both
    compared.
    
    v3:
        convert to python script instead of perl
        - this should allow more developper do be able to review/edit it.
        - it avoid adding a dependency on perl for the hypervisor build.
    
        It can be twice as slow than the perl version, but overall, when doing
        a build with make, there isn't much difference between the perl and
        python script.
        We might be able to speed the python script up by precompiling the
        many regex, but it's probably not worth it. (python already have a
        cache of compiled regex, but I think it's small, maybe 10 or so)
    
    v2:
    - Add .pl extension to the perl script
    - remove "-w" from the shebang as it is duplicate of "use warning;"
    - Add a note in the commit message that the "headers generated are identical".

 xen/include/Makefile            |   6 +-
 xen/tools/compat-xlat-header.py | 468 ++++++++++++++++++++++++++++
 xen/tools/get-fields.sh         | 528 --------------------------------
 3 files changed, 470 insertions(+), 532 deletions(-)
 create mode 100644 xen/tools/compat-xlat-header.py
 delete mode 100644 xen/tools/get-fields.sh

diff --git a/xen/include/Makefile b/xen/include/Makefile
index 65be310eca..b950423efe 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -60,9 +60,7 @@ cmd_compat_c = \
 
 quiet_cmd_xlat_headers = GEN     $@
 cmd_xlat_headers = \
-    while read what name; do \
-        $(SHELL) $(srctree)/tools/get-fields.sh "$$what" compat_$$name $< || exit $$?; \
-    done <$(patsubst $(obj)/compat/%,$(obj)/compat/.xlat/%,$(basename $<)).lst >$@.new; \
+    $(PYTHON) $(srctree)/tools/compat-xlat-header.py $< $(patsubst $(obj)/compat/%,$(obj)/compat/.xlat/%,$(basename $<)).lst > $@.new; \
     mv -f $@.new $@
 
 targets += $(headers-y)
@@ -80,7 +78,7 @@ $(obj)/compat/%.c: $(src)/public/%.h $(srcdir)/xlat.lst $(srctree)/tools/compat-
 	$(call if_changed,compat_c)
 
 targets += $(patsubst compat/%, compat/.xlat/%, $(headers-y))
-$(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(srctree)/tools/get-fields.sh FORCE
+$(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(srctree)/tools/compat-xlat-header.py FORCE
 	$(call if_changed,xlat_headers)
 
 quiet_cmd_xlat_lst = GEN     $@
diff --git a/xen/tools/compat-xlat-header.py b/xen/tools/compat-xlat-header.py
new file mode 100644
index 0000000000..c1b361ac56
--- /dev/null
+++ b/xen/tools/compat-xlat-header.py
@@ -0,0 +1,468 @@
+#!/usr/bin/env python
+
+from __future__ import print_function
+import re
+import sys
+
+typedefs = []
+
+def removeprefix(s, prefix):
+    if s.startswith(prefix):
+        return s[len(prefix):]
+    return s
+
+def removesuffix(s, suffix):
+    if s.endswith(suffix):
+        return s[:-len(suffix)]
+    return s
+
+def get_fields(looking_for, header_tokens):
+    level = 1
+    aggr = 0
+    fields = []
+    name = ''
+
+    for token in header_tokens:
+        if token in ['struct', 'union']:
+            if level == 1:
+                aggr = 1
+                fields = []
+                name = ''
+        elif token == '{':
+            level += 1
+        elif token == '}':
+            level -= 1
+            if level == 1 and name == looking_for:
+                fields.append(token)
+                return fields
+        elif re.match(r'^[a-zA-Z_]', token):
+            if not (aggr == 0 or name != ''):
+                name = token
+
+        if aggr != 0:
+            fields.append(token)
+
+    return []
+
+def get_typedefs(tokens):
+    level = 1
+    state = 0
+    typedefs = []
+    for token in tokens:
+        if token == 'typedef':
+            if level == 1:
+                state = 1
+        elif re.match(r'^COMPAT_HANDLE\((.*)\)$', token):
+            if not (level != 1 or state != 1):
+                state = 2
+        elif token in ['[', '{']:
+            level += 1
+        elif token in [']', '}']:
+            level -= 1
+        elif token == ';':
+            if level == 1:
+                state = 0
+        elif re.match(r'^[a-zA-Z_]', token):
+            if not (level != 1 or state != 2):
+                typedefs.append(token)
+    return typedefs
+
+def build_enums(name, tokens):
+    level = 1
+    kind = ''
+    named = ''
+    fields = []
+    members = []
+    id = ''
+
+    for token in tokens:
+        if token in ['struct', 'union']:
+            if not level != 2:
+                fields = ['']
+            kind = "%s;%s" % (token, kind)
+        elif token == '{':
+            level += 1
+        elif token == '}':
+            level -= 1
+            if level == 1:
+                subkind = kind
+                (subkind, _, _) = subkind.partition(';')
+                if subkind == 'union':
+                    print("\nenum XLAT_%s {" % (name,))
+                    for m in members:
+                        print("    XLAT_%s_%s," % (name, m))
+                    print("};")
+                return
+            elif level == 2:
+                named = '?'
+        elif re.match(r'^[a-zA-Z_]', token):
+            id = token
+            k = kind
+            (_, _, k) = k.partition(';')
+            if named != '' and k != '':
+                if len(fields) > 0 and fields[0] == '':
+                    fields.pop(0)
+                build_enums("%s_%s" % (name, token), fields)
+                named = '!'
+        elif token == ',':
+            if level == 2:
+                members.append(id)
+        elif token == ';':
+            if level == 2:
+                members.append(id)
+            if named != '':
+                (_, _, kind) = kind.partition(';')
+            named = ''
+        if len(fields) != 0:
+            fields.append(token)
+
+def handle_field(prefix, name, id, type, fields):
+    if len(fields) == 0:
+        print(" \\")
+        if type == '':
+            print("%s(_d_)->%s = (_s_)->%s;" % (prefix, id, id), end='')
+        else:
+            k = id.replace('.', '_')
+            print("%sXLAT_%s_HNDL_%s(_d_, _s_);" % (prefix, name, k), end='')
+    elif not re.search(r'[{}]', ' '.join(fields)):
+        tag = ' '.join(fields)
+        tag = re.sub(r'\s*(struct|union)\s+(compat_)?(\w+)\s.*', '\\3', tag)
+        print(" \\")
+        print("%sXLAT_%s(&(_d_)->%s, &(_s_)->%s);" % (prefix, tag, id, id), end='')
+    else:
+        func_id = id
+        func_tokens = fields
+        kind = ''
+        array = ""
+        level = 1
+        arrlvl = 1
+        array_type = ''
+        id = ''
+        type = ''
+        fields = []
+        for token in func_tokens:
+            if token in ['struct', 'union']:
+                if level == 2:
+                    fields = ['']
+                if level == 1:
+                    kind = token
+                    if kind == 'union':
+                        tmp = func_id.replace('.', '_')
+                        print(" \\")
+                        print("%sswitch (%s) {" % (prefix, tmp), end='')
+            elif token == '{':
+                level += 1
+                id = ''
+            elif token == '}':
+                level -= 1
+                id = ''
+                if level == 1 and kind == 'union':
+                    print(" \\")
+                    print("%s}" % (prefix,), end='')
+            elif token == '[':
+                if level != 2 or arrlvl != 1:
+                    pass
+                elif array == '':
+                    array = ' '
+                else:
+                    array = "%s;" % (array,)
+                arrlvl += 1
+            elif token == ']':
+                arrlvl -= 1
+            elif re.match(r'^COMPAT_HANDLE\((.*)\)$', token):
+                if level == 2 and id == '':
+                    m = re.match(r'^COMPAT_HANDLE\((.*)\)$', token)
+                    type = m.groups()[0]
+                    type = removeprefix(type, 'compat_')
+            elif token == "compat_domain_handle_t":
+                if level == 2 and id == '':
+                    array_type = token
+            elif re.match(r'^[a-zA-Z_]', token):
+                if id == '' and type == '' and array_type == '':
+                    for id in typedefs:
+                        if id == token:
+                            type = id
+                    if type == '':
+                        id = token
+                    else:
+                        id = ''
+                else:
+                    id = token
+            elif token in [',', ';']:
+                if level == 2 and not re.match(r'^_pad\d*$', id):
+                    if kind == 'union':
+                        tmp = "%s.%s" % (func_id, id)
+                        tmp = tmp.replace('.', '_')
+                        print(" \\")
+                        print("%scase XLAT_%s_%s:" % (prefix, name, tmp), end='')
+                        if len(fields) > 0 and fields[0] == '':
+                            fields.pop(0)
+                        handle_field("%s    " % (prefix,), name, "%s.%s" % (func_id, id), type, fields)
+                    elif array == '' and array_type == '':
+                        if len(fields) > 0 and fields[0] == '':
+                            fields.pop(0)
+                        handle_field(prefix, name, "%s.%s" % (func_id, id), type, fields)
+                    elif array == '':
+                        copy_array("    ", "%s.%s" % (func_id, id))
+                    else:
+                        (_, _, array) = array.partition(';')
+                        if len(fields) > 0 and fields[0] == '':
+                            fields.pop(0)
+                        handle_array(prefix, name, "{func_id}.{id}", array, type, fields)
+                    if token == ';':
+                        fields = []
+                        id = ''
+                        type = ''
+                    array = ''
+                    if kind == 'union':
+                        print(" \\")
+                        print("%s    break;" % (prefix,), end='')
+            else:
+                if array != '':
+                    array = "%s %s" % (array, token)
+            if len(fields) > 0:
+                fields.append(token)
+
+def copy_array(prefix, id):
+    print(" \\")
+    print("%sif ((_d_)->%s != (_s_)->%s) \\" % (prefix, id, id))
+    print("%s    memcpy((_d_)->%s, (_s_)->%s, sizeof((_d_)->%s));" % (prefix, id, id, id), end='')
+
+def handle_array(prefix, name, id, array, type, fields):
+    i = re.sub(r'[^;]', '', array)
+    i = "i%s" % (len(i),)
+
+    print(" \\")
+    print("%s{ \\" % (prefix,))
+    print("%s    unsigned int %s; \\" % (prefix, i))
+    (head, _, tail) = array.partition(';')
+    head = head.strip()
+    print("%s    for (%s = 0; %s < %s; ++%s) {" % (prefix, i, i, head, i), end='')
+    if not ';' in array:
+        handle_field("%s        " % (prefix,), name, "%s[%s]" % (id, i), type, fields)
+    else:
+        handle_array("%s        " % (prefix,) , name, "%s[%s]" % (id, i), tail, type, fields)
+    print(" \\")
+    print("%s    } \\" % (prefix,))
+    print("%s}" % (prefix,), end='')
+
+def build_body(name, tokens):
+    level = 1
+    id = ''
+    array = ''
+    arrlvl = 1
+    array_type = ''
+    type = ''
+    fields = []
+
+    print("\n#define XLAT_%s(_d_, _s_) do {" % (name,), end='')
+
+    for token in tokens:
+        if token in ['struct', 'union']:
+            if level == 2:
+                fields = ['']
+        elif token == '{':
+            level += 1
+            id = ''
+        elif token == '}':
+            level -= 1
+            id = ''
+        elif token == '[':
+            if level != 2 or arrlvl != 1:
+                pass
+            elif array == '':
+                array = ' '
+            else:
+                array = "%s;" % (array,)
+            arrlvl += 1
+        elif token == ']':
+            arrlvl -= 1
+        elif re.match(r'^COMPAT_HANDLE\((.*)\)$', token):
+            if level == 2 and id == '':
+                m = re.match(r'^COMPAT_HANDLE\((.*)\)$', token)
+                type = m.groups()[0]
+                type = removeprefix(type, 'compat_')
+        elif token == "compat_domain_handle_t":
+            if level == 2 and id == '':
+                array_type = token
+        elif re.match(r'^[a-zA-Z_]', token):
+            if array != '':
+                array = "%s %s" % (array, token)
+            elif id == '' and type == '' and array_type == '':
+                for id in typedefs:
+                    if id != token:
+                        type = id
+                if type == '':
+                    id = token
+                else:
+                    id = ''
+            else:
+                id = token
+        elif token in [',', ';']:
+            if level == 2 and not re.match(r'^_pad\d*$', id):
+                if array == '' and array_type == '':
+                    if len(fields) > 0 and fields[0] == '':
+                        fields.pop(0)
+                    handle_field("    ", name, id, type, fields)
+                elif array == '':
+                    copy_array("    ", id)
+                else:
+                    (head, sep, tmp) = array.partition(';')
+                    if sep == '':
+                        tmp = head
+                    if len(fields) > 0 and fields[0] == '':
+                        fields.pop(0)
+                    handle_array("    ", name, id, tmp, type, fields)
+                if token == ';':
+                    fields = []
+                    id = ''
+                    type = ''
+                array = ''
+        else:
+            if array != '':
+                array = "%s %s" % (array, token)
+        if len(fields) > 0:
+            fields.append(token)
+    print(" \\\n} while (0)")
+
+def check_field(kind, name, field, extrafields):
+    if not re.search(r'[{}]', ' '.join(extrafields)):
+        print("; \\")
+        if len(extrafields) != 0:
+            for token in extrafields:
+                if token in ['struct', 'union']:
+                    pass
+                elif re.match(r'^[a-zA-Z_]', token):
+                    print("    CHECK_%s" % (removeprefix(token, 'xen_'),), end='')
+                    break
+                else:
+                    raise Exception("Malformed compound declaration: '%s'" % (token,))
+        elif not '.' in field:
+            print("    CHECK_FIELD_(%s, %s, %s)" % (kind, name, field), end='')
+        else:
+            n = field.count('.')
+            field = field.replace('.', ', ')
+            print("    CHECK_SUBFIELD_%s_(%s, %s, %s)" % (n, kind, name, field), end='')
+    else:
+        level = 1
+        fields = []
+        id = ''
+
+        for token in extrafields:
+            if token in ['struct', 'union']:
+                if level == 2:
+                    fields = ['']
+            elif token == '{':
+                level += 1
+                id = ''
+            elif token == '}':
+                level -= 1
+                id = ''
+            elif re.match(r'^compat_.*_t$', token):
+                if level == 2:
+                    fields = ['']
+                    token = removesuffix(token, '_t')
+                    token = removeprefix(token, 'compat_')
+            elif re.match(r'^evtchn_.*_compat_t$', token):
+                if level == 2 and token != "evtchn_port_compat_t":
+                    fields = ['']
+                    token = removesuffix(token, '_compat_t')
+            elif re.match(r'^[a-zA-Z_]', token):
+                id = token
+            elif token in [',', ';']:
+                if level == 2 and not re.match(r'^_pad\d*$', id):
+                    if len(fields) > 0 and fields[0] == '':
+                        fields.pop(0)
+                    check_field(kind, name, "%s.%s" % (field, id), fields)
+                    if token == ";":
+                        fields = []
+                        id = ''
+            if len(fields) > 0:
+                fields.append(token)
+
+def build_check(name, tokens):
+    level = 1
+    fields = []
+    kind = ''
+    id = ''
+    arrlvl = 1
+
+    print("")
+    print("#define CHECK_%s \\" % (name,))
+
+    for token in tokens:
+        if token in ['struct', 'union']:
+            if level == 1:
+                kind = token
+                print("    CHECK_SIZE_(%s, %s)" % (kind, name), end='')
+            elif level == 2:
+                fields = ['']
+        elif token == '{':
+            level += 1
+            id = ''
+        elif token == '}':
+            level -= 1
+            id = ''
+        elif token == '[':
+            arrlvl += 1
+        elif token == ']':
+            arrlvl -= 1
+        elif re.match(r'^compat_.*_t$', token):
+            if level == 2 and token != "compat_argo_port_t":
+                fields = ['']
+                token = removesuffix(token, '_t')
+                token = removeprefix(token, 'compat_')
+        elif re.match(r'^[a-zA-Z_]', token):
+            if not (level != 2 or arrlvl != 1):
+                id = token
+        elif token in [',', ';']:
+            if level == 2 and not re.match(r'^_pad\d*$', id):
+                if len(fields) > 0 and fields[0] == '':
+                    fields.pop(0)
+                check_field(kind, name, id, fields)
+                if token == ";":
+                    fields = []
+                    id = ''
+
+        if len(fields) > 0:
+            fields.append(token)
+    print("")
+
+
+def main():
+    header_tokens = []
+
+    with open(sys.argv[1]) as header:
+        for line in header:
+            if re.match(r'^\s*(#|$)', line):
+                continue
+            line = re.sub(r'([\]\[,;:{}])', ' \\1 ', line)
+            line = line.strip()
+            header_tokens += re.split(r'\s+', line)
+
+    global typedefs
+    typedefs = get_typedefs(header_tokens)
+
+    with open(sys.argv[2]) as compat_list:
+        for line in compat_list:
+            words = re.split(r'\s+', line, maxsplit=1)
+            what = words[0]
+            name = words[1]
+
+            name = removeprefix(name, 'xen')
+            name = name.strip()
+
+            fields = get_fields("compat_%s" % (name,), header_tokens)
+            if len(fields) == 0:
+                raise Exception("Fields of 'compat_%s' not found in '%s'" % (name, sys.argv[1]))
+
+            if what == "!":
+                build_enums(name, fields)
+                build_body(name, fields)
+            elif what == "?":
+                build_check(name, fields)
+            else:
+                raise Exception("Invalid translation indicator: '%s'" % (what,))
+
+if __name__ == '__main__':
+    main()
diff --git a/xen/tools/get-fields.sh b/xen/tools/get-fields.sh
deleted file mode 100644
index 002db2093f..0000000000
--- a/xen/tools/get-fields.sh
+++ /dev/null
@@ -1,528 +0,0 @@
-test -n "$1" -a -n "$2" -a -n "$3"
-set -ef
-
-SED=sed
-if test -x /usr/xpg4/bin/sed; then
-	SED=/usr/xpg4/bin/sed
-fi
-if test -z ${PYTHON}; then
-	PYTHON=`/usr/bin/env python`
-fi
-if test -z ${PYTHON}; then
-	echo "Python not found"
-	exit 1
-fi
-
-get_fields ()
-{
-	local level=1 aggr=0 name= fields=
-	for token in $2
-	do
-		case "$token" in
-		struct|union)
-			test $level != 1 || aggr=1 fields= name=
-			;;
-		"{")
-			level=$(expr $level + 1)
-			;;
-		"}")
-			level=$(expr $level - 1)
-			if [ $level = 1 -a $name = $1 ]
-			then
-				echo "$fields }"
-				return 0
-			fi
-			;;
-		[a-zA-Z_]*)
-			test $aggr = 0 -o -n "$name" || name="$token"
-			;;
-		esac
-		test $aggr = 0 || fields="$fields $token"
-	done
-}
-
-get_typedefs ()
-{
-	local level=1 state=
-	for token in $1
-	do
-		case "$token" in
-		typedef)
-			test $level != 1 || state=1
-			;;
-		COMPAT_HANDLE\(*\))
-			test $level != 1 -o "$state" != 1 || state=2
-			;;
-		[\{\[])
-			level=$(expr $level + 1)
-			;;
-		[\}\]])
-			level=$(expr $level - 1)
-			;;
-		";")
-			test $level != 1 || state=
-			;;
-		[a-zA-Z_]*)
-			test $level != 1 -o "$state" != 2 || echo "$token"
-			;;
-		esac
-	done
-}
-
-build_enums ()
-{
-	local level=1 kind= fields= members= named= id= token
-	for token in $2
-	do
-		case "$token" in
-		struct|union)
-			test $level != 2 || fields=" "
-			kind="$token;$kind"
-			;;
-		"{")
-			level=$(expr $level + 1)
-			;;
-		"}")
-			level=$(expr $level - 1)
-			if [ $level = 1 ]
-			then
-				if [ "${kind%%;*}" = union ]
-				then
-					echo
-					echo "enum XLAT_$1 {"
-					for m in $members
-					do
-						echo "    XLAT_${1}_$m,"
-					done
-					echo "};"
-				fi
-				return 0
-			elif [ $level = 2 ]
-			then
-				named='?'
-			fi
-			;;
-		[a-zA-Z]*)
-			id=$token
-			if [ -n "$named" -a -n "${kind#*;}" ]
-			then
-				build_enums ${1}_$token "$fields"
-				named='!'
-			fi
-			;;
-		",")
-			test $level != 2 || members="$members $id"
-			;;
-		";")
-			test $level != 2 || members="$members $id"
-			test -z "$named" || kind=${kind#*;}
-			named=
-			;;
-		esac
-		test -z "$fields" || fields="$fields $token"
-	done
-}
-
-handle_field ()
-{
-	if [ -z "$5" ]
-	then
-		echo " \\"
-		if [ -z "$4" ]
-		then
-			printf %s "$1(_d_)->$3 = (_s_)->$3;"
-		else
-			printf %s "$1XLAT_${2}_HNDL_$(echo $3 | $SED 's,\.,_,g')(_d_, _s_);"
-		fi
-	elif [ -z "$(echo "$5" | $SED 's,[^{}],,g')" ]
-	then
-		local tag=$(echo "$5" | ${PYTHON} -c '
-import re,sys
-for line in sys.stdin.readlines():
-    sys.stdout.write(re.subn(r"\s*(struct|union)\s+(compat_)?(\w+)\s.*", r"\3", line)[0].rstrip() + "\n")
-')
-		echo " \\"
-		printf %s "${1}XLAT_$tag(&(_d_)->$3, &(_s_)->$3);"
-	else
-		local level=1 kind= fields= id= array= arrlvl=1 array_type= type= token
-		for token in $5
-		do
-			case "$token" in
-			struct|union)
-				test $level != 2 || fields=" "
-				if [ $level = 1 ]
-				then
-					kind=$token
-					if [ $kind = union ]
-					then
-						echo " \\"
-						printf %s "${1}switch ($(echo $3 | $SED 's,\.,_,g')) {"
-					fi
-				fi
-				;;
-			"{")
-				level=$(expr $level + 1) id=
-				;;
-			"}")
-				level=$(expr $level - 1) id=
-				if [ $level = 1 -a $kind = union ]
-				then
-					echo " \\"
-					printf %s "$1}"
-				fi
-				;;
-			"[")
-				if [ $level != 2 -o $arrlvl != 1 ]
-				then
-					:
-				elif [ -z "$array" ]
-				then
-					array=" "
-				else
-					array="$array;"
-				fi
-				arrlvl=$(expr $arrlvl + 1)
-				;;
-			"]")
-				arrlvl=$(expr $arrlvl - 1)
-				;;
-			COMPAT_HANDLE\(*\))
-				if [ $level = 2 -a -z "$id" ]
-				then
-					type=${token#COMPAT_HANDLE?}
-					type=${type%?}
-					type=${type#compat_}
-				fi
-				;;
-			compat_domain_handle_t)
-				if [ $level = 2 -a -z "$id" ]
-				then
-					array_type=$token
-				fi
-				;;
-			[a-zA-Z]*)
-				if [ -z "$id" -a -z "$type" -a -z "$array_type" ]
-				then
-					for id in $typedefs
-					do
-						test $id != "$token" || type=$id
-					done
-					if [ -z "$type" ]
-					then
-						id=$token
-					else
-						id=
-					fi
-				else
-					id=$token
-				fi
-				;;
-			[\,\;])
-				if [ $level = 2 -a -n "$(echo $id | $SED 's,^_pad[[:digit:]]*,,')" ]
-				then
-					if [ $kind = union ]
-					then
-						echo " \\"
-						printf %s "${1}case XLAT_${2}_$(echo $3.$id | $SED 's,\.,_,g'):"
-						handle_field "$1    " $2 $3.$id "$type" "$fields"
-					elif [ -z "$array" -a -z "$array_type" ]
-					then
-						handle_field "$1" $2 $3.$id "$type" "$fields"
-					elif [ -z "$array" ]
-					then
-						copy_array "    " $3.$id
-					else
-						handle_array "$1" $2 $3.$id "${array#*;}" "$type" "$fields"
-					fi
-					test "$token" != ";" || fields= id= type=
-					array=
-					if [ $kind = union ]
-					then
-						echo " \\"
-						printf %s "$1    break;"
-					fi
-				fi
-				;;
-			*)
-				if [ -n "$array" ]
-				then
-					array="$array $token"
-				fi
-				;;
-			esac
-			test -z "$fields" || fields="$fields $token"
-		done
-	fi
-}
-
-copy_array ()
-{
-	echo " \\"
-	echo "${1}if ((_d_)->$2 != (_s_)->$2) \\"
-	printf %s "$1    memcpy((_d_)->$2, (_s_)->$2, sizeof((_d_)->$2));"
-}
-
-handle_array ()
-{
-	local i="i$(echo $4 | $SED 's,[^;], ,g' | wc -w | $SED 's,[[:space:]]*,,g')"
-	echo " \\"
-	echo "$1{ \\"
-	echo "$1    unsigned int $i; \\"
-	printf %s "$1    for ($i = 0; $i < "${4%%;*}"; ++$i) {"
-	if [ "$4" = "${4#*;}" ]
-	then
-		handle_field "$1        " $2 $3[$i] "$5" "$6"
-	else
-		handle_array "$1        " $2 $3[$i] "${4#*;}" "$5" "$6"
-	fi
-	echo " \\"
-	echo "$1    } \\"
-	printf %s "$1}"
-}
-
-build_body ()
-{
-	echo
-	printf %s "#define XLAT_$1(_d_, _s_) do {"
-	local level=1 fields= id= array= arrlvl=1 array_type= type= token
-	for token in $2
-	do
-		case "$token" in
-		struct|union)
-			test $level != 2 || fields=" "
-			;;
-		"{")
-			level=$(expr $level + 1) id=
-			;;
-		"}")
-			level=$(expr $level - 1) id=
-			;;
-		"[")
-			if [ $level != 2 -o $arrlvl != 1 ]
-			then
-				:
-			elif [ -z "$array" ]
-			then
-				array=" "
-			else
-				array="$array;"
-			fi
-			arrlvl=$(expr $arrlvl + 1)
-			;;
-		"]")
-			arrlvl=$(expr $arrlvl - 1)
-			;;
-		COMPAT_HANDLE\(*\))
-			if [ $level = 2 -a -z "$id" ]
-			then
-				type=${token#COMPAT_HANDLE?}
-				type=${type%?}
-				type=${type#compat_}
-			fi
-			;;
-		compat_domain_handle_t)
-			if [ $level = 2 -a -z "$id" ]
-			then
-				array_type=$token
-			fi
-			;;
-		[a-zA-Z_]*)
-			if [ -n "$array" ]
-			then
-				array="$array $token"
-			elif [ -z "$id" -a -z "$type" -a -z "$array_type" ]
-			then
-				for id in $typedefs
-				do
-					test $id != "$token" || type=$id
-				done
-				if [ -z "$type" ]
-				then
-					id=$token
-				else
-					id=
-				fi
-			else
-				id=$token
-			fi
-			;;
-		[\,\;])
-			if [ $level = 2 -a -n "$(echo $id | $SED 's,^_pad[[:digit:]]*,,')" ]
-			then
-				if [ -z "$array" -a -z "$array_type" ]
-				then
-					handle_field "    " $1 $id "$type" "$fields"
-				elif [ -z "$array" ]
-				then
-					copy_array "    " $id
-				else
-					handle_array "    " $1 $id "${array#*;}" "$type" "$fields"
-				fi
-				test "$token" != ";" || fields= id= type=
-				array=
-			fi
-			;;
-		*)
-			if [ -n "$array" ]
-			then
-				array="$array $token"
-			fi
-			;;
-		esac
-		test -z "$fields" || fields="$fields $token"
-	done
-	echo " \\"
-	echo "} while (0)"
-}
-
-check_field ()
-{
-	if [ -z "$(echo "$4" | $SED 's,[^{}],,g')" ]
-	then
-		echo "; \\"
-		local n=$(echo $3 | $SED 's,[^.], ,g' | wc -w | $SED 's,[[:space:]]*,,g')
-		if [ -n "$4" ]
-		then
-			for n in $4
-			do
-				case $n in
-				struct|union)
-					;;
-				[a-zA-Z_]*)
-					printf %s "    CHECK_${n#xen_}"
-					break
-					;;
-				*)
-					echo "Malformed compound declaration: '$n'" >&2
-					exit 1
-					;;
-				esac
-			done
-		elif [ $n = 0 ]
-		then
-			printf %s "    CHECK_FIELD_($1, $2, $3)"
-		else
-			printf %s "    CHECK_SUBFIELD_${n}_($1, $2, $(echo $3 | $SED 's!\.!, !g'))"
-		fi
-	else
-		local level=1 fields= id= token
-		for token in $4
-		do
-			case "$token" in
-			struct|union)
-				test $level != 2 || fields=" "
-				;;
-			"{")
-				level=$(expr $level + 1) id=
-				;;
-			"}")
-				level=$(expr $level - 1) id=
-				;;
-			compat_*_t)
-				if [ $level = 2 ]
-				then
-					fields=" "
-					token="${token%_t}"
-					token="${token#compat_}"
-				fi
-				;;
-			evtchn_*_compat_t)
-				if [ $level = 2 -a $token != evtchn_port_compat_t ]
-				then
-					fields=" "
-					token="${token%_compat_t}"
-				fi
-				;;
-			[a-zA-Z]*)
-				id=$token
-				;;
-			[\,\;])
-				if [ $level = 2 -a -n "$(echo $id | $SED 's,^_pad[[:digit:]]*,,')" ]
-				then
-					check_field $1 $2 $3.$id "$fields"
-					test "$token" != ";" || fields= id=
-				fi
-				;;
-			esac
-			test -z "$fields" || fields="$fields $token"
-		done
-	fi
-}
-
-build_check ()
-{
-	echo
-	echo "#define CHECK_$1 \\"
-	local level=1 fields= kind= id= arrlvl=1 token
-	for token in $2
-	do
-		case "$token" in
-		struct|union)
-			if [ $level = 1 ]
-			then
-				kind=$token
-				printf %s "    CHECK_SIZE_($kind, $1)"
-			elif [ $level = 2 ]
-			then
-				fields=" "
-			fi
-			;;
-		"{")
-			level=$(expr $level + 1) id=
-			;;
-		"}")
-			level=$(expr $level - 1) id=
-			;;
-		"[")
-			arrlvl=$(expr $arrlvl + 1)
-			;;
-		"]")
-			arrlvl=$(expr $arrlvl - 1)
-			;;
-		compat_*_t)
-			if [ $level = 2 -a $token != compat_argo_port_t ]
-			then
-				fields=" "
-				token="${token%_t}"
-				token="${token#compat_}"
-			fi
-			;;
-		[a-zA-Z_]*)
-			test $level != 2 -o $arrlvl != 1 || id=$token
-			;;
-		[\,\;])
-			if [ $level = 2 -a -n "$(echo $id | $SED 's,^_pad[[:digit:]]*,,')" ]
-			then
-				check_field $kind $1 $id "$fields"
-				test "$token" != ";" || fields= id=
-			fi
-			;;
-		esac
-		test -z "$fields" || fields="$fields $token"
-	done
-	echo ""
-}
-
-list="$($SED -e 's,^[[:space:]]#.*,,' -e 's!\([]\[,;:{}]\)! \1 !g' $3)"
-fields="$(get_fields $(echo $2 | $SED 's,^compat_xen,compat_,') "$list")"
-if [ -z "$fields" ]
-then
-	echo "Fields of '$2' not found in '$3'" >&2
-	exit 1
-fi
-name=${2#compat_}
-name=${name#xen}
-case "$1" in
-"!")
-	typedefs="$(get_typedefs "$list")"
-	build_enums $name "$fields"
-	build_body $name "$fields"
-	;;
-"?")
-	build_check $name "$fields"
-	;;
-*)
-	echo "Invalid translation indicator: '$1'" >&2
-	exit 1
-	;;
-esac
-- 
Anthony PERARD


