Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DBC561317
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 09:17:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358257.587372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6oQ4-0005xr-Ml; Thu, 30 Jun 2022 07:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358257.587372; Thu, 30 Jun 2022 07:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6oQ4-0005ub-Ix; Thu, 30 Jun 2022 07:16:56 +0000
Received: by outflank-mailman (input) for mailman id 358257;
 Thu, 30 Jun 2022 07:16:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUi7=XF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o6oQ2-0005uL-JI
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 07:16:54 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130082.outbound.protection.outlook.com [40.107.13.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d777525-f844-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 09:16:52 +0200 (CEST)
Received: from AS9PR05CA0011.eurprd05.prod.outlook.com (2603:10a6:20b:488::19)
 by AM0PR08MB5233.eurprd08.prod.outlook.com (2603:10a6:208:164::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 30 Jun
 2022 07:16:50 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:488:cafe::ee) by AS9PR05CA0011.outlook.office365.com
 (2603:10a6:20b:488::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Thu, 30 Jun 2022 07:16:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Thu, 30 Jun 2022 07:16:49 +0000
Received: ("Tessian outbound 879f4da7a6e9:v121");
 Thu, 30 Jun 2022 07:16:48 +0000
Received: from 604353bbef16.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 15593C6D-2B07-4200-96A7-059B1A54A9C0.1; 
 Thu, 30 Jun 2022 07:16:42 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 604353bbef16.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 30 Jun 2022 07:16:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS4PR08MB8000.eurprd08.prod.outlook.com (2603:10a6:20b:583::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Thu, 30 Jun
 2022 07:16:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5373.017; Thu, 30 Jun 2022
 07:16:40 +0000
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
X-Inumbo-ID: 9d777525-f844-11ec-bdce-3d151da133c5
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RXp8sCqtZxGs8+wadxtNiD9ZS7zxsndBX/lSTkI2oH8CiigKruoVlrZ1wUud4UiwSU+kw0ziCu9DU5PyUoQ5LVyN33v6hjxZ3OJ+rWNZfnMiDThNlxWHJUkSsswmDff3lczKtNE7Y/5Eb8kd1oqLFFqth7zAxIRRp1mO8UiTmXQn2HmQ4aqGLEA1Ts60zuMD7WPcLFCHLXOfyKu5c+7Qjh9EIuD+mimCGgq+8dbZu66q4Sjeq8G71LuH234Op/wLriLlgp6dAFsY5Loe7LkRB/C/FLKyZpgDEktnhlvHraSkPaOjZMtFWw5Gb0v39tyyGT0O09HDbJ91/1czv+/64w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Fd6wSu+qKNtqeVHQ1WoRks56L1+aBjZnNjDttmTySE=;
 b=maJCFoH5wHyQPJL0kr2Y21tyzgIxtuKH15Rx5AjdCRhBsWKRJFAMFHvFZ22dCS/J5fGxwwy2LxgIC0Oi0/vijrrDIw717bKJqza0KGagSsol7C4kohyWbH3Z30PHAe5/TT8XPKrRn2ekxuoFIH8tRP9vzZuDPmx47haaLajNqKp4ngG5x+iN8qQULajjRz/MpDRkXBmmgZrlCkJonDrTVCCg3zf9wh9mG+e49Q0E2UkMqmtJVMoTcfn9L91w0HuKedxjIEzFvc5xSufNE7xzBjNRf1hh8ZE0XfygdHxLNAl/RpEV0f+ExI9x05ehD6Jpy22JM72dU0EMiO9zMoaMCw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Fd6wSu+qKNtqeVHQ1WoRks56L1+aBjZnNjDttmTySE=;
 b=5hp5Ru5qObwo1k02L8MncXJHq7yIAjjue+6KlDW8rugEUmrehxLalF3P+92Hawc+L4q2T9Fy0/ozM9/7dI9K9Hbru0xnnMgcpzrEMSpJ9d4GQYDAUVc2esXYpmIZrLTETQOP2GSxSs9IpIE/3oGM5wK8afdy/EMmTwtDXcViCuk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8a149a9a940af274
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDWnN9wlTMiLOX5MIldeFxT0OXFMtwIS/AT31nx+IIb6cgdaQ3uWNZR6jyPAyZpN9uiJMeR4NTHGC8P6t+wVjOiCHNi8t1j0WgBCkEtwVYgSedvg4BBop5dCzi6+pvG22slkt7N0kbIPRwgy0eNqjJSP8wO3uBKrqWMuS6eAuh1Om4DimeMlr5bUuzZTXsOkyframNP6RAnLDrTa8+cDB8Azhc0Avrr7ULpv5RnbFtGnYE7O6vD7avXb/zS/ydfQuuXP2zL2zKzwLcN98P3SE4PAF+y8PJSmcUrE1RZc/G9gMz0nAYfBKgKD+HOSf9yVkY/OysLAcz/KgaFr4BI1Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Fd6wSu+qKNtqeVHQ1WoRks56L1+aBjZnNjDttmTySE=;
 b=j8OzeNtse7fTrC2nARrGQf1M5gVnYZ2AWaPOe0+QDSY99NIxpNoCqgK7BxeC4721vFmEsjXGVPfNYT8bIRtQ381uaC1G8tvcdZvguLgGkVHEWde9FXLhe1CUykX1a6/ud4o5WvtpC+RhnO+3zwfFV21akokTVgfOv3FeK5Cmpk/67G5pIpfN0nHTwVDskNgXpmG/YAwJLioh0JOjgfOKLzCWqiiPBokIgwbsnSb4+3SPgcS7aaR58EEBimoxsBGKRFDA4TQNA4MVKQheIP4RkhvpXKNlP80ZaUrn6lmBMAnMEtKZPyR5IDWnQySLXShlXycR5vKLeCqcEQaFrEM4cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Fd6wSu+qKNtqeVHQ1WoRks56L1+aBjZnNjDttmTySE=;
 b=5hp5Ru5qObwo1k02L8MncXJHq7yIAjjue+6KlDW8rugEUmrehxLalF3P+92Hawc+L4q2T9Fy0/ozM9/7dI9K9Hbru0xnnMgcpzrEMSpJ9d4GQYDAUVc2esXYpmIZrLTETQOP2GSxSs9IpIE/3oGM5wK8afdy/EMmTwtDXcViCuk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, "dmitry.semenets@gmail.com"
	<dmitry.semenets@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Dmytro Semenets <dmytro_semenets@epam.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen: arm: Don't use stop_cpu() in halt_this_cpu()
Thread-Topic: [PATCH] xen: arm: Don't use stop_cpu() in halt_this_cpu()
Thread-Index:
 AQHYhtUZsflIoxNljUat3Yz6tc+m161djY6AgAC0bgCAANP9AIABIMQAgAVAMgCAAJ5ngIAAlakAgADqBgA=
Date: Thu, 30 Jun 2022 07:16:40 +0000
Message-ID: <14736B47-2F17-4684-9162-17C3E55F8D15@arm.com>
References: <20220623074428.226719-1-dmitry.semenets@gmail.com>
 <alpine.DEB.2.22.394.2206231457250.2410338@ubuntu-linux-20-04-desktop>
 <e60a4e68-ed00-6cc7-31ca-64bcfc4bbdc5@xen.org>
 <alpine.DEB.2.22.394.2206241414420.2410338@ubuntu-linux-20-04-desktop>
 <5c986703-c932-3c7d-3756-2b885bb96e42@xen.org>
 <alpine.DEB.2.22.394.2206281538320.4389@ubuntu-linux-20-04-desktop>
 <26a1b208-7192-a64f-ca6d-c144de89ed2c@xen.org>
 <alpine.DEB.2.22.394.2206291014000.4389@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2206291014000.4389@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f6c38b62-a43a-4a82-d9c7-08da5a687ff3
x-ms-traffictypediagnostic:
	AS4PR08MB8000:EE_|AM5EUR03FT062:EE_|AM0PR08MB5233:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3XbuFuAmE41naKfbmqYlsEPk36N6J/aKmLP3pzDdkr5LSV0dEbG7UVvxe/N0ER/n3RC6nW/6E5sdLE9f7kaemfRiumcrK/ZM57xcv4dH9t7Mvg7qytUgnMtZNVS8wyFN3BGkv4rrA0dpJBNdBCxelJ5ErICsaK7q6rGmKZOmMfvaDnMruMp8zby7xG4M92ESU6jc4/DvysimP9mxSZZ2diURAq1rek2+6V9EpYvuMw+EcjyKZDd97KveUPeC0pRUQO6zaF2nkIDZExvFsxUjF296But7RjzHPqqd070X6C273O/mybmAZw/AGCIwTa+32ry4xWq4RzZqYwvlg+ieV17elgMoRFo8CT9eYVyi/W8vWmYIpGdrSG4LHyq7i0q+b2X8pVsjfJBRihQ8CYuDn716pgx+P74ryoc8ropklPPu6CWJ+8O5CoVg7lAK59mXC3MQJWQQPI7sxBc69erog/Q5xL7CFI8LgFwRUr5Z6FQOO5al75LQ9lHPN2YcFKXnlshHM/RU4yUsQ+kf942kZcKg87/Azy1MDgJHLtxx6BiDxnygJ0X5lIirT7rO7N3/nZ1a/L26qD2D9PEVhPbYbSvdxKLd90LHPPc753eOwNlIdTmotk59i22pHVv9Pl3JDeHNpUYlC9nYipm4dnlfhVLs3MSa6dEI+zzzez+Mwl9Y6P6X5eVi2vNc6mVfSuRGN3QzudhfPlAwfxNx9SGRWchAUvHblOdJ5M/WsliVVLp1H1f9dYvjdFMQqWQCuQWYLnrGR8zARA/7+gdot0X43ahbLqmsDjQMRThtPos2PjT4t1sYlshkoAHjJluEaZAOB4LhVrJcru9jGwY1ew7EhpipBZ+pwEwY/xHP44sVZKE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(86362001)(33656002)(66946007)(66556008)(71200400001)(41300700001)(2616005)(38070700005)(53546011)(91956017)(6506007)(4326008)(26005)(64756008)(8936002)(66476007)(8676002)(5660300002)(83380400001)(76116006)(66446008)(2906002)(54906003)(6486002)(6916009)(6512007)(38100700002)(478600001)(122000001)(186003)(36756003)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6D41FFE32C169944A18E6BC5E9D26D23@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8000
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6a8832b7-3088-41c2-14fc-08da5a687a5f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8nU57gXQNXY83eViPnotvVgfZvzjhd4HLGiCi+ZS5xpkEHyfsb96MNj0//ZNYVXMgUozliSL+QVaGDntJ7WjdSmbxZCUtbFx/57aSoXQsmtWzhN5899u1BdDPGziwlaWhuVq1R3kDqMG50uUPrEua7HXgdcgSacCH28Rw6Q4iEYB1XRstQWWRRYCHKEBX/ZgllPDJrnUSmK2uXUWAys6TpQTzR4b/t69HE7YkUS4dCK/enridzUq5VF+cbF6/bNllq9BkpjpyYOG9lMpfOzH/UWnPcMYiawg5qZpgKGBcOpysz9HpX490dzzM8S/0rZRDAJZJMrXyF9rXUYxjS3k8JsZSxKkguwCfo8skAU9KilZUxg9h3fkuj3LsS6MXsYlT4HHj965dvVGwL5YnwOgyisoy71WKzFw96mPB6o+K+nMpVdV8hGAXPZFI6y+2BlZU7Q8DSQH9syAfQUqSC05l0PzzRJkn2zD097A8JO19K595UH8oib6bzl5DfvQvWeS6HMDk2m29lmjq4G/x15SDVNh7WlEX+XK7Z8FXRruvMz1XsBiGdq3CyuCggMAVtZmIu8loeN6vbdHRsyuj34x38Ikla83WBxaLgtbI54JISAURbom+o+gzaR4iVBL1yzjegv4KrWYmv1JdCOQGYwaJtWyv7YwwKKWb6X4rp3VI/vVSoI1x58mme0cTU6pbuV/mm/rTzHZS7YaGUzSmzdrUvjMrfuGS1qqiSn1lqTq/HEd9KV7vPrgj6+wWrX5JGvyvN2mgT3dgMFcAQlCANpszlQ4Q2FU4Pxrh7N855GhNf2vDxd/LR5lcKbd3+1Y9qTy
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(39860400002)(136003)(376002)(40470700004)(36840700001)(46966006)(81166007)(8936002)(186003)(70206006)(2906002)(5660300002)(336012)(40480700001)(478600001)(83380400001)(26005)(33656002)(41300700001)(54906003)(107886003)(6486002)(36860700001)(82740400003)(36756003)(2616005)(6512007)(356005)(4326008)(8676002)(86362001)(53546011)(316002)(6506007)(47076005)(82310400005)(6862004)(40460700003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 07:16:49.5507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c38b62-a43a-4a82-d9c7-08da5a687ff3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5233

Hi,

> On 29 Jun 2022, at 18:19, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Wed, 29 Jun 2022, Julien Grall wrote:
>> On 28/06/2022 23:56, Stefano Stabellini wrote:
>>>> The advantage of the panic() is it will remind us that some needs to b=
e
>>>> fixed.
>>>> With a warning (or WARN()) people will tend to ignore it.
>>>=20
>>> I know that this specific code path (cpu off) is probably not super
>>> relevant for what I am about to say, but as we move closer to safety
>>> certifiability we need to get away from using "panic" and BUG_ON as a
>>> reminder that more work is needed to have a fully correct implementatio=
n
>>> of something.
>>=20
>> I don't think we have many places at runtime using BUG_ON()/panic(). The=
y are
>> often used because we think Xen would not be able to recover if the cond=
ition
>> is hit.
>>=20
>> I am happy to remove them, but this should not be at the expense to intr=
oduce
>> other potential weird bugs.
>>=20
>>>=20
>>> I also see your point and agree that ASSERT is not acceptable for
>>> external input but from my point of view panic is the same (slightly
>>> worse because it doesn't go away in production builds).
>>=20
>> I think it depends on your target. Would you be happy if Xen continue to=
 run
>> with potentially a fatal flaw?
>=20
> Actually, this is an excellent question. I don't know what is the
> expected behavior from a safety perspective in case of serious errors.
> How the error should be reported and whether continuing or not is
> recommended. I'll try to find out more information.

I think there are 2 answers to this:
- as much as possible: those case must be avoided and it must be demonstrat=
ed that they are impossible and hence removed or turn the system in a fails=
afe mode so that actions can be handle (usually reboot after saving some da=
ta)
- in some cases this can be robustness code (more for security)

I think in our case that if we know that we are ending in a case where the =
system is unstable we should:
- stop the guest responsible for this (if a guest is the origin) or return =
an error to the guest and cancel the operation if suitable
- panic if this is internal or dom0

A warning informing that something not supported was done and ending in an =
unexpected behaviour is for sure not acceptable.

Cheers
Bertrand


