Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DECD7F9D9F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:36:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641772.1000642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Yxu-00084t-W0; Mon, 27 Nov 2023 10:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641772.1000642; Mon, 27 Nov 2023 10:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Yxu-0007yc-Sz; Mon, 27 Nov 2023 10:35:46 +0000
Received: by outflank-mailman (input) for mailman id 641772;
 Mon, 27 Nov 2023 10:35:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+izA=HI=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r7Yr0-0000Co-Ti
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:28:39 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9678f25-8d0f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 11:28:37 +0100 (CET)
Received: from AS9PR06CA0777.eurprd06.prod.outlook.com (2603:10a6:20b:484::31)
 by PAWPR08MB8837.eurprd08.prod.outlook.com (2603:10a6:102:336::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 10:28:29 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:20b:484:cafe::7a) by AS9PR06CA0777.outlook.office365.com
 (2603:10a6:20b:484::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28 via Frontend
 Transport; Mon, 27 Nov 2023 10:28:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Mon, 27 Nov 2023 10:28:29 +0000
Received: ("Tessian outbound e243565b0037:v228");
 Mon, 27 Nov 2023 10:28:29 +0000
Received: from 0e5ff7cda270.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B7227366-587E-4624-BDC9-2BBEF6826A51.1; 
 Mon, 27 Nov 2023 10:28:18 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0e5ff7cda270.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 27 Nov 2023 10:28:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB8PR08MB5324.eurprd08.prod.outlook.com (2603:10a6:10:11e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Mon, 27 Nov
 2023 10:28:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 10:28:13 +0000
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
X-Inumbo-ID: b9678f25-8d0f-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MDSAmbO0IALIddBK2mER5ueBx+6Xr++6cBrpMpHv/mpa/vwoMENG4c4jtf0LMscdjSR6E6PWJLV9q+6sVRTr+LuzvyoMQHtBLY9ifcfAly1a0KX0uyC58nlzF1V1M4Bx56nv/8KED9xLjIgQBKbLB2i0BheSLCjznyNU/kXXKbwQ9swpHcp78Q5CPU4NqqHgvXjowlPdphdizwFwduFghiqoqIEzl1zW5vXnE7/dHCG+dC0RoIfE28lyZhxQrZuLW/N0vIBTLSpHI41aFt1v/t/MkP6By9n9AwRUoXiIwSaNYZj0Fm1/dOTh1ug8OApWts6wi5pTHnCVW7jILymW1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDDgmvC3H7XGbddnRDRljG9XE/z5a7o6VdO5cApr62k=;
 b=he9vTyAqxwGTVhbkSBX7qswNf9m4vH69TQRfi3o3VIi633ROhd2C5Sh6/UOoIu7CFQWd9m9tzrip9TFBPzA2vrb1c/yONPbTr9E5gSl6J1uxBOIPbKwcMTYfxXvc8STSKj8YwsFhA8drl4EcPF+GgeCpHugXNfrYbL3bgYV/LdLzlojR8JLMsk394uKRiXO/BLWQEgFPIVlVZz3M8muc5knEg93E08TqbXVIZBMPzv52ea8sFnYe5ULQHi5DkTnRT1Irw8egrQeKvpcN/qvReDq3hMQvjqkCu0tVQw8sCcPS106kYO4zzXDt+ONobVJB4CTSGQ8hz9o9JRnpIKCW0Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDDgmvC3H7XGbddnRDRljG9XE/z5a7o6VdO5cApr62k=;
 b=mKCWxCSEzQDQgBQdr6Uxp3dU5geC4S6Ar0K9DcoA5yXaxrloZknLEVaGtdr8ItU+l8ZsKw4JEbLUy8FpGZscvTp589o3seVD6lHscKZwGU+O2Eu45Y9TAAKrENIiP5CysLqm4Iflbwuv77rl9hFgqep6GVKJZIAW0CDn26nmUAc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c6312e545a37815
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cm2kxOj1QH/dKO8xAuS4514kCAHbtK22oYjq8m1PmS4lY6T/SDBIOd4ht7ApRVIINFebkaoS1/rzjphhZrbmEdKJPG4dt0aLGjjr3+nLCEuHWnIDc59F4zxnlU4Y79yjewipDsoK3gPqeCcS2p2zs+Y9ksygpBYHmRx0sVBgJsKgAoCKG5nGj9ccgAnzgltuYybNtZoTHera2juSIGsadaeoQaWXWn25Q66tj+iWGk7ArHWD3fBojetWv4oqWK0i9dgHvuPDu+ql9lwI3XGTNYJlOmmNqTTXg+OKfIO/R7VX4Nkqvb3SHvMY7hxCg6uzXhTgvBtSD8ey5wfaoCH93A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDDgmvC3H7XGbddnRDRljG9XE/z5a7o6VdO5cApr62k=;
 b=OXJKIHcyv8Q/GQCptuD0f02NIAd4AOXnx9sOlDPeclszAOvF87QEGaYAaJwTU+B2oxPkl9uI2igZtmWUFJm/BzrGVzPV2J3iv7nID77jyztpgCjpUf6kIoBipE8pX1y6NCZKUgtuv+G+S8yG7YvHQDK1t1oPxC/c5EmDGCQrdUhHYW+NZJkMd4+yTU+JJla5gL32pQ0EGueMaFPZdWlQGG67ZSDVtXtbjDONCDbtl4ZC6yTeOyKttQep5LBCFzZs3ZAN60c1TVN4qS4VQAagJWj40DGaPBW8DnDg7IpdRhxAE7Fi3iY8V3LewsrdtoBcQFGb36QG/xp8kfGc5cNO+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDDgmvC3H7XGbddnRDRljG9XE/z5a7o6VdO5cApr62k=;
 b=mKCWxCSEzQDQgBQdr6Uxp3dU5geC4S6Ar0K9DcoA5yXaxrloZknLEVaGtdr8ItU+l8ZsKw4JEbLUy8FpGZscvTp589o3seVD6lHscKZwGU+O2Eu45Y9TAAKrENIiP5CysLqm4Iflbwuv77rl9hFgqep6GVKJZIAW0CDn26nmUAc=
From: Henry Wang <Henry.Wang@arm.com>
To: Mario Marietto <marietto2008@gmail.com>
CC: Demi Marie Obenour <demi@invisiblethingslab.com>, Anthony PERARD
	<anthony.perard@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: We are not able to virtualize FreeBSD using xen 4.17 on Arm 32
 bit
Thread-Topic: We are not able to virtualize FreeBSD using xen 4.17 on Arm 32
 bit
Thread-Index: AQHaIRqC1LNxkfiXQEOwpgfnTEw2i7CN9pcA
Date: Mon, 27 Nov 2023 10:28:13 +0000
Message-ID: <C0A0E9FA-5AAB-4324-BBBD-D07412CD7F32@arm.com>
References:
 <CA+1FSiggg=XZmif6c3pY0+jz7i9caU-OTwFy80gwO7MVpXiwcA@mail.gmail.com>
 <CA+1FSigM1PZc4WfZNUJSMsZbNPPTyThRJ7MMQwQ9TWn6VnSUTg@mail.gmail.com>
In-Reply-To:
 <CA+1FSigM1PZc4WfZNUJSMsZbNPPTyThRJ7MMQwQ9TWn6VnSUTg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB8PR08MB5324:EE_|AMS0EPF00000190:EE_|PAWPR08MB8837:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d7fbbc4-c1a2-4a34-cb1b-08dbef33990b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WFH5EVkGk1EhTczUBfWOpy0Qqh7rhjo4lBPNw4rR702urF7WLjMssGlDSqLd3OOfxn83url8y2+yA6oxDRkXGULI965x1NlCs1Q4m0yYZtfDYA7qhvUswCxY3OKAyB8lBbcOk8o+Xo2OFJ7BBtLx4e4riNN8fPTluaLpkNb7QEBdTnqjStXDx9H8kwtLF+HiFJJMhH8SOQZPGRFfwsV6fmIETxMsOphOpsqMGdYSRtc+wYuD2NGeHxoobiC0bcTqq+VCVKQdch4ofZUHkqhFv+6emz0eCH9p2cYUVecMBzEOboOO7tdgWQm970AfgzlEdHJZndJGgyxVzwg2RoFOGTpwbYUYblCKsrV8ECx24uuWj5hyZx3ZkjhJUZtTj763ZGzDcRkXxscxzasMUKQpZ0ButI0j55wFgHmMTXsDUdZxzasxBzDyr7sxVJHxYNW4jkURoTgXPhM++9PUdTr4J7aVkIvRnEChSaTe2HMB2uOu4JLDeTRuU2NzPlM1pUWOjPsqbLsCRcjHktvH149Yl10PrVg8QuE7AUzXKsXaMmkGnfkQR4cROmdPtt5cHQhUs5mpa7rlcIHG23HsW555EcPtzcO5rUGsSL4r+GPti69RTgqXouCg/7qC8uOrLMfD
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(6512007)(53546011)(6506007)(2616005)(6486002)(478600001)(966005)(71200400001)(83380400001)(2906002)(5660300002)(41300700001)(91956017)(66946007)(76116006)(66556008)(54906003)(66476007)(6916009)(316002)(64756008)(4326008)(8936002)(8676002)(66446008)(38100700002)(38070700009)(86362001)(36756003)(122000001)(33656002)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4E402AC98D7E374295B0470B8E9308D0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5324
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5204ef92-7b81-4a11-158a-08dbef338f6c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vuIDi70f/2oGchz77WbQrLrKU1Xj8st1kuJ0FpGb78KH3u/HMZ8UxNhnYY1IQukw/Kdxe9co1wZRhdCsJNoU5LcUFDCTSkli7rqpyiGVMDijcqUBhLRy8UIF224SqCZGwvBNOzdfJX9NMT78eY3Ddmu5T6Avlw/o+OO8bC72gncIehkQFKKsnXdNQhxHNn0v4tEH9utsRX6OaC2GkaV/Z1us+Goswu0F2Nb9KgNbpYkRM/+63mRZd18abtdpEITBJX0wyI0rCupM7ej/DeoCP8f7mkCkHh81RdGp+6WRRR7U8ur+IGXRBQz7dKubSHPC7/om8FatkcaEZ6b50OXZEEsPsPSFmm9yz0Oxm4M3EN/3d0rVQYbH3VQtgzuCjM3Eyrf1oy0oa/N0oodQoTfhZu6qplYtrQhj6zg5rzi3N+4d1b49285wsgx09IfeNdd/QEXaHzQeXrdnUYgjtVX0EH6bCx28FtXgYpLy8NRT45LpIgXxEv4YX/3pioxXaUxLNqFre4iqLwPFDbWUuqYxtoYp/F6DEzmpWXjWC5Rvqj5woxC3zMwhzyY7OduurKhOm9bNDGK4qPYVj2zRLOZarkQLbuEcFfCzXErMBUjWQHtNQ0NuzABUuV4vOJXOzlW69IYHyU+rvbWR5TH7w3WQSUg0hjUVoO/qqzar5x6VqigA3jbTM4ue/6rXGls9jccG2zfYQYJPs5ZOlTML2cA7QAxhZkHnp0pevnKNG0ZjvQk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(451199024)(82310400011)(1800799012)(186009)(64100799003)(46966006)(40470700004)(36840700001)(83380400001)(81166007)(356005)(47076005)(336012)(82740400003)(6506007)(6512007)(8936002)(4326008)(70586007)(70206006)(966005)(316002)(36860700001)(54906003)(6486002)(53546011)(5660300002)(8676002)(6862004)(478600001)(86362001)(40480700001)(41300700001)(33656002)(2906002)(36756003)(26005)(2616005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 10:28:29.2332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7fbbc4-c1a2-4a34-cb1b-08dbef33990b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8837

+(xen-devel and Arm maintainers, including Julien)

> On Nov 27, 2023, at 18:03, Mario Marietto <marietto2008@gmail.com> wrote:
>=20
> Hello.
> We have just virtualized Debian 12 on our arm (32 bit) Chromebook model x=
e303c12 . As host / dom0 we have chosen Devuan 5,and for guest / domU,Debia=
n 12. It works great. But our goal is different. We want to virtualize Free=
BSD as domU. Can we have a working Xen PV network driver for a FreeBSD arm =
guest ?. I found that Julien Grall has ported the Xen drivers to FreeBSD on=
 arm. I would like to know if Julien's work was accepted upstream by FreeBS=
D, in which case FreeBSD as a Xen guest on arm should work if we enable the=
 Xen PV drivers in the FreeBSD on arm kernel. If Julien's work was not acce=
pted upstream by FreeBSD, we will have to find his patches and apply them o=
urselves to the FreeBSD on arm kernel.
> We found these slides :
>=20
> https://events.static.linuxfound.org/sites/events/files/slides/Porting%20=
FreeBSD%20on%20Xen%20on%20ARM%20.pdf
>=20
> Slide 13 refers to a XENHVM FreeBSD on arm kernel config - that is what w=
e want to find.
> It looks like when that slide presentation was written, there were some l=
imitations on FreeBSD Xen guests. For example, for our debian bookworm gues=
t, I am using vcpus =3D '2' to match the number of real cpus on our Chromeb=
ook, but slide 13 mentions support for only 1 VCPU with a FreeBSD guest, so=
 I will need to change that vcpus =3D '1' in the FreeBSD guest config unles=
s support for 2 or more vcpus was added later, which is possible because th=
at slide presentation is 9 years old.
> Here is where I would expect to find the XENHVM FreeBSD on arm kernel con=
fig file:
>=20
> https://cgit.freebsd.org/src/tree/sys/arm/conf
>=20
> But it is not there unless I am not understanding something correctly. Fo=
r now, unfortunately conclude that the support for Xen on arm that Julien G=
rall mentioned in that slide presentation 9 years ago was never added to th=
e official FreeBSD source code. I am searching the web now to see if the pa=
tches that Julien Grall wrote are still posted somewhere online. If we cann=
ot find them, we can ask here and on the xen-users mailing list. Julien reg=
ularly reads that list and responds to questions about Xen on arm, so I thi=
nk he will tell us how to find the patches if we cannot find them online.
> According to this page from the FreeBSD wiki:
>=20
> https://wiki.freebsd.org/Xen
>=20
> I think FreeBSD only supports Xen on x86, not arm. So this is going to be=
 a bit of a challenge to get a Xen FreeBSD guest on arm working. We know Ju=
lien Grall has some patches that made it work in the past !
> I found a slightly newer slide presentation by Julien here:
>=20
> https://www.slideshare.net/xen_com_mgr/bsdcan-2015-how-to-port-your-bsd
>=20
> It is about the same, but it mentions the GENERIC FreeBSD kernel supports=
 Xen on arm64, but still says we need the XENHVM FreeBSD config for Xen on =
arm 32 bit, which I haven't found online yet.
> Please,take a look at this output of the linux kernel that can boot on Xe=
n, and the FreeBSD kernel that cannot :
>=20
> % file zImage-6.1.59-stb-xen-cbe+
> zImage-6.1.59-stb-xen-cbe+: Linux kernel ARM boot executable zImage (litt=
le-endian)
>=20
> % file FREEBSD-XENVIRT=20
> FREEBSD-XENVIRT: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), =
dynamically linked, interpreter /red/herring, for FreeBSD 11.0 (1100048), n=
ot stripped
>=20
>=20
> The FreeBSD kernel that won't boot is in ELF format but the Linux kernel =
that does boot is in zImage format. This is the error we get :
> # xl create freebsd.cfg=20
> Parsing config from freebsd.cfg xc: error: panic: xg_dom_elfloader.c:63: =
xc_dom_guest_type: image not capable of booting inside a HV
> M container: Invalid kernel=20
> libxl: error: libxl_dom.c:571:libxl__build_dom: xc_dom_parse_image failed=
=20
> libxl: error: libxl_create.c:1640:domcreate_rebuild_done: Domain 4:cannot=
 (re-)build domain: -3=20
> libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain 4:Non-exis=
tant domain=20
> libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain 4:Unabl=
e to destroy guest=20
> libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain 4:Destruction=
 of domain failed
>=20
> We are spending time reading the docs on xenbits.xenproject.org, and acco=
rding to those docs Xen on arm only knows how to boot a kernel in the zImag=
e format, so the FreeBSD kernel is in a format that modern Xen incorrectly =
detects as an x86 kernel.
> I also watched Julien Grall's 30 minute video presentation of his work to=
 boot FreeBSD/arm on Xen at FOSDEM 2014 here :
>=20
> https://archive.fosdem.org/2014/schedule/event/freebsd_xen_arm/
>=20
> In that video, and in other places, Julien mentions that the boot ABI for=
 FreeBSD/arm on Xen was not yet developed and he was getting occasional cra=
shes and needed to investigate the problem. He mentioned the zImage ABI tha=
t Linux uses, but pointed out FreeBSD does not use that format, and back th=
en it was an open question which format to use to boot FreeBSD/arm on Xen. =
Unfortunately, nine years later, the only supported format is still the zIm=
age format that Linux uses.
> It looks like Julien's work back then was using an ELF binary to boot Fre=
eBSD/arm on Xen instead of the supported zImage format that Linux uses and =
the modern Xen toolstack exits with an error when trying to boot the FreeBS=
D ELF formatted binary that Julien's patch creates. So the best solution wo=
uld be to try to port the rules to build a FreeBSD kernel in the zImage for=
mat instead of the ELF format. I have been studying the Makefiles in Linux =
to see how Linux builds the Linux arm kernel in the zImage format, but it i=
s not trivial to understand.
> --=20
> Mario.


