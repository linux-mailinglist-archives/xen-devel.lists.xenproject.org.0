Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF917C24D
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 14:54:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hso38-0000Xa-Lt; Wed, 31 Jul 2019 12:49:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QWEJ=V4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hso37-0000XV-5J
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 12:49:45 +0000
X-Inumbo-ID: a90d0a46-b391-11e9-93fc-8722eca9b865
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a90d0a46-b391-11e9-93fc-8722eca9b865;
 Wed, 31 Jul 2019 12:49:40 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: t9zTx9+F2E+j1jhB0aQfUo7apO5HsTXVXf0gLxnFdeV148s+CUDbbKTn85x+Sd+GJZ1JMcAbp9
 u48W2L2OjCpsgD+pUqYitSTyGlZdRozZZgJ/KAvNN9i6i3e566kfo8Yq9ATAnujy04b/gLxEX7
 8yMppjH597QpY8nx2u+JKkO36ip8zBhqHogdtbnodDoF4SF0w9w+IZh+T3xHeR21aaJh6kBoEo
 iQARR13NYgySsomG0in4sYDTopJY0UFsYKe6Si9568fetd0ycD4sdkSJLep++BjWHt4Sguv3a/
 Hjk=
X-SBRS: 2.7
X-MesageID: 3705448
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,330,1559534400"; d="scan'208,217";a="3705448"
To: Jan Beulich <JBeulich@suse.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
 <20190729121204.13559-8-andrew.cooper3@citrix.com>
 <3a6217c6-25d3-3882-99da-846a957d4c02@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <88cead08-46ab-7623-c01a-adfd7267e9e1@citrix.com>
Date: Wed, 31 Jul 2019 13:49:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3a6217c6-25d3-3882-99da-846a957d4c02@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 07/10] xen/nodemask: Drop nodes_{setall,
 clear}() and improve the initialisers
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============1250171304567417304=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1250171304567417304==
Content-Type: multipart/alternative;
	boundary="------------2EB97A3796532B28A5BE1107"
Content-Language: en-GB

--------------2EB97A3796532B28A5BE1107
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 30/07/2019 10:44, Jan Beulich wrote:

> On 29.07.2019 14:12, Andrew Cooper wrote:
>> There is no need to use runtime variable-length clearing when MAX_NUMNODES is
>> known to the compiler.  Drop these functions and use the initialisers instead.
> The only slight concern I have with this is that it further locks
> down the maximum remaining to be a compile time constant. But this
> is not an objection, just a remark.

The maximum number of nodes I'm aware of at all is 10, and we currently default to 64.

I don't think it is likely that we'll get to a point where a runtime nodesize is a realistic consideration that we would want to take.

>
>> @@ -67,7 +65,34 @@ typedef struct { DECLARE_BITMAP(bits, MAX_NUMNODES); } nodemask_t;
>>   
>>   #define nodemask_bits(src) ((src)->bits)
>>   
>> -extern nodemask_t _unused_nodemask_arg_;
>> +#define NODEMASK_LAST_WORD BITMAP_LAST_WORD_MASK(MAX_NUMNODES)
>> +
>> +#define NODEMASK_NONE                                                   \
>> +((nodemask_t) {{                                                        \
>> +        [0 ... BITS_TO_LONGS(MAX_NUMNODES) - 1] = 0                     \
>> +}})
>> +
>> +#if MAX_NUMNODES <= BITS_PER_LONG
>> +
>> +#define NODEMASK_ALL      ((nodemask_t) {{ NODEMASK_LAST_WORD }})
>> +#define NODEMASK_OF(node) ((nodemask_t) {{ 1UL << (node) }})
>> +
>> +#else /* MAX_NUMNODES > BITS_PER_LONG */
>> +
>> +#define NODEMASK_ALL                                                    \
>> +((nodemask_t) {{                                                        \
>> +        [0 ... BITS_TO_LONGS(MAX_NUMNODES) - 2] = ~0UL,                 \
>> +        [BITS_TO_LONGS(MAX_NUMNODES) - 1] = NODEMASK_LAST_WORD          \
>> +}})
>> +
>> +#define NODEMASK_OF(node)                                               \
>> +({                                                                      \
>> +    nodemask_t m = NODES_NONE;                                          \
>> +    m.bits[(node) / BITS_PER_LONG] = 1UL << ((node) % BITS_PER_LONG);   \
> I think you will want to avoid the double evaluation of "node"
> here. With this taken care of
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'm afraid this is a bit more complicated after I spotted another opencoding of NODEMASK_OF().

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c

index 00b64c3322..24af9bc471 100644

--- a/xen/arch/arm/smpboot.c

+++ b/xen/arch/arm/smpboot.c

@@ -46,7 +46,7 @@ struct cpuinfo_arm cpu_data[NR_CPUS];

 register_t __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = MPIDR_INVALID };

 

 /* Fake one node for now. See also include/asm-arm/numa.h */

-nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };

