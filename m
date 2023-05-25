Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1053710724
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 10:16:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539349.840130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q268p-0000tF-0k; Thu, 25 May 2023 08:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539349.840130; Thu, 25 May 2023 08:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q268o-0000qj-Tk; Thu, 25 May 2023 08:16:10 +0000
Received: by outflank-mailman (input) for mailman id 539349;
 Thu, 25 May 2023 08:16:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zmzE=BO=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q268n-0000qb-Am
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 08:16:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2049.outbound.protection.outlook.com [40.107.7.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64b3350f-fad4-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 10:16:04 +0200 (CEST)
Received: from AM0PR02CA0140.eurprd02.prod.outlook.com (2603:10a6:20b:28d::7)
 by GV1PR08MB7804.eurprd08.prod.outlook.com (2603:10a6:150:5b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 08:15:35 +0000
Received: from AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:28d:cafe::ff) by AM0PR02CA0140.outlook.office365.com
 (2603:10a6:20b:28d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 08:15:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT064.mail.protection.outlook.com (100.127.140.127) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 08:15:35 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Thu, 25 May 2023 08:15:34 +0000
Received: from 796bfa392c9f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 520A2C61-F63C-4453-8C00-F756A70E7474.1; 
 Thu, 25 May 2023 08:15:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 796bfa392c9f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 25 May 2023 08:15:23 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB8205.eurprd08.prod.outlook.com (2603:10a6:10:3b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 08:15:19 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6433.015; Thu, 25 May 2023
 08:15:19 +0000
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
X-Inumbo-ID: 64b3350f-fad4-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HP5sJB4xUY/NHfvvEPBXJTj8QveLscNRQPhIjfj+vY0=;
 b=48MkGWw3wDscG5iZWlcdjBuzY/kksnO3NUounBGOsYbk7AHV82C2ucPwUt5HYxvX9nySFCYEfkOKGsp5W+7ztRMYtRap7Yu/sFAOR1p4BfWt863QurlJwFIm8rPTqk8XEnxsk3DSUC+KyT57gvcgyBLxShA0HC/1Sra4dQMqJbw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f210bb6480b0639a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTTSSbnd80H5Wx1XZrZjJ6qckt+tGUizivEUvBva22n445nWRhcAxPA02pjjXj+elEWIriVS28gbpAFGEhu9bm0/ZCfYK75MZ4B2Agp2dfmPM3C63IjlEpjTQfFR3CyFuKX5rVSaF4vty8ZKgDFkVZTrJAZHbcevzEBKkTxPZbS+4BG7Fvi9/HDO+uhXG7tEPGspFjLORGby0W/G2fyhUx3QyIRh4YOImcww5pW+6oRpMDxYwakDe3d6TsaMGpz7SY4tFCSiAHbwdap2dzQYRRN+c0aSOXUnBTzsewq06zu9KFfxMf6P4lbdsx4X8HKfKdr47hE3uiEjXB6W32xOZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HP5sJB4xUY/NHfvvEPBXJTj8QveLscNRQPhIjfj+vY0=;
 b=E2AIj3pVVWJt5krGl+DrNo61gV9ubw3phLRS6+HxNB0SIfzm5UYGj/f1JMHyifCFo+nEZkhbI5hcKiPaP+7L5hTCJJoDFuXRu/qMFuuI6sU8SsG88VDL1vfemlXXNWfyISA6ubF2t019xtgXaJlYaC8FMKtwQpLenapwFA28wvXYsF4H/Rcwm2Gu243WoNlh1+aRu7jJ3HtC8OAeSRTHM6ANl81AeghNBwF1Vwqtp7pOJlGq2ZG3eewLiZhUhhXvWjXSg9wK9GWQtAZLVWQD1rL5r9m9zIdlMyCHaSkVrv6xiFqEeUA0QwSNU4lWyT0lynZlsfVu62n8WLn7oqyuUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HP5sJB4xUY/NHfvvEPBXJTj8QveLscNRQPhIjfj+vY0=;
 b=48MkGWw3wDscG5iZWlcdjBuzY/kksnO3NUounBGOsYbk7AHV82C2ucPwUt5HYxvX9nySFCYEfkOKGsp5W+7ztRMYtRap7Yu/sFAOR1p4BfWt863QurlJwFIm8rPTqk8XEnxsk3DSUC+KyT57gvcgyBLxShA0HC/1Sra4dQMqJbw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Anthony PERARD <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>, Community
 Manager <community.manager@xenproject.org>
Subject: Re: [PATCH v7 00/12] SVE feature for arm guests
Thread-Topic: [PATCH v7 00/12] SVE feature for arm guests
Thread-Index: AQHZjUpmzBq0o2ig+kKXA6VQLOswlq9qp3WA
Date: Thu, 25 May 2023 08:15:19 +0000
Message-ID: <D81DB0C7-F75A-4C41-9731-FC41DC6042E7@arm.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
In-Reply-To: <20230523074326.3035745-1-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB8205:EE_|AM7EUR03FT064:EE_|GV1PR08MB7804:EE_
X-MS-Office365-Filtering-Correlation-Id: f905886a-53ad-43b1-95c0-08db5cf83755
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 63ZXgGmQ8sY3Yna9zhAA+ASZcD+GI8k00oPyoJwbEUq04ppJ0R+TVskGRpTgHWfoHxu9ES4LI55IxYYLnMwl5LmM5S/APfcKjsjE1b4qBYLHiZgm5qHgOa0SY4gYLqRJkixbboWtUiLfHqgLCoX20owWILGf6P43T/akaIWP8T0LEeb8S5LzKR+hUtsyPRNAiVdMglZA9+paaAnm0S53nrBHRjK2PisenGOztKeaWV65+iZzbmKCPMH3V0eb/4n3S0gVpGc0dDYRBgsxnUQglyLbMPxhGOGHYSPZv3GxP6RKyMpp7k/vjOUyuzC708NOZMr5bJSDT0n7d83AEF8jm9ukc7THJ6S/IqxqtiTQW+2jw5PSofozKcVQ6BGNo88QwD1OKws8cfZ2qIVBdmFJ3gvX92sLlZTH/DgH4/R0jNDPlY8ISiQfVfpIMHZrIa0wMOj2rPTWGj4/sTKEeBHQ5Ssscs2PQnRzNRjsleBfkVMZBd8ozLIw854aB7zcBeyYvL4vlK3kuIz/kSoQX2R8UIWUZ28wUj340Jk99hfTZbgwB+8tmJyrvB3ZuwbxG5zaWD0ZixBoqmkaCKiQiu82aEuX2QCo/nUoKLF4rq7qFKoJ03MsFronjjKnVqMlABUj+jF1nLBureiPYc5urKZEjA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(451199021)(478600001)(316002)(26005)(6512007)(6506007)(71200400001)(54906003)(41300700001)(6486002)(91956017)(4326008)(66946007)(66446008)(66476007)(6916009)(76116006)(64756008)(66556008)(8936002)(5660300002)(8676002)(7416002)(83380400001)(2616005)(86362001)(2906002)(36756003)(38070700005)(122000001)(38100700002)(186003)(33656002)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <9D992C08A14E3443A56A1DC81052708C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8205
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e9f575de-4c46-4f84-0112-08db5cf82dff
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	veE0XOJ9FVWLp4NNnt/Of015GmBf7NMZL7VgW5/gBMJgzg9USf7DUipSPxfqeOSyAX/j1Oq2nHMrbB4mNUmTKxm4dJfHAzkWqgqu/6f0KScH0V0Od+/so48nwqCIKQ9l2hOC4iXCFOCZ80e+nII9Uk5bjL5iYRc0bFbO6/VwrEsdl8iobr4AV7S/RLnSNgxek+tr09BxaBr5+Ey68IGz8mMBg/MU6wskN0c0CGAxzz7CzmsiYAy0xxFCb5GmZwou+TejXkc7EvJJcPX/U/VGbYf8G80y8SJRsjunWiBn2VbMmJrbrJs9Z2uxUS2J4aI9bJZd4QHkDPvzWzrzfRClXuVBq9JXJMZMeU9h6PPTbqDZ/uL+CmTd9pic9j2RmHJSUAinHUDQbLzB9pznBjvZ2udY3dMZmKTeHsAHeeZAqOumFG2ekk+f/o4iL/bmnJkooAbbA62YpFOpZPA7RsEqYpTMAVv2/JcOwAs2HVRJbbNfLmrTPp/3zTXNcUmfRi9OOTQu7e33iY9U1Wy4OcJbzAqWdYPijkQPpZ49iQKANrMWSQ+0nrF8La1pHuGfSCjFYZx5cguJuh99bykcr8cgiE4UZLDxAEJ6XaymlElULr25NBZMNuxlJIbygGBvnyHcPdtKz5RMBqUeKkGmTuASHaDI/7z3yYIjp1rw6FX1qMOohnvCzG1lW8+hk0u5DD8VqMsnn7fBBVDny6V/PnD9CLE+1xROU3C4+/k0sLaafWWHiGF5KAyAxPG9Prpb1Nnf
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(82310400005)(36860700001)(2906002)(40460700003)(6512007)(26005)(6506007)(41300700001)(70586007)(54906003)(4326008)(6916009)(70206006)(478600001)(40480700001)(336012)(81166007)(53546011)(82740400003)(83380400001)(86362001)(2616005)(186003)(47076005)(5660300002)(8676002)(316002)(8936002)(36756003)(356005)(33656002)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 08:15:35.2120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f905886a-53ad-43b1-95c0-08db5cf83755
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7804



> On 23 May 2023, at 08:43, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> This serie is introducing the possibility for Dom0 and DomU guests to use
> sve/sve2 instructions.
>=20
> SVE feature introduces new instruction and registers to improve performan=
ces on
> floating point operations.
>=20
> The SVE feature is advertised using the ID_AA64PFR0_EL1 register, SVE fie=
ld, and
> when available the ID_AA64ZFR0_EL1 register provides additional informati=
on
> about the implemented version and other SVE feature.
>=20
> New registers added by the SVE feature are Z0-Z31, P0-P15, FFR, ZCR_ELx.
>=20
> Z0-Z31 are scalable vector register whose size is implementation defined =
and
> goes from 128 bits to maximum 2048, the term vector length will be used t=
o refer
> to this quantity.
> P0-P15 are predicate registers and the size is the vector length divided =
by 8,
> same size is the FFR (First Fault Register).
> ZCR_ELx is a register that can control and restrict the maximum vector le=
ngth
> used by the <x> exception level and all the lower exception levels, so fo=
r
> example EL3 can restrict the vector length usable by EL3,2,1,0.
>=20
> The platform has a maximum implemented vector length, so for every value
> written in ZCR register, if this value is above the implemented length, t=
hen the
> lower value will be used. The RDVL instruction can be used to check what =
vector
> length is the HW using after setting ZCR.
>=20
> For an SVE guest, the V0-V31 registers are part of the Z0-Z31, so there i=
s no
> need to save them separately, saving Z0-Z31 will save implicitly also V0-=
V31.
>=20
> SVE usage can be trapped using a flag in CPTR_EL2, hence in this serie th=
e
> register is added to the domain state, to be able to trap only the guests=
 that
> are not allowed to use SVE.
>=20
> This serie is introducing a command line parameter to enable Dom0 to use =
SVE and
> to set its maximum vector length that by default is 0 which means the gue=
st is
> not allowed to use SVE. Values from 128 to 2048 mean the guest can use SV=
E with
> the selected value used as maximum allowed vector length (which could be =
lower
> if the implemented one is lower).
> For DomUs, an XL parameter with the same way of use is introduced and a d=
om0less
> DTB binding is created.
>=20
> The context switch is the most critical part because there can be big reg=
isters
> to be saved, in this serie an easy approach is used and the context is
> saved/restored every time for the guests that are allowed to use SVE.
>=20
> Luca Fancellu (12):
>  xen/arm: enable SVE extension for Xen
>  xen/arm: add SVE vector length field to the domain
>  xen/arm: Expose SVE feature to the guest
>  xen/arm: add SVE exception class handling
>  arm/sve: save/restore SVE context switch
>  xen/common: add dom0 xen command line argument for Arm
>  xen: enable Dom0 to use SVE feature
>  xen/physinfo: encode Arm SVE vector length in arch_capabilities
>  tools: add physinfo arch_capabilities handling for Arm
>  xen/tools: add sve parameter in XL configuration
>  xen/arm: add sve property for dom0less domUs
>  xen/changelog: Add SVE and "dom0" options to the changelog for Arm
>=20
> CHANGELOG.md                                  |   3 +
> SUPPORT.md                                    |   6 +
> docs/man/xl.cfg.5.pod.in                      |  16 ++
> docs/misc/arm/device-tree/booting.txt         |  16 ++
> docs/misc/xen-command-line.pandoc             |  20 +-
> tools/golang/xenlight/helpers.gen.go          |   4 +
> tools/golang/xenlight/types.gen.go            |  24 +++
> tools/include/libxl.h                         |  11 +
> .../include/xen-tools/arm-arch-capabilities.h |  28 +++
> tools/include/xen-tools/common-macros.h       |   2 +
> tools/libs/light/libxl.c                      |   1 +
> tools/libs/light/libxl_arm.c                  |  33 +++
> tools/libs/light/libxl_internal.h             |   1 -
> tools/libs/light/libxl_types.idl              |  23 +++
> tools/ocaml/libs/xc/xenctrl.ml                |   4 +-
> tools/ocaml/libs/xc/xenctrl.mli               |   4 +-
> tools/ocaml/libs/xc/xenctrl_stubs.c           |   8 +-
> tools/python/xen/lowlevel/xc/xc.c             |   8 +-
> tools/xl/xl_info.c                            |   8 +
> tools/xl/xl_parse.c                           |   8 +
> xen/arch/arm/Kconfig                          |  10 +-
> xen/arch/arm/README.LinuxPrimitives           |  11 +
> xen/arch/arm/arm64/Makefile                   |   1 +
> xen/arch/arm/arm64/cpufeature.c               |   7 +-
> xen/arch/arm/arm64/domctl.c                   |   4 +
> xen/arch/arm/arm64/sve-asm.S                  | 195 ++++++++++++++++++
> xen/arch/arm/arm64/sve.c                      | 182 ++++++++++++++++
> xen/arch/arm/arm64/vfp.c                      |  79 ++++---
> xen/arch/arm/arm64/vsysreg.c                  |  41 +++-
> xen/arch/arm/cpufeature.c                     |   6 +-
> xen/arch/arm/domain.c                         |  55 ++++-
> xen/arch/arm/domain_build.c                   |  66 ++++++
> xen/arch/arm/include/asm/arm64/sve.h          |  72 +++++++
> xen/arch/arm/include/asm/arm64/sysregs.h      |   4 +
> xen/arch/arm/include/asm/arm64/vfp.h          |  12 ++
> xen/arch/arm/include/asm/cpufeature.h         |  14 ++
> xen/arch/arm/include/asm/domain.h             |   8 +
> xen/arch/arm/include/asm/processor.h          |   3 +
> xen/arch/arm/setup.c                          |   5 +-
> xen/arch/arm/sysctl.c                         |   4 +
> xen/arch/arm/traps.c                          |  36 +++-
> xen/arch/x86/dom0_build.c                     |  48 ++---
> xen/common/domain.c                           |  23 +++
> xen/common/kernel.c                           |  28 +++
> xen/include/public/arch-arm.h                 |   2 +
> xen/include/public/sysctl.h                   |   4 +
> xen/include/xen/domain.h                      |   1 +
> xen/include/xen/lib.h                         |  10 +
> 48 files changed, 1052 insertions(+), 107 deletions(-)
> create mode 100644 tools/include/xen-tools/arm-arch-capabilities.h
> create mode 100644 xen/arch/arm/arm64/sve-asm.S
> create mode 100644 xen/arch/arm/arm64/sve.c
> create mode 100644 xen/arch/arm/include/asm/arm64/sve.h

Hi All,

I received some r-by for this serie dependent on some fix, so I will wait u=
ntil next
week for further comments and then I will push the series with the fixes an=
d with
the tags to ease the committers work


>=20
> --=20
> 2.34.1
>=20
>=20


