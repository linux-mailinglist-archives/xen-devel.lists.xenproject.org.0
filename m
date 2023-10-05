Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE517B9C11
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 11:09:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612907.953077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoKMK-0000sJ-IE; Thu, 05 Oct 2023 09:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612907.953077; Thu, 05 Oct 2023 09:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoKMK-0000rC-EG; Thu, 05 Oct 2023 09:09:28 +0000
Received: by outflank-mailman (input) for mailman id 612907;
 Thu, 05 Oct 2023 09:09:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfD8=FT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qoKMJ-0000r6-2k
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 09:09:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1207a8b-635e-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 11:09:25 +0200 (CEST)
Received: from DU2PR04CA0319.eurprd04.prod.outlook.com (2603:10a6:10:2b5::24)
 by AS8PR08MB6549.eurprd08.prod.outlook.com (2603:10a6:20b:33d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Thu, 5 Oct
 2023 09:09:19 +0000
Received: from DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::7f) by DU2PR04CA0319.outlook.office365.com
 (2603:10a6:10:2b5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33 via Frontend
 Transport; Thu, 5 Oct 2023 09:09:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT023.mail.protection.outlook.com (100.127.142.253) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.26 via Frontend Transport; Thu, 5 Oct 2023 09:09:18 +0000
Received: ("Tessian outbound d219f9a4f5c9:v211");
 Thu, 05 Oct 2023 09:09:18 +0000
Received: from 3971a5d7ab1d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3274A59B-B626-4288-9427-0CC28BB28700.1; 
 Thu, 05 Oct 2023 09:09:11 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3971a5d7ab1d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 Oct 2023 09:09:11 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB8483.eurprd08.prod.outlook.com (2603:10a6:10:3d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Thu, 5 Oct
 2023 09:09:07 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 09:09:07 +0000
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
X-Inumbo-ID: e1207a8b-635e-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O72MeGs0XwEEEOTU9MHfMzsob1JIXu9TRZWUmYG1Jvs=;
 b=wKlorCfunucsrFAiSOlvUxgvxNqlEVjs1GlRCopo1jk19uWPtAOMKOwOcCwSzS24V1dk+iofZqXWvDqRT0LowvgfGfqO7JM6eVL7Gj4n3AzrRvizJB/r6cYV+RuheMAh0lNYsh6mLHjqQ9MmAQifV7vq16J6mzxLyK+mWlIlGWg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 31d2669abd53a6c6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocdpePYQCsn7GllmYdg4vMLFJ7RC0KmDWnC85+95VEurmFLeA3bk3F2bfULY5zwoaWZ3YLp+NYR8pSxjkAcXEBtImVEQ5SltCwiLTm/gZM43Nk5knfpwwiqcmoljwm5k0ECVq4UhuVinMJHu47vGn3/j0mgWFzYHMWNj6jvxPp1wZF3Tq7JhxEkJYQlS0AIZ5+LrX8Dp0EEMUFa8AcPhWBAXKe7D1utKyFpwsdT8w05pQh2mNA8z9nmzfc19LAvKHlfNoeIt4KcZlvD6NZggmJ3iB7c9t4q1FbMjhkrmix1JhLp3nstTRDOpN6TxNJAlcwBFllvbOoaCaxwRVh/myw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O72MeGs0XwEEEOTU9MHfMzsob1JIXu9TRZWUmYG1Jvs=;
 b=ZzxG2vyiVKJ4Gj6TGsnFcarDxt65QkM9sDJoNTUawM/z9Q46ogg6r8mBiOhyZ54u/zRC+++cTZUL+v5CsQdPjaW2nWmIUL89AdCO/9L4vJP0LhV143SNTa199zOC6i0CBTjxQl5EYiMwr9FHxCL37UtbiXskZmD4xuc4NhLoKAodopzEnAXZ5rKj0VdzaYb9Cqwnh0EasZFN4HXQo6u+Vc3RyYuZ7WfG36ia70+pcaomCduYVKYM9uLjxlkT11sSitPJdZVH3eEYJcN5NYamC+xWJqLgG2B0dE0QCXTH9xJUKws9cN2sRRhXg6fVf/4DoiDTB1KOFpvVQ6pruvmtww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O72MeGs0XwEEEOTU9MHfMzsob1JIXu9TRZWUmYG1Jvs=;
 b=wKlorCfunucsrFAiSOlvUxgvxNqlEVjs1GlRCopo1jk19uWPtAOMKOwOcCwSzS24V1dk+iofZqXWvDqRT0LowvgfGfqO7JM6eVL7Gj4n3AzrRvizJB/r6cYV+RuheMAh0lNYsh6mLHjqQ9MmAQifV7vq16J6mzxLyK+mWlIlGWg=
From: Henry Wang <Henry.Wang@arm.com>
To: George Dunlap <george.dunlap@cloud.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bob Eshleman
	<bobby.eshleman@gmail.com>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH for-4.18] MAINTAINERS: Make Bob Eschleman a reviewer
Thread-Topic: [PATCH for-4.18] MAINTAINERS: Make Bob Eschleman a reviewer
Thread-Index: AQHZ92tpfMLmzML2okm2AFXPydcO7rA66EwA
Date: Thu, 5 Oct 2023 09:09:07 +0000
Message-ID: <4EA3786A-6FDE-40AB-972A-ABA2AF430B35@arm.com>
References: <20231005090727.19235-1-george.dunlap@cloud.com>
In-Reply-To: <20231005090727.19235-1-george.dunlap@cloud.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB8483:EE_|DBAEUR03FT023:EE_|AS8PR08MB6549:EE_
X-MS-Office365-Filtering-Correlation-Id: ff24ef50-8cfe-4260-e740-08dbc582c1b9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8UZLjhrZ+Ig67IQ7h4IKMjZdN303Y2xAcXquPDO+lXjAg91R56BLQT+31troe3jxF7bGEjAZT+lTQkWdhpcBQ91JZ/Fs2jqUQRDwQYkhTECOBKgmC7zPdqRHYPWR6B/HELK4FydEgQlf3Bis9PpLXDSTlS7ZmF3dNeMtGVoSMnIjwdoYEa0H6NNxAaVlSAqp0qQaxFwEX6xlbU/iDBszTaOjAX70CcepWaPOvlJe2pPC0xfYva8bhbFMad0/H3MFfijSaO1Fy2lLiAuLNekelEOCoCrIsWAqra3iDvkVHBPfPpuXh3Q4PSk6vjJgzhUqR6xJSn2w9DYgRLiUedwkpA2CrNcC3fLIPJUJkBY+Nc401UUTm38evItpgB16NL5fTsE06sEbb6F+1ZIsCZGcaE0R3xgc0PANuhTRa604N0ijapc4BvZ0DLMYz++4OApclfBi025gpM3fdJOqf6YKDENeq/pSfE7yNUv8xTtaxTHVvlENfCk0S2C/xlSyZQ8vYF9bTmYQ0jufun7n8423dWj+atRsZaosRpbT/KZssaPjC6/kotXR+sKiSQA5/dfh99bpakgNBOQux6YAIFXIazn+G8CWzFF5xqQGh/aJKl7m5vzwJvbM6OdixPZXRrUeAHvORX79U6m27HEs738rlw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(346002)(366004)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6506007)(66446008)(8936002)(4326008)(2906002)(8676002)(66946007)(6916009)(91956017)(5660300002)(66476007)(66556008)(41300700001)(4744005)(64756008)(54906003)(316002)(38070700005)(76116006)(38100700002)(71200400001)(53546011)(26005)(2616005)(6512007)(6486002)(83380400001)(478600001)(122000001)(86362001)(33656002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2BD4A3FD338E904194FD914C8205283C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8483
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	34694149-a67a-47c9-8698-08dbc582bacb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oBmFtniCpxpQkrqRnJndnsAsUcjHmYq2xi+qgVqAzkcRuH5i8IhzmuJAhEVngUvUfnJu3+bFCJvtvn9nbFdHLBneQnTSlZO5Bnr5CJE1CiHZznaZu00xCSK2zX0vkwSmZ/+XDx3xVyMwOsh4mv6HsTBhZgTEZNZdaCoQ5gAHf3xPtaRS8Ac4vnUWN34sX7CaCXeTIdq0GUTG08JOI5qwoQ6vt6P3u9qZJwoc9rLvCRkYVE8rYujEjFjaeQ00MfOygnCV36eDmMwiJW/+JbfsuQ3qHbVpENyQHrd+cKw2kypIl0IfjcD07oMEQMA6mR2cYOKmt/gtAwzD3IZZ+Q0aJbpaNW5LPJkBoNe3ov/woPXlFkm0b4KzCJ4QzlbvZK2txneROzGWNRZm9jOIcCgW6Z48I8z9W6nESczxemIDf8+rL9X52dHft4oo75rxE1IR9roypz90A/fUEmpHHOPnU5XfcBkfU37FNCSlg/cG+lMKNXMCw0IEzY/BkUQp0yLz3jAQJGdokV637y0RhZc1+x8v3NvHgOZZ/4c7+VP15KeThwO9ScHaQ4E3WDEJnWrtnLaoko5dQQHGosUww1xcTeMh3v7PB2EqDYYAdK9Qt9LTWPsQQjTg/r/XT9xeAT++I1QNupZ7SEXjniWzIZEcMdR7RMP0wRMb9dAkRR9EVQsvgSIV2iWgvILxm6mzVckm0LFfALE7gZ50Pll+8ny2CeYgd/FDtJdiBbfu6Qmi7/HXmyzIDW6Bbds/lB83dRIv
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(316002)(47076005)(26005)(6486002)(336012)(6506007)(6512007)(53546011)(36756003)(82740400003)(478600001)(2616005)(356005)(81166007)(83380400001)(36860700001)(70586007)(54906003)(70206006)(41300700001)(5660300002)(2906002)(40460700003)(86362001)(40480700001)(33656002)(8676002)(4326008)(6862004)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 09:09:18.9507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff24ef50-8cfe-4260-e740-08dbc582c1b9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6549

Hi George,

> On Oct 5, 2023, at 17:07, George Dunlap <george.dunlap@cloud.com> wrote:
>=20
> Following a conversation with Bob Eschleman, it was agreed that
> Bobby would prefer to return to being a Reviewer.
>=20
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
> ---
> Freeze exception justification: Only documentation change.

Of course. So:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

>=20
> CC: Bob Eshleman <bobby.eshleman@gmail.com>
> CC: Wei Liu <wl@xen.org>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Henry Wang <Henry.Wang@arm.com>
> ---
> MAINTAINERS | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 22034bf6e3..f61b5a32a1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -499,8 +499,8 @@ F: tools/hotplug/Linux/remus-netbuf-setup
> F: tools/hotplug/Linux/block-drbd-probe
>=20
> RISCV
> -M: Bob Eshleman <bobbyeshleman@gmail.com>
> R: Alistair Francis <alistair.francis@wdc.com>
> +R: Bob Eshleman <bobbyeshleman@gmail.com>
> R: Connor Davis <connojdavis@gmail.com>
> S: Supported
> F: config/riscv64.mk
> --=20
> 2.25.1
>=20


