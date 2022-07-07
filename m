Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E32B56A242
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 14:46:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362978.593293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9Qta-0002yJ-Fn; Thu, 07 Jul 2022 12:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362978.593293; Thu, 07 Jul 2022 12:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9Qta-0002ul-C2; Thu, 07 Jul 2022 12:46:14 +0000
Received: by outflank-mailman (input) for mailman id 362978;
 Thu, 07 Jul 2022 12:46:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3+b=XM=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1o9QtZ-0002ZM-3j
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 12:46:13 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2083.outbound.protection.outlook.com [40.107.104.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdd53a4f-fdf2-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 14:45:55 +0200 (CEST)
Received: from DB6PR07CA0067.eurprd07.prod.outlook.com (2603:10a6:6:2a::29) by
 HE1PR0801MB1708.eurprd08.prod.outlook.com (2603:10a6:3:83::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.15; Thu, 7 Jul 2022 12:46:06 +0000
Received: from DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::59) by DB6PR07CA0067.outlook.office365.com
 (2603:10a6:6:2a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.5 via Frontend
 Transport; Thu, 7 Jul 2022 12:46:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT005.mail.protection.outlook.com (100.127.142.81) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 12:46:05 +0000
Received: ("Tessian outbound f9f15f9daab2:v122");
 Thu, 07 Jul 2022 12:46:05 +0000
Received: from fcc92fca99e0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2F46E9C8-C299-43E9-BFCA-AD193BB6BE62.1; 
 Thu, 07 Jul 2022 12:45:54 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fcc92fca99e0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Jul 2022 12:45:54 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AM5PR0801MB1970.eurprd08.prod.outlook.com (2603:10a6:203:4a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Thu, 7 Jul
 2022 12:45:49 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7%9]) with mapi id 15.20.5395.022; Thu, 7 Jul 2022
 12:45:49 +0000
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
X-Inumbo-ID: bdd53a4f-fdf2-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nWNl/X3nBwqEMzlww1lZXiKenIgQLXCeyp/WwVx9TEQCIJj2LBMEDix5qx5AQolOD/4B7vkN1rJk+89ABwBSgH4Q0ujD9/7AABSA04JH5FrB2wbODkdRNBuxjsAc6vLj451L/16pZAeO6o5hrg1XXpiCUwUr9HGtNSy8sl50YFDiRCNf37/LySMDwlfFSXVRqnw7QlcYYJlKhuBZpnltqbnjG9veMMCfEgeLS/BBISTwv/HNNGE+NV62HTSqc/yWWz35sKm5nILSEPrrvXYsYhblRkmEnoPpskqBuhLJxq6u3QiKKFgs0eJawgOUBdWzW+gTWBPaq4eEgYsb8048Vg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uk03DcIlcU6IXh9gtiFDnM0oFDBzzoxV/R5zUzRo4RQ=;
 b=PHbkgyTzCrX9FNXyOKWWaNHVE1JcFwSRT7tYkmH+u6Kwodrw88Hf5sLD6SdFr0FsgqKFt3VHv3/ZnVqhXwJAgRr6NYb5dVLjtemNve5bMR/Un4NyafnfgVs1pW2lz18nZWygLkqD4ipy5UPsmINWeA/VsiPKZbqhs/xYpYijF6w0ubeBSvU+zdtNLNzugHRMDhOTuiQbUz5KfFBbLUpHwsT4VBthp0UVigPwaOLBN+DcYDQMYsAba/0ZH9900ekllmXzBRkYRgcOq51OJcjyVaYgHnkfleAWBlz4D1Sav0cccx/TOblGfAYZJVM+q/wiqGm3vmZjV5gSBUawZbt0YQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uk03DcIlcU6IXh9gtiFDnM0oFDBzzoxV/R5zUzRo4RQ=;
 b=iS4Evl/fOHKNgtpYLafs5BG6DTRbXUew0bLeeMTg0Mlu8OtCigiR7IZWCoURvcpldLYN2R7v+ypSRCsM2CDiwLhb0QkqtG80cS3Yilrtk6X0RfGzCpZOZgVOQG3Xf6zO23EOAi30R1hF7jNS1j25Ivz/MgtoaXyGwUJGfHsuGb0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a5ad2a3803f48d4c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiY2SMERUMZafZ0x/VquCTMsrGAQv/u3HQEMQ4Y9Wy9pflDPw+HWHxe0DGhu/szjwSMJvrgXdLA1Kh5t0juoe3rBzzncv2lDKPzdF6sj3NA9DQXjn2zTeXVGesHl6BxXSr8NUifTREFXGF0M4wRqnGbherP+0MnU2fbqw/9O42crDrOWQUgep5wEl0NKmGlwUZZSkS4dibDAlpP5mW2UIftfvlKvuVxfn5ztsxX57zf7JWnCZBd2psYVvnpccOSY8b+VZpJwkB66FSZmNyTcLUiQgNH/FtzOve8r1WwSje+QRLGhYd6Rp55TBKZyhkyQN5WPXUx9/DMCn4Os7PCKOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uk03DcIlcU6IXh9gtiFDnM0oFDBzzoxV/R5zUzRo4RQ=;
 b=SAXmts+K86VSqM2/jTzhWHmZE3OzbbWrLdUUx6QINsNEADgh0z1HXyPkEWAYFfzJty04UTs55HKxmVQdirv5+F/MykYQR7hcM16HNBz9V8Pa9rWmbxEDWMPYVrw/0/m3svshTdhLqhqtQLPJwLgsMrLkzC2ihXaO5rLWhy5ag2CLuh7kCYoej2O9sL7EhzRZYGx5MJxCpKQmqCfIe6aXRCPpzpa/siRlra1Wg55VLJWjAokeXKP0SkyC/R4tYC90hBHJovDROrU1bPc+LDUYyhYRH8Y2WCvXfSDigf9O08GnTJ8gzNCeURcVe5Hw5nr61FuTN2cipRmQ1h6TUhC5+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uk03DcIlcU6IXh9gtiFDnM0oFDBzzoxV/R5zUzRo4RQ=;
 b=iS4Evl/fOHKNgtpYLafs5BG6DTRbXUew0bLeeMTg0Mlu8OtCigiR7IZWCoURvcpldLYN2R7v+ypSRCsM2CDiwLhb0QkqtG80cS3Yilrtk6X0RfGzCpZOZgVOQG3Xf6zO23EOAi30R1hF7jNS1j25Ivz/MgtoaXyGwUJGfHsuGb0=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Juergen Gross <jgross@suse.com>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 5/8] xen/evtchn: don't close the static event channel.
