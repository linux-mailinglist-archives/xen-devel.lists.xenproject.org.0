Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FA0673D68
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 16:23:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481199.745946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIWky-0000TX-Sa; Thu, 19 Jan 2023 15:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481199.745946; Thu, 19 Jan 2023 15:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIWky-0000Rl-PH; Thu, 19 Jan 2023 15:23:12 +0000
Received: by outflank-mailman (input) for mailman id 481199;
 Thu, 19 Jan 2023 15:23:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RBPQ=5Q=citrix.com=prvs=3763d7854=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pIWkw-0000C9-Sy
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 15:23:11 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c064f9c-980d-11ed-91b6-6bf2151ebd3b;
 Thu, 19 Jan 2023 16:23:07 +0100 (CET)
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
X-Inumbo-ID: 2c064f9c-980d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674141787;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xXI7LtIQ3wajoUWP2aIUocEFf+htiw98CX7jFZ6KiZA=;
  b=UpaT0T8kySoFiJ1vreRF9I17ZxxBz0PWiEewfv9573IFHuWFfqij04kv
   w93BFlRaqPEjJ76tF7uea1ro3qatis3jKTIe17ES42/kpiOYwVuJ7mgDQ
   vs51gEMOZpSXc23lUSAYPKrQk9eS7YAmWZCknnFf/59HX/HFcA+BvKOp6
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93331236
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:sq18tKvEN64ZLxk1owZpTHqn8OfnVHheMUV32f8akzHdYApBsoF/q
 tZmKWmOaKyOZzf1etoiatm/pk4C7MLXmIJmSFBsqn08Ri4U+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AaHxiFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwDxI3ZRqPiMaNnomeZvIvmu0jFZSzM9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WzRetFKSo7tx+2XJxRZ9+LPsLMDUapqBQsA9ckOw9
 zmdpD2jWU9y2Nq3xgO090+AmNP0nCbWXdJKC72nzdtljwjGroAUIEJPDgbqyRWjsWa8RtZeJ
 ko86ico668o+ySDTNPwQhm5q36spQMHVpxbFOhSwB6J4rrZ5UCeHGdsZiVadNUsucsyRDor/
 lyEhdXkAXpoqrL9YWKQ8PKYoC2/PQARLHQefmkUQA0d+d7hrYovyBXVQb5e/LWd14OvX2uqm
 nbT8XZ43u9I5SIW60ml1XfluTmmqpftdVAOwynMHX6M7jokPIHwMuRE9mPnAeZ8wJexFwfe5
 ylewZDBvIjiHrnWynXTHbxl8KWBoq/cbWaC2QMH84wJrWzFxpK1QWxHDNiSzm9NO91MRzLma
 VS7Veh5tM4KZyvCgUOajuuM5yUWIUvIT46Nugj8NIYmX3SIXFbvENtSTUCRxXvxt0MnjLsyP
 5yWGe71UylGUfo5kmHnFrdNuVPO+szY7TmLLXwc5033uYdymVbPEetVWLdwRr5RAFy4TPX9r
 I8EapriJ+R3W+zieCjHmbP/3nhTRUXX8ave8pQNHsbae1oOJY3UI6OJqV/XU9A/zvs9eyah1
 i3VZ3K0P3Ki1COZd17SMC0LhXGGdc8XkE/X9BcEZT6As0XPq671hEvDX/PbpYUaydE=
IronPort-HdrOrdr: A9a23:z7RpLqGNrcaE89ecpLqE7MeALOsnbusQ8zAXPidKJSC9E/b2qy
 nKpp8mPHDP5gr5NEtApTnjAtjifZqsz/5ICOAqVN/JMTUO01HYTr2Kg7GSpwHIKmnT8fNcyL
 clU4UWMqyWMbGit7ee3DWF
X-IronPort-AV: E=Sophos;i="5.97,229,1669093200"; 
   d="scan'208";a="93331236"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4 2/3] build: replace get-fields.sh by a python script
