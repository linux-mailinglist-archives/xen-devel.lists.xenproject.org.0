Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CEF4E240F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 11:14:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292883.497385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWF3K-00065Y-NE; Mon, 21 Mar 2022 10:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292883.497385; Mon, 21 Mar 2022 10:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWF3K-000634-K5; Mon, 21 Mar 2022 10:14:18 +0000
Received: by outflank-mailman (input) for mailman id 292883;
 Mon, 21 Mar 2022 10:14:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f0xq=UA=arm.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1nWF3I-00062y-QM
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 10:14:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a871be2b-a8ff-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 11:14:14 +0100 (CET)
Received: from AS8PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:20b:310::9)
 by AM6PR08MB4375.eurprd08.prod.outlook.com (2603:10a6:20b:b8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Mon, 21 Mar
 2022 10:14:12 +0000
Received: from AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::10) by AS8PR04CA0004.outlook.office365.com
 (2603:10a6:20b:310::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22 via Frontend
 Transport; Mon, 21 Mar 2022 10:14:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT058.mail.protection.outlook.com (10.152.17.48) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Mon, 21 Mar 2022 10:14:12 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Mon, 21 Mar 2022 10:14:11 +0000
Received: from d0ff7f0fb02e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 32E76A98-649E-49EF-85B1-C239D0402102.1; 
 Mon, 21 Mar 2022 10:14:05 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d0ff7f0fb02e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Mar 2022 10:14:05 +0000
Received: from AM6PR08MB3814.eurprd08.prod.outlook.com (2603:10a6:20b:88::19)
 by DBBPR08MB4233.eurprd08.prod.outlook.com (2603:10a6:10:d2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Mon, 21 Mar
 2022 10:14:03 +0000
Received: from AM6PR08MB3814.eurprd08.prod.outlook.com
 ([fe80::f8f3:189e:994f:737b]) by AM6PR08MB3814.eurprd08.prod.outlook.com
 ([fe80::f8f3:189e:994f:737b%4]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 10:14:03 +0000
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
X-Inumbo-ID: a871be2b-a8ff-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NwvDBMow/rQBTyS63u7otDUuMd4DK/tg7DDjtwvC5U=;
 b=7xPmPXkZ8e5LijuiSJu58xFT+bVupkAWVxdazYxx/d+tA4XEqU2exwOZ2NgP3Q/i7DGrwPZswKDipCmvxGgG76LFNXmsNz0+KottCPs8dh7wD9m1WDPH5k61x4B+x5qkfG0xxTae5+QiizBDKk6wpycjGc/ER/qZJtHfv67f/Es=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e83a0495008225e5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQ5urLXPBog84dpywlwDt3MsSsKduZkyLt3aWMFyH/G5Ui3YW7GXdFGMmYdf+LLd0I6XKlMECH8yB0doKqHx5wpGrDnTlRI+3L0dQy2NISwks8IE/XJdcu8svrpuTT7TycHu+iS6TXk0Dmz0RKdpv3OUii1cVFzhgMDhfrKHZq5GyJlHVbRP5OsqLBLtb5eFL/LyKBwdOh1O5vm+IhEnei1IFv++3m7xkDm3Fu6/MILsX6QpoC84t4LnR7++s5klT9FbDHaB7p5HIJHMERoE8liGGisRWrOKmD9bXERNsNTXTrjtzJES0RRLQqcoClYLsOGDm7eSTdXvC3hXjnNmRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NwvDBMow/rQBTyS63u7otDUuMd4DK/tg7DDjtwvC5U=;
 b=RaD7OU5xmcHCpvjBu/Cu6Jsj6PK+4e/MaK66Jl263VEZZWQG/4F0/Ort+or+p9fVsMeRNJCUTshoPLLtdFQvDzubxaly6S5TiZJaot/ObbJ/OhOaWb84LdELii8lnHloGhKP9lEeKwGw8jNr0SssU32XW6X43Zi/TM3uijBY3paOptVlhjku2zvpI1FiSrBuCvgaMiaITJ1tYsJ0YpBC2pcqb3kM1Pyojbe7mvJXbwX32ISeY/uXPj4/gLY0Mvy8icoKOlTJ/JVFjYe2F03C+XTWCYFBE3E/S4BJlQXsiHSfHfOoUazfLC3mvJIuZF1SXVTxdspK2Nfo/zEORWB83Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NwvDBMow/rQBTyS63u7otDUuMd4DK/tg7DDjtwvC5U=;
 b=7xPmPXkZ8e5LijuiSJu58xFT+bVupkAWVxdazYxx/d+tA4XEqU2exwOZ2NgP3Q/i7DGrwPZswKDipCmvxGgG76LFNXmsNz0+KottCPs8dh7wD9m1WDPH5k61x4B+x5qkfG0xxTae5+QiizBDKk6wpycjGc/ER/qZJtHfv67f/Es=
From: Michal Orzel <Michal.Orzel@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/3] xen: Introduce a header to store common linker
 scripts content
Thread-Topic: [PATCH 1/3] xen: Introduce a header to store common linker
 scripts content
Thread-Index: AQHYPPzaR1XKbiAEBEyYGbG4QOIoRKzJkESAgAAFt8o=
Date: Mon, 21 Mar 2022 10:14:03 +0000
Message-ID:
 <AM6PR08MB38148D3FB84D91DB089C48CC89169@AM6PR08MB3814.eurprd08.prod.outlook.com>
References: <20220321082114.49953-1-michal.orzel@arm.com>
 <20220321082114.49953-2-michal.orzel@arm.com>
 <cb61531a-5482-3aab-58bd-84f99f21ec48@suse.com>
In-Reply-To: <cb61531a-5482-3aab-58bd-84f99f21ec48@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: a358e974-3c30-8767-bb61-f541d8cfdcaf
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: be66f469-5330-445e-c7d6-08da0b238bc6
x-ms-traffictypediagnostic:
	DBBPR08MB4233:EE_|AM5EUR03FT058:EE_|AM6PR08MB4375:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB43758C9FE8DB380D3FA6155D89169@AM6PR08MB4375.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 O/9miEyXOxfCZKr0H1QpB7CzyrAUySWk5UEiTeYPkLAOIzSa+MrssCvgMcFsMalvCp9obBXDM4Ug3/iUYpqH+eYWrfUSNCW10jQ1uOMqN/e4hed6CDgoMic2Agvpo5VT9s7vRmG2RWnwgV71bPS1mJH1qMK5QDaC1iLU1zoUrzZVGFvW2iHCoTFcCmEAlvYIbNmhrcJ33q0tDr4+qZ1Md2kEhpDpDcb7ZSxHXFz9PwxqOgoiTz3pvGCkbYGnEVp326F2URd/vFwu3K6JCMIkvBrGSmNiA7cbjaSlZ2z3CbhAAaM7BOtkrCOD/F7dc0FTR2UxnKknOIdLri+3lVA7w/8/YugApHnwKSIMroqdfvMBXPhkA78NBm7rNsKznwJBCGAsQgiOg/3g1c1UI/5Jp3a3tWWvyWUTWv8zIMcot8foUFbvAoelpNbbe2wxHJwNAQzuyTmieAjF0hTLa6FqpppNd0L8Pi119qy/3df9BcBYof4gi9a3bB6KJNvpRUbhbu8kGNWir1aYoDp5wRvfk8/9PRmxwFI0pxtEQlgi0g/+LU37XiQHw5ca3UD44nVt+FHQdAh6cV9pKGPN+atCwdtbf/Uiwvq9q06Ede+2Ij2YRszScDZgzOd33wZHBj0jiSNjsMIwBSBVW3+h/AaBwJ7P8XBICd6DzGp2Ck3RXOc8MUsksh5lEdGsvpKisomGvxf12rDICLnHrX5pxp7gmg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3814.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(9686003)(55016003)(316002)(7696005)(53546011)(52536014)(6506007)(91956017)(66446008)(64756008)(8676002)(76116006)(4326008)(66556008)(66476007)(66946007)(83380400001)(86362001)(26005)(186003)(2906002)(122000001)(71200400001)(38100700002)(508600001)(54906003)(8936002)(5660300002)(6916009)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4233
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	87ffaf6d-9bd2-4675-d465-08da0b238696
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UQz74qEi94l3IbN881hE0gSDAbQX+Tv9HLL8Qb2nDTVoP9kdmZ9SeZxrIyemT3UWrwzWzG2yZ/jmeOaYGTdH/mF/6k3QzXw1ldsGllPk1rEk9od8A2AAdMDC/9OoGXnPfKxhzzadETK/PefWbAPIZHAWw+WdNbQpYqMC0itbUkgS8SqPbDldb7GenuXqWWACKVb9r2udB6IlnwvRRG38muQm24cOck6scAje757YRZKQ8zMMotXti3ucbF0LXIAn0iAfE15hVmjxbZQsrLOyxmUnqDyb3V0HwyRXjE5KNngTkkhp5ZwnjOPYnG7gTUkjoEiLFJ6ARU6kwx46IeFDN4VWuip9Im+Jm7g9gpr+Ap8KNaI303+rIe/qOXPDg2pdQOZN4j1AQHGOP3d1HhKoOb9QPSEblghKV2Umc7jVLpobiC6p30H2LrxebFmL2vX6rEhkhdYbDg/zvQavHz8k3izdD0NDkpAT57llhl5kcXRTMrifi97s1Z1sCJ8sxWDrwjgZQ3MlK1Yebl7LiuxDbp0klvZAbYo/Z78TxPczhMJaqKZvSKHwyjv1SRyphG6yy9W2JUZYVAcE30ZnYVTANZC8AlZGp6pjb2Gn2yo2LuSdBX+ot7BMUNC5lpmdqPZuZ+l1ClZUOgIw0wApONCkqX6cMMOGWXldpgcHpfV9XK1rPSEcPeEO15feKP4cWQAQ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(336012)(508600001)(40460700003)(316002)(26005)(82310400004)(186003)(5660300002)(86362001)(54906003)(33656002)(83380400001)(8936002)(2906002)(55016003)(53546011)(70206006)(70586007)(36860700001)(6862004)(4326008)(8676002)(47076005)(7696005)(6506007)(9686003)(356005)(81166007)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 10:14:12.2230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be66f469-5330-445e-c7d6-08da0b238bc6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4375

Hi Jan,=0A=
=A0=0A=
On 21.03.2022 09:21, Michal Orzel wrote:=0A=
> Both x86 and arm linker scripts share quite a lot of common content.=0A=
> It is difficult to keep syncing them up, thus introduce a new header=0A=
> in include/xen called xen_lds.h to store the internals mutual to all=0A=
> the linker scripts.=0A=
> =0A=
> Populate xen_lds.h with the first portion of the common sections.=0A=
> Some of them are not yet added/completed in arm linker script but they=0A=
> definitely should be. Please note that this patch does not aim to=0A=
> perform the full sync up between the linker scripts. It creates a base=0A=
> for further work.=0A=
> =0A=
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>=0A=
> ---=0A=
>=A0 xen/include/xen/xen_lds.h | 114 ++++++++++++++++++++++++++++++++++++++=
=0A=
>=A0 1 file changed, 114 insertions(+)=0A=
>=A0 create mode 100644 xen/include/xen/xen_lds.h=0A=
=0A=
While perhaps just minor, I'm not happy about new files added with undersco=
res=0A=
in their names. Dashes are easier to type. Plus, looking at Linux, it may m=
ake=0A=
sense to name this xen.lds.h.=0A=
=0A=
I'm ok to change the name to xen.lds.h.=0A=
=0A=
> --- /dev/null=0A=
> +++ b/xen/include/xen/xen_lds.h=0A=
> @@ -0,0 +1,114 @@=0A=
> +#ifndef __XEN_LDS_H__=0A=
> +#define __XEN_LDS_H__=0A=
> +=0A=
> +/*=0A=
> + * Common macros to be used in architecture specific linker scripts.=0A=
> + */=0A=
> +=0A=
> +/* Macros to declare debug sections. */=0A=
> +#ifdef EFI=0A=
> +/*=0A=
> + * Use the NOLOAD directive, despite currently ignored by (at least) GNU=
 ld=0A=
> + * for PE output, in order to record that we'd prefer these sections to =
not=0A=
> + * be loaded into memory.=0A=
> + */=0A=
> +#define DECL_DEBUG(x, a) #x ALIGN(a) (NOLOAD) : { *(x) }=0A=
> +#define DECL_DEBUG2(x, y, a) #x ALIGN(a) (NOLOAD) : { *(x) *(y) }=0A=
> +#else=0A=
> +#define DECL_DEBUG(x, a) #x 0 : { *(x) }=0A=
> +#define DECL_DEBUG2(x, y, a) #x 0 : { *(x) *(y) }=0A=
> +#endif=0A=
> +=0A=
> +/* DWARF debug sections. */=0A=
> +#define DWARF_DEBUG_SECTIONS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0 DECL_DEBUG(.debug_abbrev, 1)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0 DECL_DEBUG2(.debug_info, .gnu.linkonce.wi.*, 1) \=0A=
> +=A0 DECL_DEBUG(.debug_types, 1)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0 DECL_DEBUG(.debug_str, 1)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0 DECL_DEBUG2(.debug_line, .debug_line.*, 1)=A0=A0=A0=A0=A0 \=0A=
> +=A0 DECL_DEBUG(.debug_line_str, 1)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 \=0A=
> +=A0 DECL_DEBUG(.debug_names, 4)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0 DECL_DEBUG(.debug_frame, 4)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0 DECL_DEBUG(.debug_loc, 1)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0 DECL_DEBUG(.debug_loclists, 4)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 \=0A=
> +=A0 DECL_DEBUG(.debug_macinfo, 1)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 \=0A=
> +=A0 DECL_DEBUG(.debug_macro, 1)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0 DECL_DEBUG(.debug_ranges, 8)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0 DECL_DEBUG(.debug_rnglists, 4)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 \=0A=
> +=A0 DECL_DEBUG(.debug_addr, 8)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0 DECL_DEBUG(.debug_aranges, 1)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 \=0A=
> +=A0 DECL_DEBUG(.debug_pubnames, 1)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 \=0A=
> +=A0 DECL_DEBUG(.debug_pubtypes, 1)=0A=
> +=0A=
> +/*=0A=
> + * Stabs debug sections.=0A=
> + *=0A=
> + * LLVM ld also wants .symtab, .strtab, and .shstrtab placed. These look=
 to=0A=
> + * be benign to GNU ld, so we can have them here unconditionally.=0A=
> + */=0A=
> +#define STABS_DEBUG_SECTIONS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 \=0A=
> +=A0 .stab 0 : { *(.stab) }=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 \=0A=
> +=A0 .stabstr 0 : { *(.stabstr) }=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 \=0A=
> +=A0 .stab.excl 0 : { *(.stab.excl) }=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0 .stab.exclstr 0 : { *(.stab.exclstr) }=A0=A0=A0=A0 \=0A=
> +=A0 .stab.index 0 : { *(.stab.index) }=A0=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0 .stab.indexstr 0 : { *(.stab.indexstr) }=A0=A0 \=0A=
> +=A0 .comment 0 : { *(.comment) }=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 \=0A=
> +=A0 .symtab 0 : { *(.symtab) }=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 \=0A=
> +=A0 .strtab 0 : { *(.strtab) }=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 \=0A=
> +=A0 .shstrtab 0 : { *(.shstrtab) }=0A=
=0A=
Please don't add non-Stabs sections to this macro.=0A=
=0A=
Ok, I will add a new macro storing the last 4 sections called ELF_DETAILS_S=
ECTIONS,=0A=
to be coherent with what Linux does (ELF_DETAILS).=0A=
=0A=
> +#ifdef EFI=0A=
> +#define DISCARD_EFI_SECTIONS \=0A=
> +=A0=A0=A0=A0=A0=A0 *(.comment)=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 *(.comment.*) \=0A=
> +=A0=A0=A0=A0=A0=A0 *(.note.*)=0A=
> +#else=0A=
> +#define DISCARD_EFI_SECTIONS=0A=
> +#endif=0A=
> +=0A=
> +/* Sections to be discarded. */=0A=
> +#define DISCARD_SECTIONS=A0=A0=A0=A0 \=0A=
> +=A0 /DISCARD/ : {=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 *(.text.exit)=A0=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 *(.exit.text)=A0=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 *(.exit.data)=A0=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 *(.exitcall.exit)=A0=A0=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 *(.discard)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 *(.discard.*)=A0=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 *(.eh_frame)=A0=A0=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 *(.dtors)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 *(.dtors.*)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 *(.fini_array)=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 *(.fini_array.*)=A0=A0=A0=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 DISCARD_EFI_SECTIONS=A0 \=0A=
> +=A0 }=0A=
> +=0A=
> +#define CTORS_SECTION=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 . =3D ALIGN(8);=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 __ctors_start =3D .;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 *(SORT_BY_INIT_PRIORITY(.init_array.*))=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 *(SORT_BY_INIT_PRIORITY(.ctors.*))=A0=A0=A0=A0=A0=A0 =
\=0A=
> +=A0=A0=A0=A0=A0=A0 *(.init_array)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 *(.ctors)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 __ctors_end =3D .;=0A=
> +=0A=
> +#define VPCI_SECTION=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 . =3D ALIGN(POINTER_ALIGN); \=0A=
> +=A0=A0=A0=A0=A0=A0 __start_vpci_array =3D .;=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 *(SORT(.data.vpci.*))=A0=A0=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 __end_vpci_array =3D .;=0A=
> +=0A=
> +#define HYPFS_SECTION=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 . =3D ALIGN(8);=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \=
=0A=
> +=A0=A0=A0=A0=A0=A0 __paramhypfs_start =3D .;=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 *(.data.paramhypfs)=A0=A0=A0=A0=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 __paramhypfs_end =3D .;=0A=
> +=0A=
> +#define LOCK_PROFILE_SECTION=A0=A0=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 . =3D ALIGN(POINTER_ALIGN); \=0A=
> +=A0=A0=A0=A0=A0=A0 __lock_profile_start =3D .; \=0A=
> +=A0=A0=A0=A0=A0=A0 *(.lockprofile.data)=A0=A0=A0=A0=A0 \=0A=
> +=A0=A0=A0=A0=A0=A0 __lock_profile_end =3D .;=0A=
> +=0A=
> +#endif /* __XEN_LDS_H__ */=0A=
=0A=
I'm not sure _SECTION is a good suffix to use in the four names above:=0A=
These aren't individual sections in the output, and for CTORS_SECTION=0A=
it's also not even a single input section.=0A=
=0A=
How about _ENTRY suffix?=0A=
Otherwise we can do different suffixes depending on the content.=0A=
LOCK_PROFILE_DATA, HYPFS_PARAM, VPCI_ARRAY=0A=
=0A=
As to CTORS_SECTION - I'm unconvinced of generalizing this without=0A=
first getting it right.=0A=
=0A=
I will get rid of CTORS_SECTIONS then.=0A=
=0A=
Overall I think it would be better to introduce this header along=0A=
with actually using the macros. That way one can check within the=0A=
patch that what you move / replace actually matches on both sides=0A=
without needing to cross patch boundaries. If you wanted to introduce=0A=
(and then include right away) an empty header first, that would be an=0A=
acceptable intermediate approach afaic.=0A=
=0A=
I just wanted to split this into arch specific patches because maintainers =
are different.=0A=
I do not understand your second solution with empty header.=0A=
Do you mean that the first patch shall create an empty header (with just an=
 intro comment)=0A=
and include it in arch specific linker scripts?=0A=
=0A=
Anyway, I can merge these 3 patches into 1 if you want.=0A=
=0A=
Jan=0A=
=0A=
Cheers,=0A=
Michal=

