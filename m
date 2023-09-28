Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF717B1025
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 02:54:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609237.948200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlfHy-0003VW-Bn; Thu, 28 Sep 2023 00:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609237.948200; Thu, 28 Sep 2023 00:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlfHy-0003TV-97; Thu, 28 Sep 2023 00:53:58 +0000
Received: by outflank-mailman (input) for mailman id 609237;
 Thu, 28 Sep 2023 00:53:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OL7R=FM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qlfHx-0003TN-26
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 00:53:57 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f735298-5d99-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 02:53:55 +0200 (CEST)
Received: from AS9PR04CA0163.eurprd04.prod.outlook.com (2603:10a6:20b:530::19)
 by DU0PR08MB8884.eurprd08.prod.outlook.com (2603:10a6:10:47f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 28 Sep
 2023 00:53:44 +0000
Received: from AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:530:cafe::90) by AS9PR04CA0163.outlook.office365.com
 (2603:10a6:20b:530::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.23 via Frontend
 Transport; Thu, 28 Sep 2023 00:53:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT043.mail.protection.outlook.com (100.127.140.160) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Thu, 28 Sep 2023 00:53:43 +0000
Received: ("Tessian outbound 9aeaca65ec26:v211");
 Thu, 28 Sep 2023 00:53:43 +0000
Received: from bc662198a024.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CA0DA8B2-B16B-4D6A-B198-DCE3665446F3.1; 
 Thu, 28 Sep 2023 00:53:36 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bc662198a024.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 28 Sep 2023 00:53:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB9731.eurprd08.prod.outlook.com (2603:10a6:10:45d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 00:53:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 00:53:32 +0000
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
X-Inumbo-ID: 7f735298-5d99-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XD0k6XY3UGd1KI6ghs3WdoJL5f1kSZPTQvp2UdKnIw=;
 b=p9XX2+x5mb/9Z0rObHwiU7NWUaMhz0l0Af0kd4ezOwXmUXvSbuGC/eTI9fvBZWCqthBNdz9ZJ/zfdDdTMfbgLwRp1fzQV1/xoejBoT0PiTeiPw4tnYgcHFs+NB+0lN8AfVj7j+5y9Bq0marxaSH2UTkoifyCb89227ukzBy0zC0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: dd2577846dd9516f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGRJlxaHHhPUBmclXBVFdfnoEliyYVfai9dfeO4XBg8C+/8sA4sKCCM23M1vNJTaZ+isaOPWKpI8TpjVv8G5hDwEigWRTscVzPGrPah5nt30/0C/joXhXIK3/8zj8/yjIOimRECXzP7one8kBC1S/PK6wMOmWi+GSnMmKCVkip1IkNGKbr/+xkIiz7SPuWj7X+yOiacZ31Jss+/7mQR7XJu/2bW1YbPaMXOxD3FzYERX0eYsRhswQTD4GmTFOYPQT+4xSk9yHpsmAqrPZrYB52kT/LKxjDvMWHIXqYtveHcu4Wt/91npr26oYDxtcxXhWLCsdQk+xBA3HgftiY8OIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XD0k6XY3UGd1KI6ghs3WdoJL5f1kSZPTQvp2UdKnIw=;
 b=aD2+3uJwBKlXH9wTxQ1fjafaaOaBL75BdGd14+966fKFUTR4dBvjv+K4NaADAk3Hw1i+3CTytWLbGUBKfdJVtJVSK0UloLMjXs61qej0OgH+P2sgNeOGhw1+xTY3qBHFxNkHJehFhxZkQeOC5Eau5uXAp/Wddd/pt3cUEEhEF8k8GR1Q3EnVPo9U1IAj8rrGu78fFo2qhb3h6FmcPUMvsUPn79cZ86DRflDNbbScXTjOOvMZOio+owjFYOasbqCxH5RSVswGdMT2ryWlXhW5olnmaI0hVqqQkU4E5s1pDnT+upbixzrw6RSLAPx4j5Y0fDmsmspsxu3BBclxM/LVlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XD0k6XY3UGd1KI6ghs3WdoJL5f1kSZPTQvp2UdKnIw=;
 b=p9XX2+x5mb/9Z0rObHwiU7NWUaMhz0l0Af0kd4ezOwXmUXvSbuGC/eTI9fvBZWCqthBNdz9ZJ/zfdDdTMfbgLwRp1fzQV1/xoejBoT0PiTeiPw4tnYgcHFs+NB+0lN8AfVj7j+5y9Bq0marxaSH2UTkoifyCb89227ukzBy0zC0=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Michal Orzel <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "consulting@bugseng.com"
	<consulting@bugseng.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v2 2/3] docs: make the docs for MISRA C:2012 Dir 4.1
 visible to ECLAIR
Thread-Topic: [XEN PATCH v2 2/3] docs: make the docs for MISRA C:2012 Dir 4.1
 visible to ECLAIR
Thread-Index: AQHZ8ShxJs2WsoZlEkeaevb5QFdHibAvaOaAgAABIYA=
Date: Thu, 28 Sep 2023 00:53:30 +0000
Message-ID: <1BCB1493-218E-44D0-88D9-6B42B8DEC439@arm.com>
References: <cover.1695801813.git.nicola.vetrini@bugseng.com>
 <4e25395c844a312556303e3484a915e875e0e5a7.1695801813.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2309271749110.1996340@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2309271749110.1996340@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB9731:EE_|AM7EUR03FT043:EE_|DU0PR08MB8884:EE_
X-MS-Office365-Filtering-Correlation-Id: e454d13c-6b81-4249-b6d9-08dbbfbd5d48
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SnBkTmnyajBlNs+bi3GTFCZlfDEBXdrkpPrVY2NYXvVzBP8tL3kqBgoJUMGt/OxndvUYul2MRrhsdCjx3CjFzDuvpnndhQ8zvwibHZTPz/PQaaVYOv+odI88MYv9nZQ/Qr1DS0QUHLu7So1LWtLDPsfKQ/yD7dnIwZ39MZX/85E7agpAjmIBeXZ05D1Gc2v15YHqtGLj27d6MxwU8hSyuunINkdq8nQOJcatKl22SeLv/uszkHbsUYrUl6dU8Z8UB2wACgbFK68NFfm57a0d0QoAU/dLfZGWSV5jdzZgTyqSXSq0O81nFPIsHs0EkENEETeENex74mCrb11j0v2McPU4hKPuG1gowk7JAADqEBJ6bHfrEC78HSACKdPXOYFRLuVDZmBPmSPyyjG5RuL/d1vJxOAAoCi3eJDIHoSl8fhScOXcXPvVgoMnrFfnEua44IAiP2+ffNsG+m3m5yQGamEpRHA8Eo4NpTm9xDd5DdFoRKceR3p0SzekNnasOfgGs8SfFkI8t672SksBlzd48QWTmsiuNtKIdZJWPXvVKWyHjF0eCwSfqjuQdLUHETvvTqAPGumPFZHHgoBjCiswKZMk7dla0tWXtMVrzPJUys36yuwUKZw3Al1k8SoZsJZxjMjlIzEJODYHETfxQ9oFZg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(39860400002)(376002)(396003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(2616005)(6512007)(53546011)(6506007)(5660300002)(6486002)(4326008)(26005)(83380400001)(8936002)(8676002)(2906002)(7416002)(91956017)(316002)(54906003)(66556008)(66476007)(66946007)(66446008)(64756008)(76116006)(41300700001)(478600001)(6916009)(86362001)(38070700005)(122000001)(36756003)(38100700002)(33656002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F2614D1590234F4C94B787D5F0B31C9C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9731
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	da393f87-101d-4e67-fce1-08dbbfbd552a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TI1RbiSM60cgg94MmPQCMtL8XBQMej2Sk0Xj51gCARictXGE6FXaJFdo9s2WZFNu4KAkAaJqFiE+FDryXpRU8YrYAMvD5vysNn4neZ/I1PI/jSnkWN7zGMqfUjKf/QS68gCewo8EBO5KCydjiyHyh9x7IEoXSDBiVT86X3V+ekoaPzBo1pFSbcY6BoSI20njGZS82To++zN6wXEKVAQwc4KzfsqHFYXrwDXNtPgkXeDy38dQ4KWRIuclAU2xJ3T5N8a9I3PCCmAye2kgNd/nDtz6c0IzSTpTClQzvpdk4KpM758u6qd+XX8fDgo/IJ7M6sguMxoTnakwVh0967+Im3P2TXYGnGWvpL801ScRzDeF+vxbojD+msGS23JPgcCKTZmNoQ6SFZJAvBNJbLgP7g4lNpbDPumB27HiPvhggv4nQ3u+GtQ1/HWeDw5qxTopupBjvDDVRQnSMbGsQwsnDMfGM1ZNEjeYaf2aVDF+07+M5grlGLTvhb6Z+/3bkKbdbetjU+eQjsNqWpy5rWnozIK+a+aofDlJGklfSF1xujWBcFJGaoZ0LoZuuq7vN4/4tFQytlYOgyfBZubvOd3MGiYiuqN0BMlw73ujFlflC/xP6ySTSAtSjTxjwkPR+hNYh9muVQEnr9w3py3WQc53chigqin2Mbu7hz1xufAevFRKq1RVaF05qMwJe98e/hAKRSkQpVw0dewchsoEImrRmS9IPY6E8yB2IScvCNBKAGnJR82RifKDwshV1wiZqUvO
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(230922051799003)(64100799003)(186009)(82310400011)(451199024)(1800799009)(36840700001)(40470700004)(46966006)(40460700003)(2906002)(33656002)(47076005)(26005)(2616005)(53546011)(336012)(6486002)(36756003)(6506007)(83380400001)(36860700001)(6512007)(478600001)(86362001)(82740400003)(81166007)(356005)(40480700001)(70586007)(5660300002)(70206006)(54906003)(4326008)(8936002)(316002)(8676002)(6862004)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 00:53:43.7359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e454d13c-6b81-4249-b6d9-08dbbfbd5d48
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8884



> On Sep 28, 2023, at 08:49, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> On Wed, 27 Sep 2023, Nicola Vetrini wrote:
>> To be able to check for the existence of the necessary subsections in
>> the documentation for MISRA C:2012 Dir 4.1, ECLAIR needs to have a sourc=
e
>> file that is built.
>>=20
>> This file is generated from 'C-runtime-failures.rst' in docs/misra
>> and the configuration is updated accordingly.
>>=20
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry
>=20
>=20
>> ---
>> Changes from RFC:
>> - Dropped unused/useless code
>> - Revised the sed command
>> - Revised the clean target
>>=20
>> Changes in v2:
>> - Added explanative comment to the makefile
>> - printf instead of echo
>> ---
>> docs/Makefile       |  7 ++++++-
>> docs/misra/Makefile | 22 ++++++++++++++++++++++
>> 2 files changed, 28 insertions(+), 1 deletion(-)
>> create mode 100644 docs/misra/Makefile
>>=20
>> diff --git a/docs/Makefile b/docs/Makefile
>> index 966a104490ac..ff991a0c3ca2 100644
>> --- a/docs/Makefile
>> +++ b/docs/Makefile
>> @@ -43,7 +43,7 @@ DOC_PDF  :=3D $(patsubst %.pandoc,pdf/%.pdf,$(PANDOCSR=
C-y)) \
>> all: build
>>=20
>> .PHONY: build
>> -build: html txt pdf man-pages figs
>> +build: html txt pdf man-pages figs misra
>>=20
>> .PHONY: sphinx-html
>> sphinx-html:
>> @@ -66,9 +66,14 @@ endif
>> .PHONY: pdf
>> pdf: $(DOC_PDF)
>>=20
>> +.PHONY: misra
>> +misra:
>> + $(MAKE) -C misra
>> +
>> .PHONY: clean
>> clean: clean-man-pages
>> $(MAKE) -C figs clean
>> + $(MAKE) -C misra clean
>> rm -rf .word_count *.aux *.dvi *.bbl *.blg *.glo *.idx *~
>> rm -rf *.ilg *.log *.ind *.toc *.bak *.tmp core
>> rm -rf html txt pdf sphinx/html
>> diff --git a/docs/misra/Makefile b/docs/misra/Makefile
>> new file mode 100644
>> index 000000000000..8fd89404e96b
>> --- /dev/null
>> +++ b/docs/misra/Makefile
>> @@ -0,0 +1,22 @@
>> +TARGETS :=3D C-runtime-failures.o
>> +
>> +all: $(TARGETS)
>> +
>> +# This Makefile will generate the object files indicated in TARGETS by =
taking
>> +# the corresponding .rst file, converting its content to a C block comm=
ent and
>> +# then compiling the resulting .c file. This is needed for the file's c=
ontent to
>> +# be available when performing static analysis with ECLAIR on the proje=
ct.
>> +
>> +# sed is used in place of cat to prevent occurrences of '*/'
>> +# in the .rst from breaking the compilation
>> +$(TARGETS:.o=3D.c): %.c: %.rst
>> + printf "/*\n\n" > $@.tmp
>> + sed -e 's|\*/|*//*|g' $< >> $@.tmp
>> + printf "\n\n*/" >> $@.tmp
>> + mv $@.tmp $@
>> +
>> +%.o: %.c
>> + $(CC) -c $< -o $@
>> +
>> +clean:
>> + rm -f C-runtime-failures.c *.o *.tmp
>> --=20
>> 2.34.1
>>=20


