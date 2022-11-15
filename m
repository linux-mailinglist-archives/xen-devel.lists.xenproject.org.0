Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0CE628E1C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 01:16:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443617.698264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oujbw-0007eV-Nf; Tue, 15 Nov 2022 00:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443617.698264; Tue, 15 Nov 2022 00:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oujbw-0007cR-L0; Tue, 15 Nov 2022 00:15:32 +0000
Received: by outflank-mailman (input) for mailman id 443617;
 Tue, 15 Nov 2022 00:15:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zGhI=3P=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oujbu-0007cL-GC
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 00:15:30 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bc49086-647a-11ed-91b6-6bf2151ebd3b;
 Tue, 15 Nov 2022 01:15:28 +0100 (CET)
Received: from AS9PR06CA0123.eurprd06.prod.outlook.com (2603:10a6:20b:467::14)
 by DU0PR08MB7591.eurprd08.prod.outlook.com (2603:10a6:10:31d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Tue, 15 Nov
 2022 00:15:23 +0000
Received: from AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:467:cafe::c7) by AS9PR06CA0123.outlook.office365.com
 (2603:10a6:20b:467::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Tue, 15 Nov 2022 00:15:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT028.mail.protection.outlook.com (100.127.140.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Tue, 15 Nov 2022 00:15:22 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Tue, 15 Nov 2022 00:15:22 +0000
Received: from bec860f9e116.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B93BF526-3274-4F33-8EB3-7303462C70C6.1; 
 Tue, 15 Nov 2022 00:15:16 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bec860f9e116.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Nov 2022 00:15:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM9PR08MB6001.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Tue, 15 Nov
 2022 00:15:14 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5813.009; Tue, 15 Nov 2022
 00:15:14 +0000
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
X-Inumbo-ID: 9bc49086-647a-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GaREI0M4n6bsjM0cowxS+3EY4VxaYRPJ5gdLHX1GV5A01xXEM2k8hmAexrbh8s25iePhOJGa7huv6GVqiwFhrWA63l+BcYkXjPEJDa0gzBjBFhL4MTvgGRhCJrFCVgPyBmwO5V0Wk7yu+0OsHNaFRW+k9eyrAYGS0JVLJrz/6F1LxB7EwMkhVH0vQpLaTO2U8VkFbx7dKSkJe+nz2OE73SFGVk5kgbcHFZT+738vBM9AWr26L7eONeDNZ8QN1HNFMPfrPQJxS1WsXPt9Wb0Xjg+MTVBN7h4rrK19GyzvK6PMQ4/oZlJsHp1ffWRoivrJbwhEj8RJgXlAxYBigVBVeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hcXMIpNfJ8wp2ekFQdBDUUx11/JGJINTrge5UmT/jU=;
 b=J2i4UyF+OKFtTuC4LgFX/Xx0HAEAN6PZZJA/6+Jvky+wCspbqPIvaPihdNHU9HU+Lyaox+IPk9Zhxi7K0dmlgQfhjXyshooT0oy7yrcrSr7F/Lquc8Y1BEoO8klMubWa78g9PbWY1yzlu/JKTk24Pce2KGhlusqVBqPib7RkS/3wgkSsBUxRX2jWr3L+z08BHa7jXKetGIfov2hHupLB7+QOAqH3mhblCyu/8k9/XSYYQb4EVnvzJ5BCNkbix11EzlKUmTlJILNuGb7Oa6wLjFBnitZjvaW3gicDew3p/KdqUU5hHq/AXL7AMkqyawMpP7YU8FXWVtVwymlT9gradw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hcXMIpNfJ8wp2ekFQdBDUUx11/JGJINTrge5UmT/jU=;
 b=GbieyVBGUI8F1m/TR2uOjnEwMc9KdknPaI8u3T893Q9QAMqqGDqLfDVp71B7M+pi4T3fiscDNclArCaITRHWRb9S5witAFJfK/Aj1iR94C7/vu2hzltXBrvDQ/3Xov3CAzYKde6FyOY1jmNrfdG6iEobVaRSaSwLdLJpI2syOd8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4AHPGr8WS0WQ2csVqgCtO4tOxHgP8yaCwg6Mf7NswTzlKp2EFN1tzpsVfAAh76Hrzjs90q6DvdTcc/gc5NQWYVj4YCp3Oce9L9SsWhcQR4+htxz3lNZK9EHQaaUSwY1EVQ03qAE3c0MQDW3HOkfEk+5e9jbkXT03Zl/iFojg5HL4kuUZ6rVYS85EGmk9hRM8Uiq9BwaBnuNC6/WOV3SXTDY27ZpF9pVB3mwHiGeIX/8TkBpGfZBSsMeR6oMUpX8SqsHa4I32lJWx72XrVIflurqimdV9cJb66/7ZYvVm4QOa7N2HyKALGZZuAxMUi23y4HzbpkUarY6ZPqnK8tiIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hcXMIpNfJ8wp2ekFQdBDUUx11/JGJINTrge5UmT/jU=;
 b=W+7Hf6X5CSHtt4r5Mh7aHuiEc+yWbR/jtveZts473luECgZWzyEnyaW3qPM7czphkjDOwByPjZtnKS3QTqs/O+oYSrkT6IP5zwGZvdVcevSrLlM38VUkguZxGMdMkQvW6naxTFkAdFk4HquUEVzsOdJ7KRziCIyZNPKVdzwvjXjVkewGaW9CUmwSatHb2hY/406zOTbjVDlME+3OwM1jJ/7y2uRduatZfhHorPsNvDjyiEVmaPV5Q8FbtQZI6kqdD2vgSDe2q+ef3KlQt+VDLEPwNfj/o8TzIUG/BgfPCweGqQDnTpZeKGUwSCb+XlHu2G5ZVldgZh8tDFRjdcEggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hcXMIpNfJ8wp2ekFQdBDUUx11/JGJINTrge5UmT/jU=;
 b=GbieyVBGUI8F1m/TR2uOjnEwMc9KdknPaI8u3T893Q9QAMqqGDqLfDVp71B7M+pi4T3fiscDNclArCaITRHWRb9S5witAFJfK/Aj1iR94C7/vu2hzltXBrvDQ/3Xov3CAzYKde6FyOY1jmNrfdG6iEobVaRSaSwLdLJpI2syOd8=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Andrew.Cooper3@citrix.com" <Andrew.Cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>, "wl@xen.org"
	<wl@xen.org>
Subject: RE: [PATCH for-4.17] Introduce CC-BY-4.0 license under LICENSES/
Thread-Topic: [PATCH for-4.17] Introduce CC-BY-4.0 license under LICENSES/
Thread-Index: AQHY+HmFh024TYCxEE+Jzx5Npg+Pxq4/HXRA
Date: Tue, 15 Nov 2022 00:15:14 +0000
Message-ID:
 <AS8PR08MB799194F599FD23B290AC49F292049@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <alpine.DEB.2.22.394.2211141433550.4020@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2211141433550.4020@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6E26464BE5430241AEB943FD9B67BC71.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM9PR08MB6001:EE_|AM7EUR03FT028:EE_|DU0PR08MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f11724-b449-4447-0b98-08dac69e7cdf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XTszWC5X6X4QrXx4coE4UemcVCienFzwn6QNEZ4+oqCL37iAyAFPRHtMwOU805pCM4+syuItKTwlCYscxs53urXU13+cGmucikY5lro2Bf41t3sskaNKutaNp0K8Tdl9htPRN8HklJWaU5rh+DPR2qXRGOPrTp2QY14iLWsp6xGKAj8LetrnNwpAGAGZ/UqhjqruKhgWTyr24+pj6im3VUfcS16joR7gkk/8Kexa7+26JkNRMlCTRkERtsXiicV7PGUasPC5f9Gj9gP3k3+8JcbLq+LDaXt1SKfb6Ch1kR/sWH1Ma1YRg+zgvYhqPeaC3y/3ju7WlTBYerTBLgWW6rSpccHUUnry+sJ2eVNQOLu9ev4azQJCxuHodKLt1EPtvXitM3+G7LhdZWQpscpbJRJZTBroB38KpPaf//+W3aJgUtMlxs2Yw7TIt7bnVPz3htfyBaehzAO7vGLkg+HnFwHtxkVOt/CStd2athikJ1nX2A/KYfxuQdSmjTwL4KbCxWx11WtBomRIC7IFe0U+U9PNEjltNOxGbfVFYBozdJy3BKhXlfBV/dLK3HncO1fsTiBLOWMBdrugreGXML2D/4KSZtkBiQP4fWJ9D/fxXqY2P7L4khBmhWmoq0KYVQbeyD/vzSa5omj6lD8djs4eOHJPAxN0DH9dnCJoVnotMk2oQ/mrmMC5pGcObnhnMQOStwbgHgSbGaSKPgBY+kFmIBH3s+gy/vHqecPiCKIIaI3xkHiFkmf+Vlhj13MNwahf0LF5GWwssClOx+Z8LDCBJQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199015)(4744005)(64756008)(76116006)(2906002)(9686003)(122000001)(478600001)(38070700005)(66946007)(86362001)(41300700001)(33656002)(5660300002)(52536014)(38100700002)(83380400001)(186003)(26005)(4326008)(54906003)(66446008)(6506007)(316002)(110136005)(66556008)(7696005)(8676002)(55016003)(71200400001)(66476007)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6001
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	34284c61-497c-4ae3-1f58-08dac69e7807
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dEKUQmizQjxrgPwM6JIAE2QQIpH8yqQ/eWHktsV0Mt5BRBqWwMddQJJ8fjJKN568XlNd2ljvWcTRN2c4xuRNsAbizDbkFDQcYlDndixZrX55rekMheVM29scjLQGuQsIL+AP9lNl4Tt8ZD8ukTrqHrmeMe4CDPBR0VzdywEPqg9vyKDokxTvKnviOMcuHnJiP1IQbHy6iwvwut1w8Y0SjDEqggo4R9kbkxMJwZwCfOfrgktGiWXotsQjbxlbCbk57CntGC8JoCAcORIlh4pyoBk4lTCuCQvehwHjaaV1mFK+50jrUHq0XNiM6ciEYpUJybAqlyHk6tXkrNK1Z1KmO5TvFoeRTE8zln6DEQXPQ6hVy53fzEmrMtNVsk8oUDmXIN/K/MOeTQmid9XJO3fTyLyuekqsRy3TBVNnCiEj9MecKSeY7pT20mHJZm1ixYQ2JYYUItvLVMSo/DVvlasVWyp7+XDYIHHr6bXRCckk4xO1C6Luhs5y6LzFe6RY8DjEtPWqqPtBeC9sS8vx0lO68mJRxv6Q3iecmMJpjxR+V/u2BHDsjkUIH9XPj/23kNb3deqzkHjyAPM1hFoy+soQmfbdhnItkhbdqDlKM3Vuo7+wm1zZg23U6NxUZ0iu+ZvO2LkORXxf7SOi6dEASkx+z/7SczTlf7uWVsRd+JPrF1pXpj5OIpLg02yFxEQ+o4Gpiwgvzrh5ytqPYzunWWdp9+0yhmaVac4FfVQUvgfJOMoloQlfbZlZ6j6M02o79yAhjQvDvOBBdsDIfX6yzPCB2g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199015)(40470700004)(46966006)(36840700001)(5660300002)(82310400005)(52536014)(4744005)(2906002)(8936002)(70206006)(4326008)(55016003)(41300700001)(70586007)(8676002)(36860700001)(33656002)(478600001)(81166007)(6506007)(54906003)(316002)(7696005)(110136005)(9686003)(26005)(40480700001)(83380400001)(336012)(186003)(86362001)(356005)(40460700003)(47076005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 00:15:22.7846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f11724-b449-4447-0b98-08dac69e7cdf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7591

Hi Stefano,

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Subject: [PATCH for-4.17] Introduce CC-BY-4.0 license under LICENSES/
>=20
> We use CC-BY-4.0 for many of the documents under docs/ so we should
> have
> a copy of the license.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Per the message in IRC, it would be good to keep the licenses complete,
and also this is a zero risk patch, so:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

