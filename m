Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2A64265F7
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 10:32:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204556.359723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYlIj-0003ah-2D; Fri, 08 Oct 2021 08:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204556.359723; Fri, 08 Oct 2021 08:32:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYlIi-0003Yq-UQ; Fri, 08 Oct 2021 08:32:20 +0000
Received: by outflank-mailman (input) for mailman id 204556;
 Fri, 08 Oct 2021 08:32:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/CyP=O4=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mYlIh-0002sr-O0
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 08:32:19 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.57]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b3b7abf-74e8-4f5f-ae31-b8aca971b1ca;
 Fri, 08 Oct 2021 08:32:15 +0000 (UTC)
Received: from DU2PR04CA0284.eurprd04.prod.outlook.com (2603:10a6:10:28c::19)
 by AM6PR08MB5285.eurprd08.prod.outlook.com (2603:10a6:20b:a3::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Fri, 8 Oct
 2021 08:32:11 +0000
Received: from DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::b2) by DU2PR04CA0284.outlook.office365.com
 (2603:10a6:10:28c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Fri, 8 Oct 2021 08:32:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT044.mail.protection.outlook.com (10.152.21.167) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 08:32:11 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Fri, 08 Oct 2021 08:32:11 +0000
Received: from f2a09072c1e1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C2A549CE-667A-4314-82B8-450B442A75A8.1; 
 Fri, 08 Oct 2021 08:32:01 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f2a09072c1e1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Oct 2021 08:32:01 +0000
Received: from AM5PR0801MB2019.eurprd08.prod.outlook.com
 (2603:10a6:203:4b::22) by AM5PR0801MB1889.eurprd08.prod.outlook.com
 (2603:10a6:203:49::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 08:31:59 +0000
Received: from AM5PR0801MB2019.eurprd08.prod.outlook.com
 ([fe80::80a2:ff50:fde5:5215]) by AM5PR0801MB2019.eurprd08.prod.outlook.com
 ([fe80::80a2:ff50:fde5:5215%3]) with mapi id 15.20.4587.020; Fri, 8 Oct 2021
 08:31:59 +0000
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
X-Inumbo-ID: 8b3b7abf-74e8-4f5f-ae31-b8aca971b1ca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiEyCQ28PKE1UMrJOHszKV2ibe+bdEzBvjqml7eydOI=;
 b=9hEU8ck2cN828TrE9Q+q4PprzICuygDbvqahPtQo3mZfPKuK0YoB3wBei1TU+2jN8KcxPO/oUBhSrlmnpv/gIlnzP20/zQIRDDPnj+5TRQVltoIvfsQrocXC8hC9XEHm6wlzJDUIF2/kjbPAfyfYVopQy2ros9FpfqDQue0HdG4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7eef6f75264bcfe5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQ7SMx3T/y8OvmZWznGBL+8MVoth6Yjf7jfQ2jPtieCCCsxnMoZJ//P39upEe+o2ORZIU5SbJTWkM17xsi75Lv5CZRh6UrQeUpvMrazqLKm6XsI4keSn/IQlXpFO1L4qXOBFZzVwyZLw6Rzj/27btw1ft7tSrC1N1JZnjSOva6a9hxy5Ih0IdmF4yvm11oRa2gFKvm9LXZBHpduW/K8pEk3P5tacmUxvnvF5Lffx3zS7Lf27C+sTeqmlWJUovk4ERdBzK0W0VC6NvrVTLBf+le4bA3o9zLSRQBso6eOpr/bfL3XdlyDKrPnUfRB14j7TA5Y2s8lkAPfXN6gnk5Uy8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiEyCQ28PKE1UMrJOHszKV2ibe+bdEzBvjqml7eydOI=;
 b=cVO8QiwB1K4SYrCb/kxN5EXbzBozYQKJ5dOKS778IFyxRPC1AcEqEABP4ChVEdsl8fZS6JXvFzrYF1WzRLgmzz2c5/7/t8bc7mkABDjNe+m56Jrdmga/WqUXhV6BRuHDFXgebzLjDs9tqgpCSS1vF7rZhAm5LEOPIwYwjaamvFHNthr50rvHQTT+Eo+vTr++3vaNnPcYEzEhSPwchmDgQesFDzdLFaEtM2lEI2pTheKGrynxvA9gJv5bRhK76F4Lvukfc7wy0gPcghoY6QYvPbjFKCeiXR1UzNXl6RlJbghcK7A22dHBn8XQdA0aKazhfsRZvforW8pjCVepcZaasQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiEyCQ28PKE1UMrJOHszKV2ibe+bdEzBvjqml7eydOI=;
 b=9hEU8ck2cN828TrE9Q+q4PprzICuygDbvqahPtQo3mZfPKuK0YoB3wBei1TU+2jN8KcxPO/oUBhSrlmnpv/gIlnzP20/zQIRDDPnj+5TRQVltoIvfsQrocXC8hC9XEHm6wlzJDUIF2/kjbPAfyfYVopQy2ros9FpfqDQue0HdG4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Nick Rosbrook <rosbrookn@ainfosec.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/3] xen: Expose the PMU to the guests
Thread-Topic: [PATCH v3 3/3] xen: Expose the PMU to the guests
Thread-Index: AQHXvB1myIFT9ovQyEqzTMJuggo2W6vIxa8A
Date: Fri, 8 Oct 2021 08:31:59 +0000
Message-ID: <E0B6B33F-C1C0-436A-8EEE-74AB852742DE@arm.com>
References: <20211008081933.18546-1-michal.orzel@arm.com>
 <20211008081933.18546-4-michal.orzel@arm.com>
In-Reply-To: <20211008081933.18546-4-michal.orzel@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a425509c-b6d1-4c21-eca9-08d98a361fef
x-ms-traffictypediagnostic: AM5PR0801MB1889:|AM6PR08MB5285:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB5285B530099791E6EC9752C39DB29@AM6PR08MB5285.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RQ0vmDmUOLzbV1yVYbqmZC7CS/vCbTf36iieyHoMblWd6MI1HfpEg7WHmeaMrIxf0I4DAGQWXMmvSwJSlwpYX+ETypqGEneldqn6szNGJq/z9S1fVg/yM9RjScyjkliCaXeMTFnqKznwuAniUrC//20dvXaHiJq1oALs5dI1CSS5bwyCJL3Y0JTi1bTbSUu6yMT8SoipZsyI/uN6KG5mVBVOpvvzMU6+Tt32OSadEyK1C6w12E+en3v0oLpAThXTKCsZdeJWz6JDjXaNjfje8R4czWorod1aV7knEFRRdk1fU4/8RaD3OpR7b0QlJqvV14dMHmejGmxoCgZHzYIyp5si1SYdmsEsQw0IXpjp8S1iXkL85Fg5DZP/ygRRmZ3Y25fWKgnjBxINJbpsifBTwrmSPoQ4EesaxeyyBshOhB3jhpO3qK6uRGtUQ4vjlicD7SekThhmpaR1oCtAqLxhzj4LLQI1IQLMSzrYvYrv7fUFAgoRrQM5RXhx/OPzMnDyQ5X7Hy24z4/7A8HtxKuu2wStQxjiMZGoSZvzDn0KcYYqpQyKOahJehnN4g1sniAhBBLBBuCe1ImePXFz4CJ6C7VQgvXYffsrCtV1PzYTf9adCgE5qX627G4NqK93S13QWDCJ6OqyGalmdmBBsQ7VeiHSNnWLt7rGcMPT8xokbkSBsXbrAYrZlBHOLORCrcSFCNJ/Bxb+KTTBl0COCThAxn21IfmOn6xhMk/CHuQGHEaWGR+ny7a3is0zYBEon+6u
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2019.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(33656002)(2616005)(316002)(38070700005)(26005)(37006003)(6636002)(8936002)(6512007)(4326008)(6862004)(6506007)(30864003)(53546011)(91956017)(5660300002)(7416002)(6486002)(76116006)(2906002)(36756003)(66946007)(8676002)(66476007)(122000001)(66556008)(508600001)(83380400001)(186003)(66446008)(64756008)(86362001)(54906003)(38100700002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BB6C412BDDFF58469F12B680287D12FE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1889
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cdffe335-8d45-4985-9131-08d98a36187a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Djp8UPpSlfEaJVRuDXF148ERyMe58Fenly9gjUWMZihU2oH9r9SakkJ8MaooJ+UwtYvxWwK0xqmBRnI7/E//stJyyH7RA6IbUZ3mMAzPjh19+n98thvexE6kSdiFye4wA38WT+spzEr1zIhnJnVQnjWkCwqjIpiMlW6RJx0C9AMIwtktGwO1HFVAnAGEeC8mKLHiiBlbBOYgrxqKWEs4Mne/j3K+RjFMLr+WxFvFIeUojDz9lKSu6w8t+VYjbEizFTVVp6um0Uw2Eaw3I6TBYu/p2dJBh549Hk5cmqzEbNlC4cbXvLcJ1kgSOgJS3dQBhwUpnplAAyzC05C+sP/4O/Gs42aE5dxN9EfpDjfQF88l9CB6pdthXAlU918gyT9OlgTIT3JkEW4+MUPmZQrPGqDQEH0sZg+YeX/12EJQsbODdUldFEo70YLz/MdNzNTIHgFG2Yk7agu3KFWVdCbPgLF3QGmUsvJRPaqEHoLk9iNO0vTr8uitmxf20e5ZiMtSNptVsUCV3E9n0ZYG2xXKdU+a/ZpE/Fd3WXgBJhczcGR4fC5Xc4HshTq6Z+BmLaWrc3L0oMobmqqCwS1I8p6p78Rfvm1QlQ1OIaaUSSn5537dj64L2XwaSAIPp1vuREYYnw3iTCbmDb4J9f28+xA7X7d8+/XngmzW/g6idDGkJGhh3iULjktN5S99SupRTbSbE1DvUbZBdBI/FnRtuDaX5Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(82310400003)(316002)(8676002)(33656002)(336012)(6636002)(54906003)(30864003)(37006003)(70586007)(107886003)(2906002)(186003)(36860700001)(83380400001)(47076005)(81166007)(8936002)(36756003)(5660300002)(6862004)(6486002)(26005)(53546011)(6506007)(70206006)(356005)(2616005)(86362001)(6512007)(4326008)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 08:32:11.8240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a425509c-b6d1-4c21-eca9-08d98a361fef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5285

Hi Michal,

> On 8 Oct 2021, at 09:19, Michal Orzel <Michal.Orzel@arm.com> wrote:
>=20
> Add parameter vpmu to xl domain configuration syntax
> to enable the access to PMU registers by disabling
> the PMU traps(currently only for ARM).
>=20
> The current status is that the PMU registers are not
> virtualized and the physical registers are directly
> accessible when this parameter is enabled. There is no
> interrupt support and Xen will not save/restore the
> register values on context switches.
>=20
> Please note that this feature is experimental.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> Signed-off-by: Julien Grall <julien@xen.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes since v2:
> -remove redundant check from x86 code
> -do not define bit position and mask separately
> Changes since v1:
> -modify vpmu parameter to be common rather than arch specific
> ---
> docs/man/xl.cfg.5.pod.in             | 17 +++++++++++++++++
> tools/golang/xenlight/helpers.gen.go |  6 ++++++
> tools/golang/xenlight/types.gen.go   |  1 +
> tools/include/libxl.h                |  6 ++++++
> tools/libs/light/libxl_create.c      |  4 ++++
> tools/libs/light/libxl_types.idl     |  2 ++
> tools/ocaml/libs/xc/xenctrl.ml       |  1 +
> tools/ocaml/libs/xc/xenctrl.mli      |  1 +
> tools/xl/xl_parse.c                  |  2 ++
> xen/arch/arm/domain.c                | 10 ++++++++--
> xen/arch/arm/setup.c                 |  1 +
> xen/common/domain.c                  |  9 ++++++++-
> xen/include/asm-arm/domain.h         |  1 +
> xen/include/public/domctl.h          |  4 +++-
> 14 files changed, 61 insertions(+), 4 deletions(-)
>=20
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 4b1e3028d2..55c4881205 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -690,6 +690,23 @@ default.
> B<NOTE>: Acceptable values are platform specific.  For Intel Processor
> Trace, this value must be a power of 2 between 4k and 16M.
>=20
> +=3Ditem B<vpmu=3DBOOLEAN>
> +
> +Currently ARM only.
> +
> +Specifies whether to enable the access to PMU registers by disabling
> +the PMU traps.
> +
> +The PMU registers are not virtualized and the physical registers are dir=
ectly
> +accessible when this parameter is enabled. There is no interrupt support=
 and
> +Xen will not save/restore the register values on context switches.
> +
> +vPMU, by design and purpose, exposes system level performance
> +information to the guest. Only to be used by sufficiently privileged
> +domains. This feature is currently in experimental state.
> +
> +If this option is not specified then it will default to B<false>.
> +
> =3Dback
>=20
> =3Dhead2 Devices
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight=
/helpers.gen.go
> index c8669837d8..2449580bad 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -1119,6 +1119,9 @@ return fmt.Errorf("converting field ArchX86.MsrRela=
xed: %v", err)
> }
> x.Altp2M =3D Altp2MMode(xc.altp2m)
> x.VmtraceBufKb =3D int(xc.vmtrace_buf_kb)
> +if err :=3D x.Vpmu.fromC(&xc.vpmu);err !=3D nil {
> +return fmt.Errorf("converting field Vpmu: %v", err)
> +}
>=20
>  return nil}
>=20
> @@ -1600,6 +1603,9 @@ return fmt.Errorf("converting field ArchX86.MsrRela=
xed: %v", err)
> }
> xc.altp2m =3D C.libxl_altp2m_mode(x.Altp2M)
> xc.vmtrace_buf_kb =3D C.int(x.VmtraceBufKb)
> +if err :=3D x.Vpmu.toC(&xc.vpmu); err !=3D nil {
> +return fmt.Errorf("converting field Vpmu: %v", err)
> +}
>=20
>  return nil
>  }
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/t=
ypes.gen.go
> index 45f2cba3d2..b2e8bd1a85 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -521,6 +521,7 @@ MsrRelaxed Defbool
> }
> Altp2M Altp2MMode
> VmtraceBufKb int
> +Vpmu Defbool
> }
>=20
> type DomainBuildInfoTypeUnion interface {
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index ec5e3badae..ee73eb06f1 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -508,6 +508,12 @@
>  */
> #define LIBXL_HAVE_PHYSINFO_CAP_VPMU 1
>=20
> +/*
> + * LIBXL_HAVE_VPMU indicates that libxl_domain_build_info has a vpmu par=
ameter,
> + * which allows to enable the access to PMU registers.
> + */
> +#define LIBXL_HAVE_VPMU 1
> +
> /*
>  * libxl ABI compatibility
>  *
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_cre=
ate.c
> index e356b2106d..d123c2f703 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -91,6 +91,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
>     }
>=20
>     libxl_defbool_setdefault(&b_info->device_model_stubdomain, false);
> +    libxl_defbool_setdefault(&b_info->vpmu, false);
>=20
>     if (libxl_defbool_val(b_info->device_model_stubdomain) &&
>         !b_info->device_model_ssidref)
> @@ -622,6 +623,9 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_co=
nfig *d_config,
>                 create.flags |=3D XEN_DOMCTL_CDF_nested_virt;
>         }
>=20
> +        if ( libxl_defbool_val(b_info->vpmu) )
> +            create.flags |=3D XEN_DOMCTL_CDF_vpmu;
> +
>         assert(info->passthrough !=3D LIBXL_PASSTHROUGH_DEFAULT);
>         LOG(DETAIL, "passthrough: %s",
>             libxl_passthrough_to_string(info->passthrough));
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_ty=
pes.idl
> index 993e83acca..b96fb5c47e 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -655,6 +655,8 @@ libxl_domain_build_info =3D Struct("domain_build_info=
",[
>     # Use zero value to disable this feature.
>     ("vmtrace_buf_kb", integer),
>=20
> +    ("vpmu", libxl_defbool),
> +
>     ], dir=3DDIR_IN,
>        copy_deprecated_fn=3D"libxl__domain_build_info_copy_deprecated",
> )
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl=
.ml
> index 6da3ed3c6f..addcf4cc59 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -69,6 +69,7 @@ type domain_create_flag =3D
> 	| CDF_XS_DOMAIN
> 	| CDF_IOMMU
> 	| CDF_NESTED_VIRT
> +	| CDF_VPMU
>=20
> type domain_create_iommu_opts =3D
> 	| IOMMU_NO_SHAREPT
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctr=
l.mli
> index b8faff6721..0a5ce529e9 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -62,6 +62,7 @@ type domain_create_flag =3D
>   | CDF_XS_DOMAIN
>   | CDF_IOMMU
>   | CDF_NESTED_VIRT
> +  | CDF_VPMU
>=20
> type domain_create_iommu_opts =3D
>   | IOMMU_NO_SHAREPT
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 17dddb4cd5..c503b9be00 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -2750,6 +2750,8 @@ skip_usbdev:
>                     "If it fixes an issue you are having please report to=
 "
>                     "xen-devel@lists.xenproject.org.\n");
>=20
> +    xlu_cfg_get_defbool(config, "vpmu", &b_info->vpmu, 0);
> +
>     xlu_cfg_destroy(config);
> }
>=20
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 19c756ac3d..2dd474da09 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -276,6 +276,8 @@ static void ctxt_switch_to(struct vcpu *n)
>      * timer. The interrupt needs to be injected into the guest. */
>     WRITE_SYSREG(n->arch.cntkctl, CNTKCTL_EL1);
>     virt_timer_restore(n);
> +
> +    WRITE_SYSREG(n->arch.mdcr_el2, MDCR_EL2);
> }
>=20
> /* Update per-VCPU guest runstate shared memory area (if registered). */
> @@ -586,6 +588,10 @@ int arch_vcpu_create(struct vcpu *v)
>=20
>     v->arch.hcr_el2 =3D get_default_hcr_flags();
>=20
> +    v->arch.mdcr_el2 =3D HDCR_TDRA | HDCR_TDOSA | HDCR_TDA;
> +    if ( !(v->domain->options & XEN_DOMCTL_CDF_vpmu) )
> +        v->arch.mdcr_el2 |=3D HDCR_TPM | HDCR_TPMCR;
> +
>     if ( (rc =3D vcpu_vgic_init(v)) !=3D 0 )
>         goto fail;
>=20
> @@ -622,8 +628,8 @@ int arch_sanitise_domain_config(struct xen_domctl_cre=
atedomain *config)
> {
>     unsigned int max_vcpus;
>=20
> -    /* HVM and HAP must be set. IOMMU may or may not be */
> -    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu) !=3D
> +    /* HVM and HAP must be set. IOMMU and PMU may or may not be */
> +    if ( (config->flags & ~(XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu))=
 !=3D
>          (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap) )
>     {
>         dprintk(XENLOG_INFO, "Unsupported configuration %#x\n",
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 49dc90d198..85386a765a 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -108,6 +108,7 @@ static void __init processor_id(void)
>=20
>     identify_cpu(c);
>     current_cpu_data =3D *c;
> +    vpmu_is_available =3D cpu_has_pmu;
>=20
>     if ( c->midr.implementer < ARRAY_SIZE(processor_implementers) &&
>          processor_implementers[c->midr.implementer] )
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 4d0e909eec..8b53c49d1e 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -480,12 +480,13 @@ static int sanitise_domain_config(struct xen_domctl=
_createdomain *config)
>     bool hvm =3D config->flags & XEN_DOMCTL_CDF_hvm;
>     bool hap =3D config->flags & XEN_DOMCTL_CDF_hap;
>     bool iommu =3D config->flags & XEN_DOMCTL_CDF_iommu;
> +    bool vpmu =3D config->flags & XEN_DOMCTL_CDF_vpmu;
>=20
>     if ( config->flags &
>          ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>            XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
>            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
> -           XEN_DOMCTL_CDF_nested_virt) )
> +           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu) )
>     {
>         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
>         return -EINVAL;
> @@ -534,6 +535,12 @@ static int sanitise_domain_config(struct xen_domctl_=
createdomain *config)
>         return -EINVAL;
>     }
>=20
> +    if ( vpmu && !vpmu_is_available )
> +    {
> +        dprintk(XENLOG_INFO, "vpmu requested but cannot be enabled this =
way\n");
> +        return -EINVAL;
> +    }
> +
>     return arch_sanitise_domain_config(config);
> }
>=20
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index c9277b5c6d..14e575288f 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -166,6 +166,7 @@ struct arch_vcpu
>=20
>     /* HYP configuration */
>     register_t hcr_el2;
> +    register_t mdcr_el2;
>=20
>     uint32_t teecr, teehbr; /* ThumbEE, 32-bit guests only */
> #ifdef CONFIG_ARM_32
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 96696e3842..238384b5ae 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -70,9 +70,11 @@ struct xen_domctl_createdomain {
> #define XEN_DOMCTL_CDF_iommu          (1U<<_XEN_DOMCTL_CDF_iommu)
> #define _XEN_DOMCTL_CDF_nested_virt   6
> #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
> +/* Should we expose the vPMU to the guest? */
> +#define XEN_DOMCTL_CDF_vpmu           (1U << 7)
>=20
> /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
> -#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_nested_virt
> +#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpmu
>=20
>     uint32_t flags;
>=20
> --=20
> 2.29.0
>=20
>=20


