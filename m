Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ABE7AFDFC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 10:15:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608720.947379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlPhN-0005wo-Ih; Wed, 27 Sep 2023 08:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608720.947379; Wed, 27 Sep 2023 08:15:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlPhN-0005tw-F8; Wed, 27 Sep 2023 08:15:09 +0000
Received: by outflank-mailman (input) for mailman id 608720;
 Wed, 27 Sep 2023 08:15:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gzin=FL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qlPhM-0005tY-0Z
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 08:15:08 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f69c064f-5d0d-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 10:15:05 +0200 (CEST)
Received: from AM5PR0301CA0013.eurprd03.prod.outlook.com
 (2603:10a6:206:14::26) by DBAPR08MB5734.eurprd08.prod.outlook.com
 (2603:10a6:10:1aa::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Wed, 27 Sep
 2023 08:14:56 +0000
Received: from AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::b) by AM5PR0301CA0013.outlook.office365.com
 (2603:10a6:206:14::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Wed, 27 Sep 2023 08:14:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT056.mail.protection.outlook.com (100.127.140.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.19 via Frontend Transport; Wed, 27 Sep 2023 08:14:54 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Wed, 27 Sep 2023 08:14:54 +0000
Received: from 15032fe38d38.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3AB37795-4FBF-4633-9593-DF02B7DDCBE6.1; 
 Wed, 27 Sep 2023 08:14:48 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 15032fe38d38.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Sep 2023 08:14:48 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PA4PR08MB7457.eurprd08.prod.outlook.com (2603:10a6:102:2a4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 08:14:46 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb%2]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 08:14:46 +0000
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
X-Inumbo-ID: f69c064f-5d0d-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OWwdHE+5nPN1Ez2Vi00nQLfXpZC3JOsw9blE00uEUQ=;
 b=Xi9UvJoAIYcLS+39zYcSg7ODBij6gv27C8zb7VgCLY2cg+Te1GhKBJxoajzgROTBPan+JKCEK4GU0PGh45EiHGDQcsXGsXCPS4gyXKQMFpU7DGv6TKjWMrivoITdZ23suyZMlAL4osoC4oxQsoYt0VHKEJFLCCQPLYPjBth/20M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3322e0bae34c8947
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tyxh9TYn0pE4U02JePoD7Dv+QxWEm/icD4fojg5S/Jhl01iWPqcCFhPgVySZ5OpHqC8W2NJOxku8Ky85FgU1lbElZEMwgcnxlCu2MyHVLb1hc2PyVqv62yqUPj8BRMf+S4Up686zVdWFUL4f1QY2GhHL81C3AhZ8BER2pxxLexkj17yYW+N6pbj5F5nWgbsgfufkWcZR/TRZ/LLXYoXwMKWw1gZy9uYnfO5qdALTc7RuhjO6Ttpjyk92+9iT/00JNgAfbSXwO9EfJsXkJsVmmBEw7EhoXF+uN9N967B9EVx0se+4jF4XSv6nRmqS+SQ+uT396Q6nRHLuGxa3f7QcjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OWwdHE+5nPN1Ez2Vi00nQLfXpZC3JOsw9blE00uEUQ=;
 b=YEDP8tCO0VlZ4peDaw0UPyIBBY3jsAG8H0pQZ1wjmc+N065Er+9KLvXS/GwjZ3tra71YvhJgQjkUBXhU0eGaXE6ia2sMkBnvBw6c0hf9WJ/R+jPT/V1VSZl7QUfGP276liOjpRbe9hSFPu9dLf/vaMQHei3FU+D+0grDu0Y0IVjOsrtHybwWAaFcfQE8DTPQZboOq0W779GDNce8K5OaUSlJPvBuQaS3EGix1EUwpMSSgo4u/blPdnQZibHwAKbxgiviLsOiK55PtLT9sg9WSbM0n4BpJVmAjW8iSHokP6KIjqWgUj6jwQ1Ks/fwEjvIEb1qyXqekJwX7zt7K/xGcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OWwdHE+5nPN1Ez2Vi00nQLfXpZC3JOsw9blE00uEUQ=;
 b=Xi9UvJoAIYcLS+39zYcSg7ODBij6gv27C8zb7VgCLY2cg+Te1GhKBJxoajzgROTBPan+JKCEK4GU0PGh45EiHGDQcsXGsXCPS4gyXKQMFpU7DGv6TKjWMrivoITdZ23suyZMlAL4osoC4oxQsoYt0VHKEJFLCCQPLYPjBth/20M=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "roberto.bagnara@bugseng.com"
	<roberto.bagnara@bugseng.com>, "julien@xen.org" <julien@xen.org>, Stefano
 Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v3] docs/misra: add rule 2.1 exceptions
Thread-Topic: [PATCH v3] docs/misra: add rule 2.1 exceptions
Thread-Index: AQHZ4qiwUwH3koR9JUa91LeAyizAArAVxOqAgACZsICAGAuKgIAABdgA
Date: Wed, 27 Sep 2023 08:14:46 +0000
Message-ID: <BEAF1369-C1FE-4B81-A0A1-5A4F39426E9E@arm.com>
References: <20230908230318.1719290-1-sstabellini@kernel.org>
 <91d5ea6d-bdfa-45bf-a54b-5acdf1784ec4@xen.org>
 <alpine.DEB.2.22.394.2309111740160.1847660@ubuntu-linux-20-04-desktop>
 <156fac1ee8e37cddac95813f72a108e0@bugseng.com>
In-Reply-To: <156fac1ee8e37cddac95813f72a108e0@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PA4PR08MB7457:EE_|AM7EUR03FT056:EE_|DBAPR08MB5734:EE_
X-MS-Office365-Filtering-Correlation-Id: 91c7c1cc-883e-4f29-726e-08dbbf31d4f1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lrrvWw69JZ6rYAZssx2wQA7iVQ/BPnj9Axs1mrM9PoBokmDTzeFuNoK+Zp9YBxQ+yrLY9AfB/tsTPJ+VNMF0Kb6e/hKDit2UBmR3VE+Y5EtW97K8ZJvrqYe0akx9JPiRhewKrg0Tj+TXKF411gC4hfIogMxteJrGvd3P0puNPxQVUqCC6GALU4veuPMc2hA42abcMjrM2gOgh5qyahaKojxsvbLv6AJX9Ny01Kcrb8KrEposRtJ5V5/NRtgXtIjewBaIUZ9LTCLOis+lvrgTIpbmiWjms/J84VHs5gcMi0UPig5dvbywrEloKE760iyuJsTawAhd1j9wx2O2HzAGmYfkVSb6zCj8R/pddm5AP8qfRk4HIvDZsEbrFg0Uylrpc573sXV/JB/rz0GF8nNAhkpVrVWdxbA+HaTglWXLGD36ffkeQf+xCYjcnVOSALBIUw8QtY6/hOZHjabc8KrKG55uR3u1Ukbr/x40Mv7qbvuH73XTYiO1YAifuW/7CDnVsSj+U1VxBgohdYNL3DA3S0U/BOuRSrEHbiOb3EudTRBS4LWSvMdyPMVRDrQ/fVStY18GTmZ48wFNyVAKdp61xT+ks8FE3SKOaBX1BgDUQFGuB8URsI91GvhsZLJA/1UQnkPb9bhtKyHKhvFhAci/ug==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(366004)(39860400002)(136003)(230922051799003)(1800799009)(186009)(451199024)(6506007)(2906002)(6486002)(122000001)(7416002)(38100700002)(38070700005)(66946007)(91956017)(76116006)(6512007)(66446008)(64756008)(66476007)(66556008)(5660300002)(71200400001)(53546011)(8936002)(54906003)(4326008)(6916009)(478600001)(316002)(8676002)(41300700001)(2616005)(86362001)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <59A0F4BF0339064199979225A3A79BDF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7457
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d8133308-a0e8-4a40-ceb8-08dbbf31cfc7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Aznx31dKPdRa05xdDsze77/7L+yqVnkEsr3UQIkeju56odj4ZP8cp7UFH7sfUTq7Mps8LiFMP3pXWUFv2DdODfi/5JPWG1SuAqAQA+7dtUeXekpf4vuyKiDjwsHEVlsWNyE139zxfgkmQgFjaum+OWQeDhr7cJiasxamUb/GGaeGTQQ3pXkA2hBfyhC/9rs7iYQDXjI6ejDwjBD87PnLLA/3rnWatajcwxoF9WzL2itp3nSxDU0ng5go6xwkZkz2a3oVJCBJaBTMAxQA0jvsXjITnCMtdYW5ffgRL4Ss34WexhnwI2dwvNQ5eGQPOtcIJEvu9lBLjiiJZ5cy/X5//6hLw5tnjOivMlLn2MZCZV2ZhIu2QZtV8nqfHA+lqEdWddXsz8YKqVwFOCeX8PW83IVrjMiIfYoZwINV+o77Qr7BOS59gfmpObCWP+hBd5Lk2/EtDx8djUJ9XlMwwyJqbFQ0K8IG2dtsDdT+UgxSj08P98W4KXRb7BYUlvoq8aJk3vXE+TqMfOc+3u0prdbkIsRothXCRgWR+zGJPNBNigVMM205KgPaDfoOqBmB6WAsXvR5kAs0UjyxNPsgjSPXaZfRaN9sPX3SJOQh3AmaUllvarSaSyCTCtVRsDvVrfOJh5ZZe9297LHl1GlAN7xqMWXLycyhStRfYKxCzJN7dpe8Kc6kZTLYVrUkoffYX/xmejMwbF15ZarGe8dt8SKRAA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39850400004)(396003)(136003)(230922051799003)(1800799009)(451199024)(186009)(82310400011)(46966006)(36840700001)(82740400003)(356005)(6512007)(40480700001)(6486002)(6506007)(81166007)(53546011)(26005)(2616005)(5660300002)(4326008)(6862004)(8676002)(8936002)(86362001)(33656002)(2906002)(316002)(36756003)(70586007)(41300700001)(70206006)(54906003)(478600001)(36860700001)(47076005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 08:14:54.9328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c7c1cc-883e-4f29-726e-08dbbf31d4f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5734

Hi,

> On 27 Sep 2023, at 09:53, Nicola Vetrini <nicola.vetrini@bugseng.com> wro=
te:
>=20
>>> > diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
>>> > index 695d2fa1f1..2a8527cacc 100644
>>> > --- a/xen/arch/arm/psci.c
>>> > +++ b/xen/arch/arm/psci.c
>>> > @@ -59,6 +59,7 @@ void call_psci_cpu_off(void)
>>> >       }
>>> >   }
>>> >   +/* SAF-2-safe */
>>> I think any use of SAF-2-safe should be accompanied with an attribute..=
.
>>> >   void call_psci_system_off(void)
>>> ... noreturn for function or ...
>>> >   {
>>> >       if ( psci_ver > PSCI_VERSION(0, 1) )
>>> > diff --git a/xen/arch/x86/shutdown.c b/xen/arch/x86/shutdown.c
>>> > index 7619544d14..47e0f59024 100644
>>> > --- a/xen/arch/x86/shutdown.c
>>> > +++ b/xen/arch/x86/shutdown.c
>>> > @@ -118,6 +118,7 @@ static inline void kb_wait(void)
>>> >               break;
>>> >   }
>>> >   +/* SAF-2-safe */
>>> >   static void noreturn cf_check __machine_halt(void *unused)
>>> >   {
>>> >       local_irq_disable();
>>> > diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
>>> > index e8a4eea71a..d47c54f034 100644
>>> > --- a/xen/include/xen/bug.h
>>> > +++ b/xen/include/xen/bug.h
>>> > @@ -117,6 +117,7 @@ struct bug_frame {
>>> >   #endif
>>> >     #ifndef BUG
>>> > +/* SAF-2-safe */
>>> >   #define BUG() do {                                              \
>>> >       BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, NULL);      \
>>> >       unreachable();                                              \
>>> ... unreachable for macros. But the /* SAF-2-safe */ feels a little bit
>>> redundant when a function is marked as 'noreturn'.
>>> Is there any way to teach eclair about noreturn?
>> Actually I had the same thought while writing this patch. If we can
>> adopt unreachable and noreturn consistently maybe we don't need
>> SAF-2-safe. If the checker can support it.
>> Nicola, what do you think?
>=20
> A couple of remarks:
> - if you put the noreturn attribute on some functions, then surely the co=
de after those is
> reported as unreachable. ECLAIR should pick up all forms of noreturn auto=
matically; otherwise, a simple configuration can be used.
>=20
> - Note that the cause of unreachability in the vast majority of cases is =
the call to
> __builtin_unreachable(), therefore a textual deviation on the definition =
of unreachable, plus
> a bit of ECLAIR configuration, can deviate it (to be clear, just the SAF =
comment is not
> sufficient, since deviations comments are meant to be applied at the top =
expansion location,
> which is not on the macro definition).
> This is what it should look like, roughly:
>=20
> -config=3DMC3R1.R2.1,reports+=3D{deliberate, "any_area(any_loc(text(^<REG=
EX>$, -1)))"}
>=20
> #if (!defined(__clang__) && (__GNUC__ =3D=3D 4) && (__GNUC_MINOR__ < 5))
> /* SAF-2-safe */
> #define unreachable() do {} while (1)
> #else
> /* SAF-2-safe */
> #define unreachable() __builtin_unreachable()
> #endif
>=20
> where REGEX will match the translation of SAF-2-safe.
>=20
> However, this will then entail that *some* SAF comments are treated speci=
ally and, moreover,
> that some modification to the definition of unreachable won't work
> (e.g.
> #define M() __builtin_unreachable()
> /* SAF-2-safe */
> #define unreachable() M()
>=20
> My opinion is that it's far easier for this to be an eclair configuration=
 (which has the
> advantage not to depend on the exact definition of unreachable) and then =
perhaps a comment
> above it explaining the situation.

I agree here and it is easier to make an overall exception where we list th=
e cases
where this is acceptable (ie all flavors of unreacheable) and document that=
 eclair
was configured using "xxxx" to handle this.

Cheers
Bertrand

>=20
> --=20
> Nicola Vetrini, BSc
> Software Engineer, BUGSENG srl (https://bugseng.com)



