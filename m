Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BFC7B9996
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 03:29:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612820.952927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoDAA-0000pZ-SL; Thu, 05 Oct 2023 01:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612820.952927; Thu, 05 Oct 2023 01:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoDAA-0000mX-Oj; Thu, 05 Oct 2023 01:28:26 +0000
Received: by outflank-mailman (input) for mailman id 612820;
 Thu, 05 Oct 2023 01:28:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfD8=FT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qoDA9-0000mR-CS
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 01:28:25 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2075.outbound.protection.outlook.com [40.107.13.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7918cffc-631e-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 03:28:22 +0200 (CEST)
Received: from DUZPR01CA0317.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::27) by AS8PR08MB5910.eurprd08.prod.outlook.com
 (2603:10a6:20b:296::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Thu, 5 Oct
 2023 01:27:53 +0000
Received: from DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4ba:cafe::d2) by DUZPR01CA0317.outlook.office365.com
 (2603:10a6:10:4ba::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33 via Frontend
 Transport; Thu, 5 Oct 2023 01:27:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT055.mail.protection.outlook.com (100.127.142.171) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.26 via Frontend Transport; Thu, 5 Oct 2023 01:27:52 +0000
Received: ("Tessian outbound fdf44c93bd44:v211");
 Thu, 05 Oct 2023 01:27:52 +0000
Received: from bca7119d26cb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B34AEAB1-55B6-4517-9977-32E98EB515EB.1; 
 Thu, 05 Oct 2023 01:27:45 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bca7119d26cb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 Oct 2023 01:27:45 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB9521.eurprd08.prod.outlook.com (2603:10a6:20b:60f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Thu, 5 Oct
 2023 01:27:41 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 01:27:41 +0000
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
X-Inumbo-ID: 7918cffc-631e-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3evxhMzv5pKLut7UbgFiCjffU+IQkA6QdXqcVwcT3E=;
 b=fGSXFqC/kA/XlpVc5AApVmB1tYbgUGWLOmNZrRqdh8I0p6T8icUEASCTm84qwijOQeg42dK2Wc8RNhvWkojd8bONC2nGCTyzc46ttg0hF85QTDDo3MbP3bh+uVtYhwAMrg9YHYqRHkjWQZvUoIl5ar4X/FL3RbWyXl3YXXQxgn4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 98f59f4725c9171d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfieBH/blWlvnBKIg3IsbOND4EeTgM3S3mdHGrLe4hrCuc0yfMieVkUhfYOfFKcEkzaTeaFHRV+ZzpBM1HSHGuraap6VTbauJvnLuXopQBr6eezNYFZy5D2yU3esZxBM2hNipBBoOLdlJVsGB2ZwWvx4iwXO3pgb525XWQfC4ln2aUMIUqrEUXLkAnBK3r2x4xBh1GC7lJG994bpsKshckIvy3gZPB7yFNatvRsfkfl9We8cQOEaLklbD2JIImRig3/W7MgXkHrWIh8qRB/li2PecaHR9tMqluCYE0eXjUuMhR/xfb/r5w4ytSWo1CFGl3Bvd1OknjFfuzGFQIdFMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3evxhMzv5pKLut7UbgFiCjffU+IQkA6QdXqcVwcT3E=;
 b=ccen9I421JO4+eK2UBMuLsmf302RWva7RoREmC6GBMEGCmpn7GG1YPmFpVwkoKb6x59LM+brylurYYlK4ukR8X/Tj1FUY4oFd/+CZDloyXzFA0yKYpbmu64X9UDnK94B4tmTO6fC7D9cbt0TcTxaD5fD1e95FcjfQEBcEGUNY1XbkNysD+3ofw4lQcYFa6rpGRqSxFFMFYp8p6V4rS6E7AAQOF3aS1b46nJ/sH/71H+MuQF+M8kavZZ8QI6FPXvkm7SdDrwH2xkmxn1fI1DRwIspfe8dd0NH47qERZTjqSjEMP1iEvXnWx8Z45TnXkVhbdQ614oI8+y2wwWNGYcLEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3evxhMzv5pKLut7UbgFiCjffU+IQkA6QdXqcVwcT3E=;
 b=fGSXFqC/kA/XlpVc5AApVmB1tYbgUGWLOmNZrRqdh8I0p6T8icUEASCTm84qwijOQeg42dK2Wc8RNhvWkojd8bONC2nGCTyzc46ttg0hF85QTDDo3MbP3bh+uVtYhwAMrg9YHYqRHkjWQZvUoIl5ar4X/FL3RbWyXl3YXXQxgn4=
From: Henry Wang <Henry.Wang@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel
	<tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v5 00/10] runstate/time area registration by (guest)
 physical address
Thread-Topic: [PATCH v5 00/10] runstate/time area registration by (guest)
 physical address
Thread-Index: AQHZ9ULOXo6nacgxtUSqjcKqJ3jAc7A6a7EA
Date: Thu, 5 Oct 2023 01:27:41 +0000
Message-ID: <4F5568FE-DE94-4F19-9F17-BF251E1F6716@arm.com>
References: <20231002151127.71020-1-roger.pau@citrix.com>
In-Reply-To: <20231002151127.71020-1-roger.pau@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB9521:EE_|DBAEUR03FT055:EE_|AS8PR08MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: d4eeb0a3-f133-4e7d-66aa-08dbc5424b33
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1RxNQ8czWNMco3REDkWdkpxni//ZhqTHzcAxUrtfR6D87fJRXNRDo1DI8MuFQJilnnMxF51PXYyIGSfBIGLjAQ62mJnBvu9+nIKoqjuVPEFrvcqzCl8gvbCUf3f1e3/8w21MfxYmdriNH1suIWJKYF1oooUFgq0MCL/TKxjrEDAFPGyURj98wH+LuQO6RqiyiyziKQk1lhcLdDUJZMTakwp/DxM6k8g2MTS/onXNFoOujg8AFRc5SFUWuwKa6MCedXhQn5jhBwjwpGJ0VLGfjSkOTs8Bs5aHBhAngSdrzvCiHkE4bxVxQxRedpI55xK7MeG7n009OjKX3iYpsl9XcSRTqJWiEg0+kjHTfwyI+T1zHIQK4k1V0yg7FBt4KnTXkn4v8TeW0jo6u7y1b4im5Lx462ArsKpxe9aVf/SN9VCjlPtJmwSbb+Gz/oA6+c6FRroxSSfpgpsmfQVH1148WPZwifisXgYmU6XaxLzNnDi8tZFMe/7jCbGNtT1Ve/Cgf/jhEuGhDjPAlpCqNCS3pe3P8lFMNlpVcRgj5lIV35PtPTtFelQp4AuluvzsUrR0Et58vP8RHbB3GpWRACIa+aZBcUcZp1rWemnC66D1QlKCreihWtjFsBL8B0MKiQVP3aVqGkR1oyfWwSVoVm70VQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(346002)(136003)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(53546011)(6506007)(6486002)(6512007)(478600001)(966005)(38070700005)(86362001)(38100700002)(122000001)(76116006)(316002)(2906002)(2616005)(6916009)(71200400001)(33656002)(83380400001)(91956017)(26005)(66446008)(8936002)(36756003)(8676002)(4326008)(66946007)(66476007)(5660300002)(64756008)(66556008)(41300700001)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0135078BA8C16946AE5BF2DDBEE13613@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9521
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	89c9f7fa-ca11-4b0f-ca06-08dbc5424495
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XAAq/w71zrCJXCTs+25VkTizqxFH1IG+pPfKvDfl2c+PIl6Gz4vVjNy3RY8tkz6EXfx41BFgC4CqP+P1mJw68LoWQ0FWxEoZDPAlP4/8/imP2E72uPfFB1l64+shDTQ8VlHMscdhHvJTHGe4S0vYoqqMlFNfG2PGMZcRhkd1yLgytGz0CoZbhglKGAxo24ThAdJ/BMMrQ9VMTJrcCVVISbmt/aexW63f3gaBqVZQSHkCcX+AVEPsOxHfkCaV2kyX0K1SlOgFBQ50T5GqpjuIR9nJYFI0H/m4T1KiqOvrRmqLsJQl4HuQPJVDJ5oovYO6ySGNm2UQb1C+1UTC0zGNz2Kd5cZhC5NdhXZ4wisHzs0V35BlIfT41x1MHq2cenHbPYCle+zDzItOTsTkVEXvZR+ps7zA/vlFTXylai9R9T8u5+4K7OapaMhmuJ2Dz+AL4mOgK1xMUq13E/o1cpsuUWR3UtYRUmlX2EYuPx+1tg6aE97imqFQE2NBOhjqUcHpD+lDj6qdt4JNJRBHBnDOgY+6i5PfkU2ZhxoaDhFs1f2sCMn0h8TRpR7wBtssJ6U98qMHb/QGycEV2l5f086D50MJt71BP9wyZS+lPatagoCoNhGurLC8/7g0933GbluBWWcsuv9maNCLakTDJ9C08RJsT4BMSq0PN8Dex4wJSz+yYYUutSh1qoKXN2yGR7Uktq2KODeV1oc9mWczlu7OasfsSfnscRJRBj8CR5Fhge8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(1800799009)(82310400011)(186009)(64100799003)(451199024)(40470700004)(46966006)(36840700001)(966005)(6512007)(478600001)(53546011)(6486002)(2616005)(6506007)(83380400001)(316002)(107886003)(26005)(336012)(4326008)(6862004)(70586007)(5660300002)(47076005)(8676002)(70206006)(2906002)(54906003)(36756003)(8936002)(33656002)(41300700001)(36860700001)(82740400003)(356005)(81166007)(86362001)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 01:27:52.3074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4eeb0a3-f133-4e7d-66aa-08dbc5424b33
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5910

Hi Roger,

> On Oct 2, 2023, at 23:11, Roger Pau Monne <roger.pau@citrix.com> wrote:
>=20
> Since it was indicated that introducing specific new vCPU ops may be
> beneficial independent of the introduction of a fully physical-
> address-based ABI flavor, here we go. There continue to be a few open
> questions throughout the series, resolving of which was one of the main
> goals of the earlier postings.
>=20
> v5 adds one vm-fork specific pre-patch that does simply the introduced
> code later on.  It does also fix a vm-fork bug.
>=20
> Patches 1 and 6 are missing and Ack from the mem-sharing maintainer.
>=20
> Whole series will need a Release-Ack.

We agreed in [1] that this series is a good candidate for 4.18, so for the =
whole
series,

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

[1] https://lore.kernel.org/xen-devel/0be1e32f-5600-7b3a-8d72-84297a1ebee0@=
suse.com/

Kind regards,
Henry

>=20
> Thanks, Roger.
>=20
> Jan Beulich (9):
>  x86/shim: zap runstate and time area handles during shutdown
>  domain: GADDR based shared guest area registration alternative -
>    teardown
>  domain: update GADDR based runstate guest area
>  x86: update GADDR based secondary time area
>  x86/mem-sharing: copy GADDR based shared guest areas
>  domain: map/unmap GADDR based shared guest areas
>  domain: introduce GADDR based runstate area registration alternative
>  x86: introduce GADDR based secondary time area registration
>    alternative
>  common: convert vCPU info area registration
>=20
> Roger Pau Monne (1):
>  mem_sharing/fork: do not attempt to populate vcpu_info page
>=20
> xen/arch/x86/domain.c             |  33 +++
> xen/arch/x86/include/asm/domain.h |   3 +
> xen/arch/x86/include/asm/shared.h |  19 +-
> xen/arch/x86/mm/mem_sharing.c     |  73 +++----
> xen/arch/x86/pv/shim.c            |  10 +-
> xen/arch/x86/time.c               |  34 +++-
> xen/arch/x86/x86_64/asm-offsets.c |   2 +-
> xen/arch/x86/x86_64/domain.c      |  36 ++++
> xen/arch/x86/x86_64/traps.c       |   2 +-
> xen/common/compat/domain.c        |   2 +-
> xen/common/domain.c               | 324 ++++++++++++++++++++++--------
> xen/include/public/vcpu.h         |  19 ++
> xen/include/xen/domain.h          |  12 +-
> xen/include/xen/sched.h           |   8 +-
> xen/include/xen/shared.h          |   3 +-
> 15 files changed, 440 insertions(+), 140 deletions(-)
>=20
> --=20
> 2.42.0
>=20