+nodemask_t __read_mostly node_online_map = NODEMASK_OF(0);

 

 /* Xen stack for bringing up the first CPU. */

 static unsigned char __initdata cpu0_boot_stack[STACK_SIZE]

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c

index 7473f83b7b..9a55c013e5 100644

--- a/xen/arch/x86/numa.c

+++ b/xen/arch/x86/numa.c

@@ -47,7 +47,7 @@ nodeid_t apicid_to_node[MAX_LOCAL_APIC] = {

 };

 cpumask_t node_to_cpumask[MAX_NUMNODES] __read_mostly;

 

-nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };

+nodemask_t __read_mostly node_online_map = NODEMASK_OF(0);

 

 bool numa_off;

 s8 acpi_numa = 0;

diff --git a/xen/include/xen/nodemask.h b/xen/include/xen/nodemask.h

index 9933fec5c4..c474dca3f0 100644

--- a/xen/include/xen/nodemask.h

+++ b/xen/include/xen/nodemask.h

@@ -86,11 +86,9 @@ typedef struct { DECLARE_BITMAP(bits, MAX_NUMNODES); } nodemask_t;

 }})

 

 #define NODEMASK_OF(node)                                               \

-({                                                                      \

-    nodemask_t m = NODES_NONE;                                          \

-    m.bits[(node) / BITS_PER_LONG] = 1UL << ((node) % BITS_PER_LONG);   \

-    m;                                                                  \

-})

+((nodemask_t) {{                                                        \

+        [(node) / BITS_PER_LONG] = 1UL << ((node) % BITS_PER_LONG)      \

+}})

 

 #endif /* MAX_NUMNODES */

 

and to be used as a static initialiser, NODEMASK_OF() needs to be an ICE and can't use ({}) .

I don't see a way to avoid expanding node twice, but given that its wrapper is in ALL_CAPS and obviously a macro.

Furthermore, experimenting with a deliberate attempt to provoke this, I got 

numa.c: In function ‘numa_initmem_init’:

/local/xen.git/xen/include/xen/nodemask.h:90:10: error: nonconstant array index in initializer

         [(node) / BITS_PER_LONG] = 1UL << ((node) % BITS_PER_LONG)      \

          ^

numa.c:274:23: note: in expansion of macro ‘NODEMASK_OF’

     node_online_map = NODEMASK_OF(foo++);

                       ^~~~~~~~~~~

/local/xen.git/xen/include/xen/nodemask.h:90:10: note: (near initialization for ‘(anonymous).bits’)

         [(node) / BITS_PER_LONG] = 1UL << ((node) % BITS_PER_LONG)      \

          ^

numa.c:274:23: note: in expansion of macro ‘NODEMASK_OF’

     node_online_map = NODEMASK_OF(foo++);

                       ^~~~~~~~~~~

from GCC 6.3, which I think covers everything we need, and will prevent side effects from double expansion in practice.

