Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A855B021E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 12:52:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401210.643005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsfA-0001dA-Tw; Wed, 07 Sep 2022 10:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401210.643005; Wed, 07 Sep 2022 10:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsfA-0001bC-Qx; Wed, 07 Sep 2022 10:52:08 +0000
Received: by outflank-mailman (input) for mailman id 401210;
 Wed, 07 Sep 2022 10:52:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2HvF=ZK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVsf9-0001b6-TX
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 10:52:07 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140089.outbound.protection.outlook.com [40.107.14.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d82cc87-2e9b-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 12:52:07 +0200 (CEST)
Received: from DB3PR08CA0009.eurprd08.prod.outlook.com (2603:10a6:8::22) by
 AS8PR08MB6567.eurprd08.prod.outlook.com (2603:10a6:20b:318::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 7 Sep
 2022 10:52:04 +0000
Received: from DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::44) by DB3PR08CA0009.outlook.office365.com
 (2603:10a6:8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Wed, 7 Sep 2022 10:52:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT023.mail.protection.outlook.com (100.127.142.253) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 10:52:04 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Wed, 07 Sep 2022 10:52:04 +0000
Received: from 6fb5d9769b64.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C3232612-E860-474D-AEEE-F49DDE403775.1; 
 Wed, 07 Sep 2022 10:51:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6fb5d9769b64.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 10:51:57 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB7842.eurprd08.prod.outlook.com (2603:10a6:10:39d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 7 Sep
 2022 10:51:55 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 10:51:55 +0000
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
X-Inumbo-ID: 1d82cc87-2e9b-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dFSTpt7Z832onP/39P3o5y0lB6MuxGbngz8YUe8UtgJEiJ9OU4x1odcBtsCz1rsS9GaWn5kPygg8zibpnS1R+SuBlSGmpoYhZDS0V/6KH9WU3ssj0Lc2X8gmMoZmP8+k2DO+zPjcTKMbghjljwm7za3GJvIe4eP7dgq/XSOwaKErcCv51uKzyNGOd21ZomeJiJAKDEkS+1BoT99qxKEE1QFWBuJi/eDmsV6doU2YC4zi8avlH5BpvyUkpPN8e5zq3WvxG7sUKoRIviMSSOjS0wdzNbG/owGuIr9ee3EHlSKqNqiTZvI5fhlnrHYfIwgIOMIBTgxSR7ql3C53+kpghg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHUaX32//UmlLZr3kDOAUXue1NlS8qQrKgnTLnUUlQ8=;
 b=FAyTzGAwhR40warT46nG0uoPE99Uyt5JEo3g0FEZPWSOytXGF1lzFvUmnpo4G1UUxN25LlyxnH84uCabYbE+mSQNMiABVwydjk6/YvDHkM2to7jOl5LDQLJkpxClxVUZ7u1G8It1mXZSadU90/2txa8+Av1arzvqxbApYW8HkhPGWQSYgM4z6EAGvG32wf4OylM4Gm4ckvzmpJaGij+hWuaSrPBa8DTCl6N1WQDL7WI1M6Wb/4lEAB15OtkwuOFye/rB1tnbXjbwtWGt0uUI3nugx12HWhv8639ED3w13A77z7nk6mEL8kYVq0ud4xd4VuZ/gJH+AxbdI0cFX36xZQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHUaX32//UmlLZr3kDOAUXue1NlS8qQrKgnTLnUUlQ8=;
 b=9JUX8rc3TjSqdL/dCa9RQkfNASuy9h473eqsfrOsjZSeSN8qzRU4v7/jyWDxbuvMSXsOeNOvKZjScyQxC/fF8tafa7kCJEZLac2AWqIl58IJ1X8LfEh0SujH+XM75pAJ9YPReEzHYHLjgFOfTiS8oJk2LxsIl+gPujXlmOK3PKw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 86654578b481cae1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0Fpr0vgMD6SjkHIMA+/XZ4Td3jKTE+9HtkOS2MVlrV9sw+2TiE0EHyVuHanmPNPKfJ5tp1mfF063n74MTJ5lHR9XvNplUb7Z3iFn5uwUDAuvTGYa/ZzmrkzormXsn/r0I9MTQ6w66VUh1SKabuLJB8zRxtwEye0RUusEQ/wZExPV2uSaO7wOH0/1iAgKwCTCdYT1YHcSL57PnL7xR9VJyJOB4Ql0WuB21Ezpf/EfjcA0WqSLMZRqKz1Oy37iBJn/6nDqqUUDWxc1z5xqok9vlEXsZ7mQbF8shnNHi62DHFwcKgO0WE5gXVuJGztse9S1xAVtlN9bKDulgzxUvHlEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHUaX32//UmlLZr3kDOAUXue1NlS8qQrKgnTLnUUlQ8=;
 b=XHwvwt88wb9t6H48Qmx92qturkuKXXQ4WWS9Z2AVlqjflBQm3QcgWGZ57G1kvxPqPcXoyFCnDPf4SnRbkXq9+W/2I0ynfaIag0KXRon1otvvs4CKARWoH3oxuq9VU3VL/7/BgitQQoFFQ5FwLHL2DZBfZaPEc+SZWlNGQ/crENObJ+yUBQUNYD8pzgEkYnIhlmYQCBEzQTWNehKsvBXLwpW10GwGZ5hOs9uX0/dUejDc4Y/zXtXcFI6dqNsuKeYYGcgUSxCSgJO+SJdsj2tWlm8D/DTGl4iUAiLIu9NjeMEmZEgRgVIQTSWzQ89ItGPq+nQcafkhrT1B8gEWzG0xRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHUaX32//UmlLZr3kDOAUXue1NlS8qQrKgnTLnUUlQ8=;
 b=9JUX8rc3TjSqdL/dCa9RQkfNASuy9h473eqsfrOsjZSeSN8qzRU4v7/jyWDxbuvMSXsOeNOvKZjScyQxC/fF8tafa7kCJEZLac2AWqIl58IJ1X8LfEh0SujH+XM75pAJ9YPReEzHYHLjgFOfTiS8oJk2LxsIl+gPujXlmOK3PKw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>,
	=?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Simon Gaiser
	<simon@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Setting constant-time mode CPU flag
Thread-Topic: Setting constant-time mode CPU flag
Thread-Index: AQHYvnCFtdzK/xNtMUekqKxcT1Pan63T0s+A
Date: Wed, 7 Sep 2022 10:51:55 +0000
Message-ID: <594CE8A6-472E-4379-AD8B-A292A92B7737@arm.com>
References: <YxFk2GaIQVCAFsyi@itl-email>
In-Reply-To: <YxFk2GaIQVCAFsyi@itl-email>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 31f21974-7d28-406a-9e9c-08da90bf006c
x-ms-traffictypediagnostic:
	DB9PR08MB7842:EE_|DBAEUR03FT023:EE_|AS8PR08MB6567:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wBWxjJgiemShewp6nrMK2oKFOPmGl4ExR3ZqUoXjjFhIRV3obTZtQ0HiR7+G+LNJVw+0plkJ05+4QBRGBHvGq6wQf+ainJ8cexxaJDofqjJKT1j0rCgfAVH8SXwUk9rEFs+SVS94zYA3vY6eU4K77u/twGa+2xq79Y5Kt7AyOOsiyP7kUrAT2JOy6B2GWJUqwVOdgWVqwUpZe3fWpyMSjV4xjx+LX0Ihua4GHsIOmoIgZ0pFrm05tDv81jeNzShvmUXow2KxD2TqMLc5vtAVBdA4s0oOYTd1l7+ghg23JT84xm8c3856aOsGY6LOP+PVwkYVQfwBNji7lAElyZbQnPsSzHfCAuQ1Wt/dWFC/wlEAbR3X42SCbPC8eGJ2b0iw42Y1cok110BRkNTNkV57bWvO5WgUVhh3PFPyDRC7QwQmosm3rGdZXriaX1BS7lajoqf2XgHUUgRMWX0OZRRTPeauAMnu5m0YFk9WnhvBQCv0f1ubtGMxZBtoWmK1bRYJH0Y8VFSUddLvUySBZ0eP2UgMXA97Gf9kr7kW1LLMKcsYz6AA4xJipAj0yiO7gaeppZjuN6BMG4Lj3SnY7kMDx1CG94+ug8EDSAMX0YV5bn3JxjO9lCo04WOT9XwsWVUVIVnQQp7IPwapVck93nG5zMernRtvV3PxqaqvkVRoqUKPXrJPDXiwi9mQRKnOr1dq7fwVR1Hpt56iosKojXw/plM1f6F6oJJ+zLfQgMqnFqkB1WIJskBJ1idTowajogq0oV+P7Vsfwf5Swzzb9ubhAssys7rYFRQFCOaFWDKjHcHm6djRSczv6TbBNP8THmCNf6SQ+weHiqyvbdSLsVxGMQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(122000001)(38100700002)(2616005)(966005)(6512007)(26005)(186003)(6486002)(71200400001)(36756003)(4744005)(33656002)(478600001)(8936002)(2906002)(5660300002)(76116006)(91956017)(86362001)(38070700005)(6916009)(54906003)(4326008)(66476007)(66556008)(66946007)(8676002)(66446008)(64756008)(41300700001)(316002)(6506007)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0B2103D13EB09B409B1E119A7A5E7B42@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7842
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6279f822-df34-48f1-f729-08da90befaf7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eyud7X7e/bcKsrJfCSeToRmXgxo7GneRRkYprIZjjZF2biBeQxMjEv+Th1qlaKnHpiJ21IMDTRs4F5vqv+ejSv5KrYdFsiqeRlXJTBan4qsREiRq/krFacVGz1TQ7rmCJ4Wdw2vGyZ7GwyQyIcOlOUJixxNMwK0UuSRJH8CmY7RvV80oFuJfmvMEx8M5s6uxzleT/Oxm24g6TPykyUKnHv7duMlnSjU9XeIGas5MQ08o41im2+mHon8uZKTZZTqoCa31jUq7USBiZld9Vn8RWJNaoMfO+ju45rKOlN3TSNI8j/P3CtjhMIDyRNklXcCjJDc0lrG9h7+blHg0l9CTOudFXGLgap8TDcmKnC8UWNKFy258RX5cpnRazGY5kQrabYLj7NbbBLIziK0pWsSXjoj6nA4DcuZzCllq/JCQ/4OIWJBymrVr5M/MvLUbFQLxshrHBuXXjl3vWdrNx0hpVGqgFqMIHEPUgKu29R2YlE4T7lANQFCFmSEob3loSrnivV1tvEePuHQz1n9EGHVD/uMbtGkgvZFMBGXHKcXXzHV8VK8g+ANeBR/808ZKr/VjeJcKFWRrDjhpFfJt2gUN47pKZVVzwV2EYtC1TWBM3C9yWO80DsMQ2RhGI91Ihb4rgTy54ayA+xqe3KoSuZne//cWgVOBAo0Fb50b3DzM9to3fzAHYHemirkojOejMp9XQlv74Z76A9l/nz5bmGQlySpi7qpwc1JsornGO02E9fXwv9aNIGN00IH4soxT3cl+w1xrXBbOR2DZIvFiG2m39pmT4/CH+UIqqoUJW+LV9Sw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(136003)(376002)(396003)(36840700001)(46966006)(40470700004)(4326008)(70206006)(8676002)(316002)(82310400005)(107886003)(54906003)(86362001)(36756003)(6512007)(26005)(47076005)(33656002)(70586007)(2616005)(336012)(186003)(4744005)(2906002)(356005)(81166007)(40480700001)(6862004)(8936002)(6486002)(53546011)(478600001)(36860700001)(41300700001)(5660300002)(6506007)(82740400003)(40460700003)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 10:52:04.6618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f21974-7d28-406a-9e9c-08da90bf006c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6567

Hi Demi,

> On 2 Sep 2022, at 03:05, Demi Marie Obenour <demi@invisiblethingslab.com>=
 wrote:
>=20
> On Intel chips (Ice Lake and later) and ARM64, a bit needs to be set in

This bit would not change anything on Arm currently so nothing is required =
for now (and nothing has been done in Linux for ARM64).

Thanks a lot for notifying us.

Kind regards
Bertrand

> a CPU register to enforce constant-time execution.  Linux plans to set
> this bit by default; Xen should do the same.  See
> https://lore.kernel.org/lkml/YwgCrqutxmX0W72r@gmail.com/T/ for details.
> I recommend setting the bit unconditionally and ignoring guest attempts
> to change it.
> --=20
> Sincerely,
> Demi Marie Obenour (she/her/hers)
> Invisible Things Lab