Thread-Topic: [PATCH 5/8] xen/evtchn: don't close the static event channel.
Thread-Index:
 AQHYhkX79rj81mJ150e3nBZ0EA7O6K1bhmuAgAGTuoCAAAWegIAHwJEAgAAJPQCAAAcgAIAAB1iAgArhiICAAAgBAIABW/CAgAAGRACAAAgBgIABpqMA
Date: Thu, 7 Jul 2022 12:45:49 +0000
Message-ID: <32D03119-39B7-4C81-B33F-01C3CC47C04B@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <91656930b5bfd49e40ff5a9d060d7643e6311f4f.1655903088.git.rahul.singh@arm.com>
 <b64a7980-e51b-417b-4929-94a020c81438@xen.org>
 <7403EAA7-67A4-4A8D-835E-6015463B9016@arm.com>
 <a5cd291d-45b1-baf4-4d0b-907140b38eab@xen.org>
 <DC011AED-F74B-4055-8DEE-6FFC6FC5215C@arm.com>
 <dbdf3bb2-edc6-e622-f17a-8819f6fcb43d@xen.org>
 <67EA3F72-5F6D-4150-A9BA-EAF92E6C9EA1@arm.com>
 <289ebc8b-96f2-8764-5b17-680734e473fe@xen.org>
 <DCF75039-2719-4FC4-AA0A-2E5A00018823@arm.com>
 <77952dd3-e777-f4ca-75d0-c168c10d46d0@xen.org>
 <CC88A73E-FD16-4F41-9478-9979FE498725@arm.com>
 <a84b6911-3f15-587d-029b-66f1ed343e99@xen.org>
 <b8d33902-0080-fea9-515c-2721e8cfcc23@suse.com>