~Andrew


--------------2EB97A3796532B28A5BE1107
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">
      <pre>On 30/07/2019 10:44, Jan Beulich wrote:</pre>
    </div>
    <blockquote type="cite"
      cite="mid:3a6217c6-25d3-3882-99da-846a957d4c02@suse.com">
      <pre class="moz-quote-pre" wrap="">On 29.07.2019 14:12, Andrew Cooper wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">There is no need to use runtime variable-length clearing when MAX_NUMNODES is
known to the compiler.  Drop these functions and use the initialisers instead.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The only slight concern I have with this is that it further locks
down the maximum remaining to be a compile time constant. But this
is not an objection, just a remark.</pre>
    </blockquote>
    <pre>
The maximum number of nodes I'm aware of at all is 10, and we currently default to 64.</pre>
    <pre>
I don't think it is likely that we'll get to a point where a runtime nodesize is a realistic consideration that we would want to take.</pre>
    <pre>
</pre>
    <blockquote type="cite"
      cite="mid:3a6217c6-25d3-3882-99da-846a957d4c02@suse.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">@@ -67,7 +65,34 @@ typedef struct { DECLARE_BITMAP(bits, MAX_NUMNODES); } nodemask_t;
  
  #define nodemask_bits(src) ((src)-&gt;bits)
  
-extern nodemask_t _unused_nodemask_arg_;
+#define NODEMASK_LAST_WORD BITMAP_LAST_WORD_MASK(MAX_NUMNODES)
+
+#define NODEMASK_NONE                                                   \
+((nodemask_t) {{                                                        \
+        [0 ... BITS_TO_LONGS(MAX_NUMNODES) - 1] = 0                     \
+}})
+
+#if MAX_NUMNODES &lt;= BITS_PER_LONG
+
+#define NODEMASK_ALL      ((nodemask_t) {{ NODEMASK_LAST_WORD }})
+#define NODEMASK_OF(node) ((nodemask_t) {{ 1UL &lt;&lt; (node) }})
+
+#else /* MAX_NUMNODES &gt; BITS_PER_LONG */
+
+#define NODEMASK_ALL                                                    \
+((nodemask_t) {{                                                        \
+        [0 ... BITS_TO_LONGS(MAX_NUMNODES) - 2] = ~0UL,                 \
+        [BITS_TO_LONGS(MAX_NUMNODES) - 1] = NODEMASK_LAST_WORD          \
+}})
+
+#define NODEMASK_OF(node)                                               \
+({                                                                      \
+    nodemask_t m = NODES_NONE;                                          \
+    m.bits[(node) / BITS_PER_LONG] = 1UL &lt;&lt; ((node) % BITS_PER_LONG);   \
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think you will want to avoid the double evaluation of "node"
here. With this taken care of
Reviewed-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <pre>
I'm afraid this is a bit more complicated after I spotted another opencoding of NODEMASK_OF().</pre>
    <pre>
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c</pre>
    <pre>index 00b64c3322..24af9bc471 100644</pre>
    <pre>--- a/xen/arch/arm/smpboot.c</pre>
    <pre>+++ b/xen/arch/arm/smpboot.c</pre>
    <pre>@@ -46,7 +46,7 @@ struct cpuinfo_arm cpu_data[NR_CPUS];</pre>
    <pre> register_t __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = MPIDR_INVALID };</pre>
    <pre> </pre>
    <pre> /* Fake one node for now. See also include/asm-arm/numa.h */</pre>
    <pre>-nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };</pre>
    <pre>+nodemask_t __read_mostly node_online_map = NODEMASK_OF(0);</pre>
    <pre> </pre>
    <pre> /* Xen stack for bringing up the first CPU. */</pre>
    <pre> static unsigned char __initdata cpu0_boot_stack[STACK_SIZE]</pre>
    <pre>diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c</pre>
    <pre>index 7473f83b7b..9a55c013e5 100644</pre>
    <pre>--- a/xen/arch/x86/numa.c</pre>
    <pre>+++ b/xen/arch/x86/numa.c</pre>
    <pre>@@ -47,7 +47,7 @@ nodeid_t apicid_to_node[MAX_LOCAL_APIC] = {</pre>
    <pre> };</pre>
    <pre> cpumask_t node_to_cpumask[MAX_NUMNODES] __read_mostly;</pre>
    <pre> </pre>
    <pre>-nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };</pre>
    <pre>+nodemask_t __read_mostly node_online_map = NODEMASK_OF(0);</pre>
    <pre> </pre>
    <pre> bool numa_off;</pre>
    <pre> s8 acpi_numa = 0;</pre>
    <pre>diff --git a/xen/include/xen/nodemask.h b/xen/include/xen/nodemask.h</pre>
    <pre>index 9933fec5c4..c474dca3f0 100644</pre>
    <pre>--- a/xen/include/xen/nodemask.h</pre>
    <pre>+++ b/xen/include/xen/nodemask.h</pre>
    <pre>@@ -86,11 +86,9 @@ typedef struct { DECLARE_BITMAP(bits, MAX_NUMNODES); } nodemask_t;</pre>
    <pre> }})</pre>
    <pre> </pre>
    <pre> #define NODEMASK_OF(node)                                               \</pre>
    <pre>-({                                                                      \</pre>
    <pre>-    nodemask_t m = NODES_NONE;                                          \</pre>
    <pre>-    m.bits[(node) / BITS_PER_LONG] = 1UL &lt;&lt; ((node) % BITS_PER_LONG);   \</pre>
    <pre>-    m;                                                                  \</pre>
    <pre>-})</pre>
    <pre>+((nodemask_t) {{                                                        \</pre>
    <pre>+        [(node) / BITS_PER_LONG] = 1UL &lt;&lt; ((node) % BITS_PER_LONG)      \</pre>
    <pre>+}})</pre>
    <pre> </pre>
    <pre> #endif /* MAX_NUMNODES */</pre>
    <pre> </pre>
    <pre>
