Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE58142658B
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 10:01:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204488.359634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYkoV-0004fp-9k; Fri, 08 Oct 2021 08:01:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204488.359634; Fri, 08 Oct 2021 08:01:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYkoV-0004de-6b; Fri, 08 Oct 2021 08:01:07 +0000
Received: by outflank-mailman (input) for mailman id 204488;
 Fri, 08 Oct 2021 08:01:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/CyP=O4=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mYkoT-0004dY-Um
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 08:01:06 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.81]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2af2e3a-280d-11ec-8024-12813bfff9fa;
 Fri, 08 Oct 2021 08:01:05 +0000 (UTC)
Received: from DU2PR04CA0312.eurprd04.prod.outlook.com (2603:10a6:10:2b5::17)
 by DBBPR08MB5948.eurprd08.prod.outlook.com (2603:10a6:10:202::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 08:00:59 +0000
Received: from DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::93) by DU2PR04CA0312.outlook.office365.com
 (2603:10a6:10:2b5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19 via Frontend
 Transport; Fri, 8 Oct 2021 08:00:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT055.mail.protection.outlook.com (10.152.21.30) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 08:00:59 +0000
Received: ("Tessian outbound e27daf245730:v103");
 Fri, 08 Oct 2021 08:00:51 +0000
Received: from fa14c3acbc5e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 90EDF76D-FC61-4703-81D1-AA156BBFAF13.1; 
 Fri, 08 Oct 2021 08:00:44 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fa14c3acbc5e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Oct 2021 08:00:44 +0000
Received: from AM5PR0801MB2019.eurprd08.prod.outlook.com
 (2603:10a6:203:4b::22) by AS8PR08MB6183.eurprd08.prod.outlook.com
 (2603:10a6:20b:29e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21; Fri, 8 Oct
 2021 08:00:43 +0000
Received: from AM5PR0801MB2019.eurprd08.prod.outlook.com
 ([fe80::80a2:ff50:fde5:5215]) by AM5PR0801MB2019.eurprd08.prod.outlook.com
 ([fe80::80a2:ff50:fde5:5215%3]) with mapi id 15.20.4587.020; Fri, 8 Oct 2021
 08:00:43 +0000
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
X-Inumbo-ID: e2af2e3a-280d-11ec-8024-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QR/RcfSshFxSKIMvdnlA11f7GtWbkZptQZKqf0t4mps=;
 b=ndBiI7mQtRNFj6hTV04kuHsjP7Ywa0Xk/85X2oflohIBKpQO2P52KOMEl3vTfs21MKVDcJRN4lyfrmN9yM3XaFgPv42i5jPzv1VQN1oS1pCB34PJ1j4ZYF/4Kr0IVRdpzRlXOvic7kv4xzKxdr3QX0KRsoomwKIBkfFf9398rOQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fba830e8a5ac65e9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQETDXNa+XEnYxbvVICFXO8oxihhIUQyjDVgoH3HhCt7lzfvL8SuYcTrr+pZrGf5I72D+wepnb1pYEvcJXJc5RFkZ1KC+vlHry6+YbpYG8sv2PL2v/vJKj8qOXNdvc2aDX07STmQxnEs8fgj+hK9AqtIEjR5MrLFFaYzTZ7KI3KoMw7r07ajNfjgf/7aJ8xiF49bCbI3Sm2kJy17r4j4fHedvooo/3NtqU+29OO7W0uM4Hdem3Die0okbeXbezsqMBPU3ropwzDIZmVxQ/MdXHsFd/AdxaAFMqlMez9TZZV78XcgoRWbXTKFQYBdb4v4W6Ixjm73d0T9mbt4LtOarA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QR/RcfSshFxSKIMvdnlA11f7GtWbkZptQZKqf0t4mps=;
 b=I8TgOCRuHO3kygzbqRF2o0QF4ruuI3swQY9jyla43wthZ6FeKDivPsOHIetepWQrk9EaPnpiXPibd2R6k/0qcbx2mK02iIPCOsgIZPUFVAezLhQGQCVQPBqjvFvc/94L7LhYrDHaRXC/96nFlPuzNoz9Lg3H7OaU3jGrtcN0sQM7dZbHEW0FUovuuvBBFVjjPu5tHN9YCZGfL5ccLPx6/BhJmF7N4P6yhR1wD4WLpm1no5W2Y1XGc4ALzeAEW02SIqbI8K/ZyJArrjcosl8XzdzelCThG4ABZP3cUypfQvgp2MkxEyDbJbQeg6fr0icZvJPW2QOWOQkRHu9cR0NEog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QR/RcfSshFxSKIMvdnlA11f7GtWbkZptQZKqf0t4mps=;
 b=ndBiI7mQtRNFj6hTV04kuHsjP7Ywa0Xk/85X2oflohIBKpQO2P52KOMEl3vTfs21MKVDcJRN4lyfrmN9yM3XaFgPv42i5jPzv1VQN1oS1pCB34PJ1j4ZYF/4Kr0IVRdpzRlXOvic7kv4xzKxdr3QX0KRsoomwKIBkfFf9398rOQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Rich Persaud <persaur@gmail.com>, Daniel Smith
	<dpsmith@apertussolutions.com>, Jason Andryuk <jandryuk@gmail.com>, Eric
 Chanudet <chanudeter@gmail.com>, "openxt@googlegroups.com"
	<openxt@googlegroups.com>
Subject: Re: [PATCH] docs: add references to Argo Linux driver sources and
 information
Thread-Topic: [PATCH] docs: add references to Argo Linux driver sources and
 information
Thread-Index: AQHXu/rzKybFoOgLIEWlKhrre2e4IavIvTgA
Date: Fri, 8 Oct 2021 08:00:43 +0000
Message-ID: <69AF5051-8F44-447D-A0D3-269D8E3A4CE3@arm.com>
References: <20211008041241.227823-1-christopher.w.clark@gmail.com>
In-Reply-To: <20211008041241.227823-1-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 207189c7-a11f-4546-d8ef-08d98a31c3dc
x-ms-traffictypediagnostic: AS8PR08MB6183:|DBBPR08MB5948:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB5948DCBE9B49BB34495527029DB29@DBBPR08MB5948.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yvLtBCp7Uj2gA/juRk0vMkGSxAQ8FrFcEWnPSeo6V5iuwTOnZZiermiAgbLAuoQtdc3fuX6zzG9+4Yfhhkj0Ml0UNuCRCbJimLAyvxq2xotRs79z4OCSazKFYaOqAOdUGE2qDAfwOjMeWL1Vv4IPCjB9YIlEuSjXrwPoQ2Xc4Xg6e2q7pi8XQ+1zvbXWfroPEg9AEJ0zPjBhvQ5WgbCLckVXiK0ju46NF5SSVL2G3QO4dCeWjlSJgE6vMAGZkU1osI6kWNC3I8yPE1UhCGJ5MIoeQIigDgxyjarqqaHvyJuBZKaacPi0i/OQyNHnYJf2Z5Bg8zJ98OHWPRLuyxOp/qG2R7Ta8V7dxfFzFAJ/TvBSkzXnXHEkoE7a6aw0Wi+vsqbpwPN63yXsXK9NNOkrFiewEW+ehpFRgRnaLtRWIe0nB+kWdIZpC9alp7Vog+Y7HHGqcVL5AT4w2XGWLuSRB0QJLrEbWnCuWjUcw/dLsRYCEcLyJqCwaPk7YCzYcM3PAmj6UrLrdTXbJ/wxUyDoitBh9pb7X8eDAMIMKe9IvecwQ+2fNHcwnjuT6wHVZATRmwn6n4kuW1Ecmc0qzgqN2IP1F1w0l07to2Ci8UFD9iCONZLvGGMZsUDSrsb1ILKh+xi0te9p5IlpiC/oeV/Mg+/VAy+57uG7nQqTZLVTphbi4VlHeZQRPRVjUSUYRAF+F2vLPT8115T5z06eFnIfdZFqTk/dOw1zX72GeKwOrIQBeo61ROcV4kmHS8CYNOVAttOMWaTMXK79y0S8n3RqkFHDK7n9ogIzVuaOiG2XwRZTCv20IwP6KzV4Bm6Vpj8PSLuhn7f+CS52F8FiobeF5FVJfPnoUOaTFe9Q+QYdBg83WZ/h2AQYOmhfFCHBPWCi
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2019.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(83380400001)(6486002)(6512007)(71200400001)(33656002)(2616005)(86362001)(8936002)(8676002)(6916009)(122000001)(36756003)(6506007)(53546011)(76116006)(91956017)(4326008)(66476007)(64756008)(66446008)(66556008)(38100700002)(5660300002)(7416002)(66946007)(316002)(26005)(2906002)(186003)(38070700005)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <778B7491D333DE4FB31B4852345ABA24@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6183
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7c8218cc-f295-4330-1e37-08d98a31ba57
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YWrQDh9Gezdrh9pf9qq3bWcV/XH0IXQeEbZ9BTaWfHU04qRXSEDART6wMPZ0uywbIogeEnhkwCX+8BLjeuYOQuQB6hxtorzJFKLs62x2b0uIta+SDWUGTk0EYD9kTlsDirEYDhNqmNgt3g5ZdUqC01R6QlzisV/yvY9L/HaqsZcyC9deIQUJgNhtSq4dDJqDk3WFFehuaSelhdXt3RFOdxOjnBcdQ7CHcFUSpE+wV2igTb3/+Ru87DZoHRx/om2VbK3Q1dF2/YFn1NipwK94fL9D3tnzVfi62auSpU3hqHMHY29nPW0XqdVGG8Z5vzJ/1sRJHq3zp3rDt+hyIjDHDvN+P9OBPBuG3Ersus4Pt6b/GSRxHudqWFG6Ep5PuM/pdPPPeVMACk7rcl4U4teN8DSyhrfE+EZkvl22lXGiVfz/ZBYbabA/wIcY5M6zXQN81ceZlcOCt0l9pLjX+qaZF7qR8bXqP8+Xz1RZLnIUfhHhFF5ZovXlDmn20Vj8mAabbcuA/P+EG5EPFz3vr7W4dnFVrg+lgVh/ljrQdoFElSj1i7/uHyq/5/Cm7hNPFXr5EHh+yg1Hq1U9OFet11hi65qIW2730e4QlZiifR+9heAXecOowe7z+5HxTJlWZ6CXQwYxJrmHCvkjuAbFS6D3SzQMiHfL1GGs/HikFdAGdGbA5A1BLo1pNQIf2SZfA9IjJLuH/sDRXv+zr9a6p9oghMFPlHDt19UAUffj88Qh/qacIJYtKiWtek1nt8t9iM0VJ869Mk1uVTG5xfoskNr5HBJkHiz/4GAA7G1ESgiH3HeeIVRZhfKF23R56lPXoXIoUnA1VrwsivPIhfdIG5TobA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8676002)(107886003)(54906003)(336012)(8936002)(70206006)(316002)(2906002)(82310400003)(356005)(81166007)(36756003)(53546011)(70586007)(6506007)(6486002)(6512007)(508600001)(33656002)(186003)(36860700001)(4326008)(6862004)(5660300002)(83380400001)(86362001)(26005)(47076005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 08:00:59.3617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 207189c7-a11f-4546-d8ef-08d98a31c3dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5948

Hi Christopher,

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Just one small NIT that could be fixed during commit.

> On 8 Oct 2021, at 05:12, Christopher Clark <christopher.w.clark@gmail.com=
> wrote:
>=20
> Add a section to the Argo design document to supply guidance on how to
> enable Argo in Xen and where to obtain source code and documentation
> for Argo device drivers for guest OSes, primarily from OpenXT.
>=20
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
> docs/designs/argo.pandoc | 45 ++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 45 insertions(+)
>=20
> diff --git a/docs/designs/argo.pandoc b/docs/designs/argo.pandoc
> index 2ce253b654..74c8ae4ac7 100644
> --- a/docs/designs/argo.pandoc
> +++ b/docs/designs/argo.pandoc
> @@ -439,6 +439,51 @@ that teardown of any domain will not interfere with =
any Argo hypercall
> operation. It enables introducing granular locking without complex or
> error-prone lock acquisition logic.
>=20
> +# Related Material
> +
> +## Enabling Argo in Xen
> +
> +To enable Argo in a build of the Xen hypervisor, please ensure that
> +CONFIG_ARGO is enabled in the Xen hypervisor build configuration file.
> +
> +To make Argo available for use at runtime on a Xen system, please see th=
e
> +Argo settings in the Xen command line document.

NIT: s/document/documentation/

Cheers
Bertrand

> +
> +## Linux Argo drivers
> +
> +A Linux kernel device driver for Argo and corresponding Linux userspace
> +software, libargo, that utilizes it for interdomain communication betwee=
n
> +application level software is available and maintained by the OpenXT Pro=
ject,
> +at:
> +
> +https://github.com/OpenXT/linux-xen-argo
> +
> +The repository contains the primary Linux kernel Argo driver, which is d=
erived
> +from the original XenClient v4v driver. The document at the following li=
nk
> +describes planning and design notes from OpenXT community discussion for
> +improvements to the driver:
> +
> +https://openxt.atlassian.net/wiki/spaces/DC/pages/775389197/New+Linux+Dr=
iver+for+Argo
> +
> +An alternative Linux Argo driver is in also available in the same reposi=
tory,
> +implemented to explore a different approach for Linux to use the Argo
> +primitives under the Vsock address family to allow socket communication =
between
> +Xen domains.
> +
> +## v4v drivers
> +
> +A Windows driver for v4v has previously been used in XenClient and OpenX=
T
> +which could be ported to Argo. It may require update for compatibility w=
ith
> +recent versions of Windows software.
> +
> +https://github.com/OpenXT/xc-windows/tree/master/xenv4v
> +
> +The Linux, Windows and OSX guest tools for the Open Source HP uxen hyper=
visor
> +contain drivers for v4v which are relevant as code bases of interest for
> +porting or developing new guest OS drivers for Argo.
> +
> +https://github.com/uxen-virt/uxen/tree/ascara/vm-support
> +
> # Future Work
>=20
> - Performance measurement and optimization
> --=20
> 2.25.1
>=20
>=20