In-Reply-To: <b8d33902-0080-fea9-515c-2721e8cfcc23@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 85f5032e-5432-4ae3-cbca-08da6016a83e
x-ms-traffictypediagnostic:
	AM5PR0801MB1970:EE_|DBAEUR03FT005:EE_|HE1PR0801MB1708:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7x7M2ZbQo9ecjpzueFR6Sh7huoYJ39+NiYWZ4tnk7TEZstmwoxSydD6IoHgqnWi2nrXxlgVKSoeF+xAhG8s5hsY31HNaZ7vBc89qSCIpVuoACgycRo8wQSVdDE9aiIpYQXHb2J6hVyW7h4R8fDhvqcnRySc4RDAKxv0D5PwD2Qi+26JjSctGWa+lSVOaQI4ONQjHJZpNEccqNEr6LoLtMr+SUtOFZ7H2mL2kW5UsNWMe90MlbfZgeOmjfuPcvjevUAAaK3i7nHoTwrJgWyKvXkeLmuS2B8V86GlnU3b+YUikgQ9in+wDxvEnAOSovFD9Ds4VHKh4tndO76G/JkOdq5AA8gFt82ky8NuUSsBCS7rPZMkhYcNKNoesFLKnWXTgWBe/ZoL6hHvBwu203p6cvXGtBD5cRxnc2dkjm3144I9fW17X2MzMdYfrJOdYYVd56xQRdz8ygnXjLpnohSnjwHg3RtkGVm7rQGuMblsvgNDdRVReb9euk8d20RaUqGqLIE5/AuUSPOd/yOfMZwv3sd02aAItn+LkN4b5dVfbcC1NOMj19S7P35/Zt51wvnigwi8JKgExP8BfKhQlhu60PvgAVi8iv8csF0E9NlQPDtkrG55YQ9eok7WNx/hbj+MJZvMEsApStHOvqws18eVG/uGhvC2Tt4/KIw5SpsSbLyjpjx1+A27A0IutdUbMSin2AyDQwnDipkbXCdTYi2olwHML7pjxXcOpaIq+dAW+RFOnn6LYoVeD+veBXsjL9k63IV6KnH/V8/TAWgDI0K0wuyyeaUeUKPLJpN7RSbLoTNhI09mzaqFOmbR1LJ03NCwbfTg/7uKL4f529/tlg6vsni6/tBgted+lIqpmlwytkY4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(36756003)(122000001)(38100700002)(5660300002)(186003)(8936002)(38070700005)(8676002)(91956017)(76116006)(4326008)(66946007)(66556008)(64756008)(66446008)(66476007)(2906002)(86362001)(6512007)(316002)(53546011)(33656002)(6916009)(26005)(54906003)(6506007)(41300700001)(2616005)(83380400001)(71200400001)(478600001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AFB477D655F634A9C6D10050638EFB3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1970
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	14b81e02-81c2-4dfd-d4fe-08da60169eb5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RENSSxekhQ4edrMbrAEb7gV8PD+UbmDMdkjTJXEVwrNRiheAMyQG995b1tqmxdqjBBzknwbVXpws49bCbPjAH4DIvospjFrCZay75q2rbV3pw6faT1fyZUJyevFUtvbKHeaLGTuhKo/SWgnxRimVEVaiDrSObnWtit6o58u38bsTsI+iCiqqPReQXFTKLmM7HtgkZ85ql8NcXm5UPu7+Kf4dGoY4J3bYN32wKrXV0A4/313EKBXgwJ0+7kctr4pwI3zAu8MNbhA1K0D6tDE/BNeYITJmrryaHFqYxk/MdchlQHcV6czEgFQ1ai9f9hiCWD5OVt6ahE+BmKNwRC1D6oUk6nQ7nWvT36Ji9o+Jar1Q90NqT2eA68oNV1vm9nHTTxK6e70WQr+2mnzU9zYpKf4mfCwzeqsnlq5dhwKxITxfBpXLJzQRGBxWoz0ivtNSr/D6CMwHlRYev0vQJ0EVjKqk47afcDM16uoHltcqMFzVoDjdMKrXjwR/US8/PV6698Z+R2FdcKYtlfY/5FTWrxY+FESOnTyuNoUdSDNN1x2d+c0BbqX2WCJ0Bmi8FYrZPrV+4VOOFmbcXQZ4+vmSrqHITZHOCnlxyAxIxNzo08bZPDF9JSFX1aOLl0mDarqODdYv8snQrlZgB1zMWlcomOijiZQWGIIaMwMDU29eznJ3hehOlL7pbPHMUaqFGGIDgnBLHb2INVDvpuYb/L5Lqy75aEVySVNww6QZqYcT2SMsh/TGk62EAttgf0YKkMmwMZ23PAbW1mxClvXaNo0OvhdwQ4STSR1qgMky6PikNL0nfauWTKMxN3ntuzPYsy8N
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(39860400002)(136003)(36840700001)(40470700004)(46966006)(6486002)(6862004)(8936002)(40460700003)(186003)(478600001)(40480700001)(86362001)(5660300002)(336012)(2616005)(6506007)(26005)(2906002)(6512007)(47076005)(70206006)(53546011)(41300700001)(33656002)(82740400003)(356005)(83380400001)(82310400005)(81166007)(36860700001)(36756003)(8676002)(54906003)(4326008)(70586007)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 12:46:05.4424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f5032e-5432-4ae3-cbca-08da6016a83e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1708

SGkgSnVlcmdlbiwNCg0KPiBPbiA2IEp1bCAyMDIyLCBhdCAxMjozMyBwbSwgSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDA2LjA3LjIyIDEzOjA0LCBKdWxp
ZW4gR3JhbGwgd3JvdGU6DQo+PiAoKyBKdWVyZ2VuIGZvciB0aGUgTGludXggcXVlc3Rpb24pDQo+
PiBPbiAwNi8wNy8yMDIyIDExOjQyLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+PiBIaSBKdWxpZW4s
DQo+Pj4gDQo+Pj4+IE9uIDUgSnVsIDIwMjIsIGF0IDI6NTYgcG0sIEp1bGllbiBHcmFsbCA8anVs
aWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+PiANCj4+Pj4gDQo+Pj4+IA0KPj4+PiBPbiAwNS8wNy8y
MDIyIDE0OjI4LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+IEhpIEp1bGllbiwNCj4+Pj4gDQo+
Pj4+IEhpIFJhaHVsLA0KPj4+PiANCj4+Pj4+PiBPbiAyOCBKdW4gMjAyMiwgYXQgNDoxOCBwbSwg
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4+Pj4+IGEgbmV3IGRyaXZl
ciBpbiBsaW51eCBrZXJuZWwsIGV0YyB3aGVyZSByaWdodCBub3cgd2UganVzdCBuZWVkIHRvIGlu
dHJvZHVjZSBhbiBleHRyYSBJT0NUTCBpbiBsaW51eCB0byBzdXBwb3J0IHRoaXMgZmVhdHVyZS4N
Cj4+Pj4+PiANCj4+Pj4+PiBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHdvdWxkIG5lZWQgYSBuZXcg
ZHJpdmVyLCBldGMuIEdpdmVuIHRoYXQgeW91IGFyZSBpbnRyb2R1Y2luZyBhIG5ldyBJT0NUTCB5
b3UgY291bGQgcGFzcyBhIGZsYWcgdG8gc2F5ICJUaGlzIGlzIGEgc3RhdGljIGV2ZW50IGNoYW5u
ZWwgc28gZG9uJ3QgY2xvc2UgaXQiLg0KPj4+Pj4gSSB0cmllZCB0byBpbXBsZW1lbnQgb3RoZXIg
c29sdXRpb25zIHRvIHRoaXMgaXNzdWUuIFdlIGNhbiBpbnRyb2R1Y2UgYSBuZXcgZXZlbnQgY2hh
bm5lbCBzdGF0ZSDigJxFQ1NfU1RBVElD4oCdIGFuZCBzZXQgdGhlDQo+Pj4+PiBldmVudCBjaGFu
bmVsIHN0YXRlIHRvIEVDU19TVEFUSUMgd2hlbiBYZW4gYWxsb2NhdGUgYW5kIGNyZWF0ZSB0aGUg
c3RhdGljIGV2ZW50IGNoYW5uZWxzLg0KPj4+PiANCj4+Pj4gRnJvbSB3aGF0IHlvdSB3cm90ZSwg
RUNTX1NUQVRJQyBpcyBqdXN0IGFuIGludGVyZG9tYWluIGJlaGluZCBidXQgd2hlcmUgeW91IHdh
bnQgWGVuIHRvIHByZXZlbnQgY2xvc2luZyB0aGUgcG9ydC4NCj4+Pj4gDQo+Pj4+IEZyb20gWGVu
IFBvViwgaXQgaXMgc3RpbGwgbm90IGNsZWFyIHdoeSB0aGlzIGlzIGEgcHJvYmxlbSB0byBsZXQg
TGludXggY2xvc2luZyBzdWNoIHBvcnQuIEZyb20gdGhlIGd1ZXN0IFBvViwgdGhlcmUgYXJlIG90
aGVyIHdheSB0byBwYXNzIHRoaXMgaW5mb3JtYXRpb24gKHNlZSBiZWxvdykuDQo+Pj4gDQo+Pj4g
SWYgTGludXggY2xvc2VzIHRoZSBwb3J0LCB0aGUgc3RhdGljIGV2ZW50IGNoYW5uZWwgY3JlYXRl
ZCBieSBYZW4gYXNzb2NpYXRlZCB3aXRoIHN1Y2ggcG9ydCB3aWxsIG5vdCBiZSBhdmFpbGFibGUg
dG8gdXNlIGFmdGVyd2FyZC4NCj4+PiANCj4+PiBXaGVuIEkgc3RhcnRlZCBpbXBsZW1lbnRlZCB0
aGUgc3RhdGljIGV2ZW50IGNoYW5uZWwgc2VyaWVzLCBJIHRob3VnaHQgdGhlIHN0YXRpYyBldmVu
dCBjaGFubmVsIGhhcyB0byBiZSBhdmFpbGFibGUgZm9yIHVzZSBkdXJpbmcNCj4+PiB0aGUgbGlm
ZXRpbWUgb2YgdGhlIGd1ZXN0LiBUaGlzIHBhdGNoIGF2b2lkcyBjbG9zaW5nIHRoZSBwb3J0IGlm
IHRoZSBMaW51eCB1c2VyLXNwYWNlIGFwcGxpY2F0aW9uIHdhbnRzIHRvIHVzZSB0aGUgZXZlbnQg
Y2hhbm5lbCBhZ2Fpbi4NCj4+PiANCj4+PiBUaGlzIHBhdGNoIGlzIGZpeGluZyB0aGUgcHJvYmxl
bSBmb3IgTGludXggT1MsIGFuZCBJIGFncmVlIHdpdGggeW91IHRoYXQgd2Ugc2hvdWxkIG5vdCBt
b2RpZnkgdGhlIFhlbiB0byBmaXggdGhlIExpbnV4IHByb2JsZW0uDQo+Pj4gVGhlcmVmb3JlLCBJ
ZiB0aGUgZ3Vlc3QgZGVjaWRlZCB0byBjbG9zZSB0aGUgc3RhdGljIGV2ZW50IGNoYW5uZWwsIFhl
biB3aWxsIGNsb3NlIHRoZSBwb3J0LiBFdmVudCBDaGFuZWwgYXNzb2NpYXRlZCB3aXRoIHRoZSBw
b3J0DQo+Pj4gd2lsbCBub3QgYmUgYXZhaWxhYmxlIGZvciB1c2UgYWZ0ZXIgdGhhdC5JIHdpbGwg
ZGlzY2FyZCB0aGlzIHBhdGNoIGluIHRoZSBuZXh0IHNlcmllcy4NCj4+PiANCj4+Pj4gDQo+Pj4+
PiBGcm9tIGd1ZXN0IE9TIHdlIGNhbiBjaGVjayBpZiB0aGUgZXZlbnQgY2hhbm5lbCBpcyBzdGF0
aWMgKHZpYSBFVlRDSE5PUF9zdGF0dXMoKSAgaHlwZXJjYWxsICksIGlmIHRoZSBldmVudCBjaGFu
bmVsIGlzDQo+Pj4+PiBzdGF0aWMgZG9u4oCZdCB0cnkgdG8gY2xvc2UgdGhlIGV2ZW50IGNoYW5u
ZWwuIElmIGd1ZXN0IE9TIHRyeSB0byBjbG9zZSB0aGUgc3RhdGljIGV2ZW50IGNoYW5uZWwgWGVu
IHdpbGwgcmV0dXJuIGVycm9yIGFzIHN0YXRpYyBldmVudCBjaGFubmVsIGNhbuKAmXQgYmUgY2xv
c2VkLg0KPj4+PiBXaHkgZG8geW91IG5lZWQgdGhpcz8gWW91IGFscmVhZHkgbmVlZCBhIGJpbmRp
bmcgaW5kaWNhdGluZyB3aGljaCBwb3J0cyB3aWxsIGJlIHByZS1hbGxvY2F0ZWQuIFNvIHlvdSBj
b3VsZCB1cGRhdGUgeW91ciBiaW5kaW5nIHRvIHBhc3MgYSBmbGFnIHRlbGxpbmcgTGludXggImRv
bid0IGNsb3NlIGl0Ii4NCj4+Pj4gDQo+Pj4+IEkgaGF2ZSBhbHJlYWR5IHByb3Bvc2VkIHRoYXQg
YmVmb3JlIGFuZCBJIGhhdmVuJ3Qgc2VlbiBhbnkgZXhwbGFuYXRpb24gd2h5IHRoaXMgaXMgbm90
IGEgdmlhYmxlIHNvbHV0aW9uLg0KPj4+IA0KPj4+IFNvcnJ5IEkgZGlkbuKAmXQgbWVudGlvbiB0
aGlzIGVhcmxpZXIsIEkgc3RhcnRlZCB3aXRoIHlvdXIgc3VnZ2VzdGlvbiB0byBmaXggdGhlIGlz
c3VlIGJ1dCBhZnRlciBnb2luZyB0aHJvdWdoIHRoZSBMaW51eCBldnRjaG4gZHJpdmVyIGNvZGUN
Cj4+PiBpdCBpcyBub3Qgc3RyYWlnaHQgZm9yd2FyZCB0byB0ZWxsIExpbnV4IGRvbuKAmXQgY2xv
c2UgdGhlIHBvcnQuIExldCBtZSB0cnkgdG8gZXhwbGFpbi4NCj4+PiANCj4+PiBJbiBMaW51eCwg
c3RydWN0IHVzZXJfZXZ0Y2huIHt9IGlzIHRoZSBzdHJ1Y3QgdGhhdCBob2xkIHRoZSBpbmZvcm1h
dGlvbiBmb3IgZWFjaCB1c2VyIGV2dGNobiBvcGVuZWQuIFdlIGNhbiBhZGQgb25lIGJvb2wgcGFy
YW1ldGVyIGluIHRoaXMgc3RydWN0IHRvIHRlbGwgTGludXggZHJpdmVyDQo+Pj4gdmlhIElPQ1RM
IGlmIGV2dGNobiBpcyBzdGF0aWMuIFdoZW4gdXNlciBhcHBsaWNhdGlvbiBjbG9zZSB0aGUgZmQg
Ii9kZXYveGVuL2V2dGNobuKAnSAsIGV2dGNobl9yZWxlYXNlKCkgd2lsbCB0cmF2ZXJzZSBhbGwg
dGhlIGV2dGNobiBhbmQgY2FsbCBldnRjaG5fdW5iaW5kX2Zyb21fdXNlcigpDQo+Pj4gZm9yIGVh
Y2ggZXZ0Y2huLiBldnRjaG5fdW5iaW5kX2Zyb21fdXNlcigpIHdpbGwgY2FsbCAgX191bmJpbmRf
ZnJvbV9pcnEoaXJxKSB0aGF0IHdpbGwgY2FsbCB4ZW5fZXZ0Y2huX2Nsb3NlKCkgLiBXZSBuZWVk
IHJlZmVyZW5jZXMgdG8gInN0cnVjdCB1c2VyX2V2dGNobuKAnSBpbg0KPj4+IGZ1bmN0aW9uIF9f
dW5iaW5kX2Zyb21faXJxKCkgdG8gcGFzcyBhcyBhcmd1bWVudCB0byB4ZW5fZXZ0Y2huX2Nsb3Nl
KCkgbm90IHRvIGNsb3NlIHRoZSBzdGF0aWMgZXZlbnQgY2hhbm5lbC4gIEkgYW0gbm90IGFibGUg
dG8gZmluZCBhbnkgd2F5IHRvIGdldA0KPj4+IHN0cnVjdCB1c2VyX2V2dGNobiBpbiBmdW5jdGlv
biBfX3VuYmluZF9mcm9tX2lycSgpICwgd2l0aG91dCBtb2RpZnlpbmcgdGhlIG90aGVyIExpbnV4
IHN0cnVjdHVyZS4NCj4gDQo+IFRoZSAic3RhdGljIiBmbGFnIHNob3VsZCBiZSBhZGRlZCB0byBz
dHJ1Y3QgaXJxX2luZm8uIEluIGNhc2UgYWxsIHJlbGV2YW50DQo+IGV2ZW50IGNoYW5uZWxzIGFy
ZSByZWFsbHkgdXNlciBvbmVzLCB3ZSBjb3VsZCBlYXNpbHkgYWRkIGFub3RoZXIgInN0YXRpYyIN
Cj4gZmxhZyB0byBldnRjaG5fbWFrZV9yZWZjb3VudGVkKCksIHdoaWNoIGlzIGFscmVhZHkgdXNl
ZCB0byBzZXQgYSB1c2VyDQo+IGV2ZW50IGNoYW5uZWwgc3BlY2lmaWMgdmFsdWUgaW50byBzdHJ1
Y3QgaXJxX2luZm8gd2hlbiBiaW5kaW5nIHRoZSBldmVudA0KPiBjaGFubmVsLg0KPiANCg0KQXMg
c3VnZ2VzdGVkIGJ5IHlvdSwgSSBtb2RpZmllZCB0aGUgTGludXggS2VybmVsIGJ5IGFkZGluZyDi
gJxzdGF0aWMiIGZsYWcgaW4gc3RydWN0IGlycV9pbmZvIGFuZA0KaXQgd29ya3MgZmluZS4gV2Ug
Y2FuIHNraXAgdGhlIGNsb3Npbmcgb2Ygc3RhdGljIGNoYW5uZWwgaWYgcmVxdWlyZWQuIA0KDQpJ
IHdpbGwgc2VuZCB0aGUgcGF0Y2ggZm9yIHJldmlldyBvbmNlIEkgd2lsbCBzZW5kIHRoZSBwYXRj
aCBmb3IgbmV3IGlvY3RsIGZvciBzdGF0aWMgZXZlbnQgY2hhbm5lbC4NCg0KUmVnYXJkcywNClJh
aHVsDQoNCg0K