Date: Thu, 19 Jan 2023 15:22:55 +0000
Message-ID: <20230119152256.15832-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230119152256.15832-1-anthony.perard@citrix.com>
References: <20230119152256.15832-1-anthony.perard@citrix.com>
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
    
    v4:
    - Use "token in ()" instead of "token in []"
    - Pre-compile regex
    - removed get_typedefs() as it's been removed from get-fields.sh
    
    Overall, this seems to save 0.07166s, down to 1.6673s when generating
    all xlat headers sequentially. (before removing get_typedefs)
    
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
 xen/tools/compat-xlat-header.py | 432 +++++++++++++++++++++++++++++
 xen/tools/get-fields.sh         | 473 --------------------------------
 3 files changed, 434 insertions(+), 477 deletions(-)
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
index 0000000000..ae5c9f11c9
--- /dev/null
+++ b/xen/tools/compat-xlat-header.py
@@ -0,0 +1,432 @@
+#!/usr/bin/env python
+
+from __future__ import print_function
+import re
+import sys
+
+re_identifier = re.compile(r'^[a-zA-Z_]')
+re_compat_handle = re.compile(r'^COMPAT_HANDLE\((.*)\)$')
+re_pad = re.compile(r'^_pad\d*$')
+re_compat = re.compile(r'^compat_.*_t$')
+re_brackets = re.compile(r'[{}]')
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
+        if token in ('struct', 'union'):
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
+        elif re_identifier.match(token):
+            if not (aggr == 0 or name != ''):
+                name = token
+
+        if aggr != 0:
+            fields.append(token)
+
+    return []
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
+        if token in ('struct', 'union'):
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
+        elif re_identifier.match(token):
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
+    elif not re_brackets.search(' '.join(fields)):
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
+            if token in ('struct', 'union'):
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
+            elif re_compat_handle.match(token):
+                if level == 2 and id == '':
+                    m = re_compat_handle.match(token)
+                    type = m.groups()[0]
+                    type = removeprefix(type, 'compat_')
+            elif token == "compat_domain_handle_t":
+                if level == 2 and id == '':
+                    array_type = token
+            elif re_identifier.match(token):
+                id = token
+            elif token in (',', ';'):
+                if level == 2 and not re_pad.match(id):
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
+        if token in ('struct', 'union'):
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
+        elif re_compat_handle.match(token):
+            if level == 2 and id == '':
+                m = re_compat_handle.match(token)
+                type = m.groups()[0]
+                type = removeprefix(type, 'compat_')
+        elif token == "compat_domain_handle_t":
+            if level == 2 and id == '':
+                array_type = token
+        elif re_identifier.match(token):
+            if array != '':
+                array = "%s %s" % (array, token)
+            else:
+                id = token
+        elif token in (',', ';'):
+            if level == 2 and not re_pad.match(id):
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
+    if not re_brackets.search(' '.join(extrafields)):
+        print("; \\")
+        if len(extrafields) != 0:
+            for token in extrafields:
+                if token in ('struct', 'union'):
+                    pass
+                elif re_identifier.match(token):
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
+            if token in ('struct', 'union'):
+                if level == 2:
+                    fields = ['']
+            elif token == '{':
+                level += 1
+                id = ''
+            elif token == '}':
+                level -= 1
+                id = ''
+            elif re_compat.match(token):
+                if level == 2:
+                    fields = ['']
+                    token = removesuffix(token, '_t')
+                    token = removeprefix(token, 'compat_')
+            elif re.match(r'^evtchn_.*_compat_t$', token):
+                if level == 2 and token != "evtchn_port_compat_t":
+                    fields = ['']
+                    token = removesuffix(token, '_compat_t')
+            elif re_identifier.match(token):
+                id = token
+            elif token in (',', ';'):
+                if level == 2 and not re_pad.match(id):
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
+        if token in ('struct', 'union'):
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
+        elif re_compat.match(token):
+            if level == 2 and token != "compat_argo_port_t":
+                fields = ['']
+                token = removesuffix(token, '_t')
+                token = removeprefix(token, 'compat_')
+        elif re_identifier.match(token):
+            if not (level != 2 or arrlvl != 1):
+                id = token
+        elif token in (',', ';'):
+            if level == 2 and not re_pad.match(id):
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
+    re_tokenazier = re.compile(r'\s+')
+    re_skip_line = re.compile(r'^\s*(#|$)')
+    re_spacer = re.compile(r'([\]\[,;:{}])')
+
+    with open(sys.argv[1]) as header:
+        for line in header:
+            if re_skip_line.match(line):
+                continue
+            line = re_spacer.sub(' \\1 ', line)
+            line = line.strip()
+            header_tokens += re_tokenazier.split(line)
+
+    with open(sys.argv[2]) as compat_list:
+        for line in compat_list:
+            words = re_tokenazier.split(line, maxsplit=1)
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
index ad4a7aacc6..0000000000
--- a/xen/tools/get-fields.sh
+++ /dev/null
@@ -1,473 +0,0 @@
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
-				id=$token
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