and to be used as a static initialiser, NODEMASK_OF() needs to be an ICE and can't use ({}) .</pre>
    <pre>
I don't see a way to avoid expanding node twice, but given that its wrapper is in ALL_CAPS and obviously a macro.</pre>
    <pre>
Furthermore, experimenting with a deliberate attempt to provoke this, I got </pre>
    <pre>
numa.c: In function ‘numa_initmem_init’:</pre>
    <pre>/local/xen.git/xen/include/xen/nodemask.h:90:10: error: nonconstant array index in initializer</pre>
    <pre>         [(node) / BITS_PER_LONG] = 1UL &lt;&lt; ((node) % BITS_PER_LONG)      \</pre>
    <pre>          ^</pre>
    <pre>numa.c:274:23: note: in expansion of macro ‘NODEMASK_OF’</pre>
    <pre>     node_online_map = NODEMASK_OF(foo++);</pre>
    <pre>                       ^~~~~~~~~~~</pre>
    <pre>/local/xen.git/xen/include/xen/nodemask.h:90:10: note: (near initialization for ‘(anonymous).bits’)</pre>
    <pre>         [(node) / BITS_PER_LONG] = 1UL &lt;&lt; ((node) % BITS_PER_LONG)      \</pre>
    <pre>          ^</pre>
    <pre>numa.c:274:23: note: in expansion of macro ‘NODEMASK_OF’</pre>
    <pre>     node_online_map = NODEMASK_OF(foo++);</pre>
    <pre>                       ^~~~~~~~~~~</pre>
    <pre>
from GCC 6.3, which I think covers everything we need, and will prevent side effects from double expansion in practice.</pre>
    <pre>
~Andrew</pre>
  </body>
</html>

--------------2EB97A3796532B28A5BE1107--


--===============1250171304567417304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1250171304567417304==--

