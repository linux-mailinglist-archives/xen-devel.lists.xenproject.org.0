Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BB07D0607
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 03:10:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619611.964981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qte1l-0003vo-W2; Fri, 20 Oct 2023 01:10:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619611.964981; Fri, 20 Oct 2023 01:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qte1l-0003ty-S9; Fri, 20 Oct 2023 01:10:13 +0000
Received: by outflank-mailman (input) for mailman id 619611;
 Fri, 20 Oct 2023 01:10:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0mrC=GC=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qte1j-0003tr-S8
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 01:10:11 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 686837b0-6ee5-11ee-9b0e-b553b5be7939;
 Fri, 20 Oct 2023 03:10:07 +0200 (CEST)
Received: from DB9PR02CA0027.eurprd02.prod.outlook.com (2603:10a6:10:1d9::32)
 by AM8PR08MB6417.eurprd08.prod.outlook.com (2603:10a6:20b:362::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.25; Fri, 20 Oct
 2023 01:10:04 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::ea) by DB9PR02CA0027.outlook.office365.com
 (2603:10a6:10:1d9::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26 via Frontend
 Transport; Fri, 20 Oct 2023 01:10:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.24 via Frontend Transport; Fri, 20 Oct 2023 01:10:04 +0000
Received: ("Tessian outbound a024c74d4d6d:v215");
 Fri, 20 Oct 2023 01:10:04 +0000
Received: from 2fc86f1b4fdf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E1D4AAA4-80E4-415A-B15B-D5E996A0B7F0.1; 
 Fri, 20 Oct 2023 01:09:58 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2fc86f1b4fdf.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Oct 2023 01:09:58 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB8082.eurprd08.prod.outlook.com (2603:10a6:150:96::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 01:09:55 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 01:09:55 +0000
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
X-Inumbo-ID: 686837b0-6ee5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qyXG9ZiXASSVzHPAo0gjCuvSwpm/32VjtD51kZ39j8=;
 b=ZwqskH90Za2rcyZqUrtIzWmb9iub5wl6By8pAKMqkL1eoVj+tMDZ3ZmYMV5h0F6l8q4OZzU8ievodC9HRmd/4TtJZa1fxdONvgBuBKJa1G2HiROj2jCoMkq7ZV60bLrGIdGo/gr8eHj3ymDQXjAxJ4VqkiMtEgI+6eJ8Ld6cca8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7df759a999a713a7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nA+i/LoSVa/dS2y1hCY/MmemCGiZa7zGSs2FA71OAD3l1xZwzq63F0UJk+c5i4gajeAwpSsMwDi4Gri0oWh6C9exmKYbmMB3aMlI5ynMVbDrbBk0KXUKgqug06VB9qaLSO3CPq/JjQjDf9dEXnGBxyRyuxBsjYwVHG47skjChXoJMiI+RaUEvmN72HiHnOJZc8l4kYOJw1AWbuV215ioy2dqa4OioE/NUGW/r/0xKuZLxDLp7vtqTwRW1vsmlqf9tCz4CVQxKmlPFBpX0tgokms3HkO2U2Nes6mGsbMelqR4IZI2ScT/qaZgpzXW/XclfgQ+GNFeEDizjgFV0g/cTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qyXG9ZiXASSVzHPAo0gjCuvSwpm/32VjtD51kZ39j8=;
 b=SEWYP8MHklxJUhsrVdce2++v8+tlU6zYHMgw+N1RH9MLQnjuAYDHqKN5ZzDlQ0AC7uKIp1s/fxVVvre413CTlsElpW8qgF8hYjOZo+J/ljbuMj3GYOcEygVAfnZ6w38tWzT8Xz8HiYFkPSPcbpENoJRY6c+QBEr01nPoXGoIpdAm/2udk7/9+35C6c5IUx2lQIrbxoz/Ag6BBg73jNjivmyHhfJId4Dz6tjy1eNZ5TtCZ+ZgwcemtpBlnKlb0xMBSR6zocYe8h+GKCs7wG0VukbAsbHHbcY24KM1Mji+Qglm50wU1V5QMyLyhzwTmXTpcFrI5OLpALO6j6SsS53/YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qyXG9ZiXASSVzHPAo0gjCuvSwpm/32VjtD51kZ39j8=;
 b=ZwqskH90Za2rcyZqUrtIzWmb9iub5wl6By8pAKMqkL1eoVj+tMDZ3ZmYMV5h0F6l8q4OZzU8ievodC9HRmd/4TtJZa1fxdONvgBuBKJa1G2HiROj2jCoMkq7ZV60bLrGIdGo/gr8eHj3ymDQXjAxJ4VqkiMtEgI+6eJ8Ld6cca8=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
	Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH for-4.18] CI: (More) Always pull base image when building
 a container
Thread-Topic: [PATCH for-4.18] CI: (More) Always pull base image when building
 a container
Thread-Index: AQHaAq/YN2Cped61akCKSY6IAN2rpLBRX2AAgAAkU4CAAFsjAA==
Date: Fri, 20 Oct 2023 01:09:55 +0000
Message-ID: <307CC40B-CD1B-47C4-BD33-E806A7F82F9A@arm.com>
References: <20231019171452.1704276-1-andrew.cooper3@citrix.com>
 <f8cb1c63-b634-4bd2-9bce-54d2e3e6dbe3@perard>
 <alpine.DEB.2.22.394.2310191243260.2099202@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2310191243260.2099202@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB8082:EE_|DB5PEPF00014B9F:EE_|AM8PR08MB6417:EE_
X-MS-Office365-Filtering-Correlation-Id: fafbfa93-734d-4420-94d5-08dbd1094ad6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 r4BIWlSCc0sWg/CFvsG5TyfaFNbu7ohjiRBB0xDd2kxJEywSSo880aUcWm5QznklNvTQGDnSuBq+SPWhdziF5ZeuMnyTw7Ps+KlIT5p5Bne8yy9xnJWXhuyyh95z17QtafemKzLCUq7o68HHkzdK3DMBYi8AIvzXzj+HJWJdbdpAt7Zw0xWN93sHAu03R4Ks8PcvL3zlaYP4n2TeybQPnFakV1g253qUrf5dGUsWkl3Uc5rymo1F1CIYAoJ6w1DHThEVRx+G/+4zgES97vf/ZmFLC/j+FPeMXIfsVRu2TbohNwL84djeQZqabSUjGB7+gI1sc7kzT0hPkX2ph1I8bYTkiLXCRWKQQVXUGLp7z3Ef8Me0PcR7u6SqYrdX4/4SPz/0r5qPLYxd7Cxd7T2tLz3MxWIdotHLxcj22AowTqCYXpKHQvNvOrqOw1YCnFGgY8kNHBHEoV1oSQ1OTW1HUHWoD0dqzHstaVj3RGGRUDDI4pxd9F0iCTH+YVjzIr5OLuwjwAIEe3obD+ngpKvtNPunC6/LTJFA4Tb9fOYSqieZ33LD6FaENjpOn3ZVFyfc3/QKfso77Kbm0ErvceGwquudek3t4c0DRHUc9GC2+kjRNYswEvxwmaGT87evxG/Se2vXYXOp6tkap3pZzLdQbg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(4326008)(66946007)(76116006)(41300700001)(8936002)(54906003)(66446008)(64756008)(6916009)(316002)(8676002)(86362001)(91956017)(66556008)(66476007)(33656002)(36756003)(2906002)(4744005)(38100700002)(53546011)(6506007)(478600001)(6512007)(122000001)(71200400001)(26005)(2616005)(5660300002)(6486002)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B86019F4E7EF4C489DB0AA44E01760AE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8082
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	637291d4-eef7-4878-604f-08dbd109457e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A/2StlP1YBnRPfVyycqhNSkO2nYQ/tYf0ix0l2FXDUAb6MxAd45iXnEVUQ+3IXNx9ATFHafOlyU0mXUOYhr4MuAShe050OCUhLSN3IyoxsHzKJY9o3fHI5vtlNEPStsT/6iW8a/Z3g3ni5S7HEG9JDyN2qJs29KE0wlcfhnMzanXdvJ2ZIVOvAirpfNjh5kTWtrgC9lHLlmX2AVFKGxfDgfAVKosPb7XxTbPELsNY1vzD3kiWUHbwc0D0cVNl9vu5cDL67umHJI7r/yA4oPTdRcNTLDJY/4FxgwuSvnGV7jnoEx5zX7kNMXt7w/tejIRv3RkQidIhLbSZ7RqisRCzI/nqpGql4qHc4Ai0+0TEXxRsik9+phB5uN2bnBqUpq1Fy2eVwWgZATI/LzRiGqUhQgHjrUuOg6+MG0GxjlN8TzF8ULukUAGDTkHuxx4Bq7Uz3HwdqyF9i7WyLcikiPh/9z2KarzyaTIHjXKg5F0tJTkjJp9xl6+lMGAkfQYdym86dzVtUuMI7imSZECjFpJta5l1fw/1uF21jTDBEudFD1cVfJorzx9YXMHUP8hSuXK8y2nubmq2JZDOtusRvDtBdGBP/3FmlpDmCjMJHLehIRMtrRJzJ1NhgNN6IWF6kmswoBBllX9o0udlKm4ETOLciovc3AjmlTTyldwr/XtWwv5WVrbkfta1KM6FJkHe6VdeEq/ff0qO3s6FUabddW74VYOyG7g+rozRWfrx+ggPIX3lmYZjpyzthR+QCn/JgmG
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(1800799009)(186009)(82310400011)(451199024)(64100799003)(46966006)(36840700001)(40470700004)(2906002)(4744005)(53546011)(40460700003)(4326008)(6862004)(36756003)(5660300002)(8676002)(8936002)(40480700001)(41300700001)(54906003)(33656002)(478600001)(6486002)(86362001)(70586007)(107886003)(70206006)(6512007)(6506007)(2616005)(26005)(81166007)(356005)(82740400003)(36860700001)(336012)(316002)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 01:10:04.3388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fafbfa93-734d-4420-94d5-08dbd1094ad6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6417

Hi all,

> On Oct 20, 2023, at 03:43, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> On Thu, 19 Oct 2023, Anthony PERARD wrote:
>> On Thu, Oct 19, 2023 at 06:14:52PM +0100, Andrew Cooper wrote:
>>> Repeat c/s 26ecc08b98fc ("automation: Always pull base image when build=
ing a
>>> container") for the other makefile we've got building containers.
>>>=20
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>>=20
>>> For 4.18.  This is CI infrastructure, not part of the regular build.
>>=20
>> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
>=20
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


