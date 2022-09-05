Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBD25AD35B
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 15:00:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398836.639809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVBi0-0005UX-16; Mon, 05 Sep 2022 13:00:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398836.639809; Mon, 05 Sep 2022 13:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVBhz-0005Sj-U3; Mon, 05 Sep 2022 13:00:11 +0000
Received: by outflank-mailman (input) for mailman id 398836;
 Mon, 05 Sep 2022 13:00:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PPTu=ZI=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVBhy-0005Sd-8Y
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 13:00:10 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20082.outbound.protection.outlook.com [40.107.2.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab4a3b16-2d1a-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 15:00:08 +0200 (CEST)
Received: from AM5PR0602CA0020.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::30) by PA4PR08MB7458.eurprd08.prod.outlook.com
 (2603:10a6:102:2a5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 13:00:06 +0000
Received: from AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::4b) by AM5PR0602CA0020.outlook.office365.com
 (2603:10a6:203:a3::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Mon, 5 Sep 2022 13:00:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT049.mail.protection.outlook.com (100.127.140.234) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 13:00:06 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Mon, 05 Sep 2022 13:00:05 +0000
Received: from 553bdbf2f81b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7FEB29B6-329A-4E06-991F-45B03727AD9B.1; 
 Mon, 05 Sep 2022 12:59:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 553bdbf2f81b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Sep 2022 12:59:54 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS4PR08MB7904.eurprd08.prod.outlook.com (2603:10a6:20b:51f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 12:59:45 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 12:59:45 +0000
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
X-Inumbo-ID: ab4a3b16-2d1a-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OhS6LGv/2fLVgLuZs32bslVJrD7JL5j1yVEIB2LQL4qxQRPWQDlftSj+yGDkoXUpnwRYqi11wDiVWeKfvEMC5NWBTayyBRn1c55X7D9Ncg5HpgG8Sjl7ib8Kjt+JnZjZ2XLihaqUBTPn/ROtRB/JAOzpTIvfvVzQ/D9UjGPHtpg5/nBX2kJq6fm+VGQIHzJC4M++hu7Bak3cTarkIBuO297lRH/BNuNekLzVYLxJXiEAWkmAy6pgdiEk+c/IjfnucsS1DTs+g6JDR4rLk4HnODr6bEgWwrSvYL/8f8GN2MOtEIJUtssZSdCFeBJiSIDgm3cBupsusBC7wGiZxgT+Tg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vm1dtfNoyw0A4MV7brOwwM2q9yROOYu2odnhkmnnMt4=;
 b=dhi6gIWRcsv15/rB+nFN+MkTh/AEwzRLGUtvZrIX0A5AYOhI8D4fItmJFCJ9Tq5qFiZTpof5l8f+uy015o+EVZoH58+o2QmPfRJBmQnfv+hhnLJkzRtbkYYJNXR9j3hnD+5AmZgrKMucZ/8oddOsebjo2foep5H3ihwcvrp50KzO2FI3b7eP9FbDokzrJjgno2geaMBi74EYkTD+fBXuRvbaYk9lKTokzztd9T3+/o089idV0Vimr1vml91hWYzwFFmGEZ8bhHKk9kAHEy7f85g4WdAtIR7BXm9ELtmNtZPTmMvoIL9ndX2PjSiJ1v7M9K5ReQkh9ht/u+MKepk3YA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vm1dtfNoyw0A4MV7brOwwM2q9yROOYu2odnhkmnnMt4=;
 b=5M8Dxz0PdlIgiglL5jV/8M0AD/ypLNIxeGdFQRijjTjVgfXoyyat/uNjF8FEPR51LnHTLF2dSo+mD80+subDXkIxF80PJpMy3hQZfrZnz0/Wj+WergPf4vc9SVlSy9K4pYryR3Vt7r14TJeQSkVd9QaL7NWkJExoswrNzQ0XmQQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 04e362773495884d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odeT/iEhoCECm++HuOUbITO0TNfR+MFMcFshb7sbbiMuYLk6lAbaCayn0dVyBHuqWLwk1QnziIxoQaNtcAk9/zoCMI2NHW3/Fp0KYUHkNxKHJmxsiEVD1ZU3scRYPQ1ZsHL2eKxeke9FYI96e9Bf85o7hlBOTaXC9iPd5xHajhBfHzLyaoODV2BuptzzxSx9eT69H2EJb8yCILNbRqXSWN9m8KTVOXrqD6C6RlUsFVSh3okvb2agRh1UZUO3ex0ADx7J8/ia8OxY1xgC8FTt/euHOZuL/V22rrLZhTZOOWvBMo4rPVphEd7vh9pV3KDFQVs4IEbOV/kCVLOBOj0A4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vm1dtfNoyw0A4MV7brOwwM2q9yROOYu2odnhkmnnMt4=;
 b=Xjxjvf94x7hlSTRoraLYYZ66kMtGXvbysCRIHiTrFmrwM8ZpHUBe1yiunDTL3mf4RxEgax8k4VS53WiCG78IufuoRV11/QW8dwLmZLjR5XDiLgFbALWZFtvhLhYOGDRtJd372i/nVdLyBl3R3x4aFQPMpVBL4pku0+QguFfEqMKO2HJxREbmQtU9QO9kH9sNZRxmloXgtgrWLpebTXjkHSmwlTJ327T0TE7Lj/hA53hhvi8aIPBjymdjnwbw9BprTiDQGxZGT84z5koi+205hV1JgfEPpTctpCrHYjD8ET5bJ8Hv9yo5a3zzXo0ikZTMvX9JEbwXgH4rnsXt5aONBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vm1dtfNoyw0A4MV7brOwwM2q9yROOYu2odnhkmnnMt4=;
 b=5M8Dxz0PdlIgiglL5jV/8M0AD/ypLNIxeGdFQRijjTjVgfXoyyat/uNjF8FEPR51LnHTLF2dSo+mD80+subDXkIxF80PJpMy3hQZfrZnz0/Wj+WergPf4vc9SVlSy9K4pYryR3Vt7r14TJeQSkVd9QaL7NWkJExoswrNzQ0XmQQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property value
Thread-Topic: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property
 value
Thread-Index:
 AQHYveOAeMLlOwX5Mka7ZrpAabJW7K3K4ewAgAFZKACAAAQoAIAADY8AgAAHN4CABGESgIAACJcAgAADEoCAAAPFgIAADnWA
Date: Mon, 5 Sep 2022 12:59:45 +0000
Message-ID: <1874D575-E3B3-4221-925F-AF71D3EF0289@arm.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
 <d8dae49b05e6c59715016e0995b1275f3cb6e7fc.1662023183.git.rahul.singh@arm.com>
 <28b9679c-8223-ae71-d629-4ec31a72dcb2@xen.org>
 <36A408C8-36C5-4A39-80B4-F564445635C7@arm.com>
 <616b36ec-5a42-cb9a-2131-3aea1bec7c67@xen.org>
 <46897765-5063-49CE-8A8A-F4DA50570A08@arm.com>
 <a669182c-dab1-35b7-9bf7-caac1813e3ad@xen.org>
 <C27FD0DE-D8FA-4A67-AE0B-DF4030A65127@arm.com>
 <a14b4d4a-5ae6-4af0-2d00-49bbc688cd4a@xen.org>
 <6B0D4F4B-C7CC-4C04-9BA4-71976CAA82C5@arm.com>
 <cf2872c6-23e3-ced4-d7c5-2a5e6ade98ad@xen.org>
In-Reply-To: <cf2872c6-23e3-ced4-d7c5-2a5e6ade98ad@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b481b1d3-c9bd-4d09-97fc-08da8f3e8e18
x-ms-traffictypediagnostic:
	AS4PR08MB7904:EE_|AM7EUR03FT049:EE_|PA4PR08MB7458:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pij07dsmFSPJvJgE2lOe0ZCKFrXuSfmANvZaZaq2aEPNMufoa2q5EYbE2FzLv+HdQl5uoYzzz1N/6QGeEAcOTrIOid51oYW1xZJGjTq2ntP2eF2uStfFN7Cjg6rT9O21DnLzytBwFtKvvRXnaCP00Y71t1RulfzZpg+bJimdCLPCNhGYsL9wyDsjZfM7skZdhyulehCEY02iyonvuMjoCDoPOI44EVJcpXFuHPkgg3TmG2J0XEI8NrpJB4jLk2k1vXUIz3OmZhdNlHCAUUymc4BXk4LnF823Zp5udIthFhYdiCeRXaKRargW1nUx08Ndn2UUV/zmZuD6sFv7kLS7KsCy+PAha2IcqUDp8XLVPJAIXttBNOJ1IaEVunXWAZVNKn/B3AZrO6L725PD6PiF52nKENiiGmbc6JEeAn6uDaE/k70RVxODCQqp6beYI3W9r55p0JI9njDLcMriZJgCO3dOkozJLhD81CNap/aPSAAb46Km1tGcG/OroVuIHcju/B1xS3mpTwMoxrEGchmpDcxksEJl84EbYwG54TcwqUf+9Ko/mxX5QdNkMxDSQ5CYgtIYOkzWiX59edVs8Jm4BY12DgDog5X8jo4yvOHAabpymSX/pUE7XrQX0hJJ3Cu5z2ZVmxedRkApam6tAEUMT/nvSkgUzEbJhFXGIz3kpMJMgmZPk9cILshV+M/LI4HL1fRoj6p01DBm5deuDOBzKfVLvUkJPMwmABaF33pkYH/v5mYKPTc4G3PLAQab7ZtJ2QiqE77P9BVDfwnPL7/NLI4MVDcEf/SBg80LR3VNf7E=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(8676002)(66556008)(186003)(5660300002)(4326008)(2616005)(83380400001)(8936002)(122000001)(66946007)(38100700002)(91956017)(76116006)(2906002)(64756008)(6486002)(6512007)(316002)(71200400001)(26005)(6506007)(53546011)(41300700001)(478600001)(6916009)(54906003)(36756003)(66446008)(38070700005)(86362001)(66476007)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFBA3B8A29A66646A4E8E685EB3AD1D9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7904
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	159c8db4-bbf2-4a18-318d-08da8f3e8200
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kA8X/6FyJzd75WdU9mDQ/yeIwJWratEdf0Fw4QMOFRPxeUBq8RWsjrWgWwXB3ruBcgz7/IbS4Akm9zS+T9JcWhZYAeaij4celzzDKjsfCQ5eOorTne9MjjDNJxAjcq6Dys3HpRIIDIHBPeVIffMUsB2mVyLzwSKXLyYSPnVcQBHXbiSgeEFdgeaku9n3T8NfeWZfHdKq/YqZTE22MM/vIBBThn+AD0obUgs/pL1Azfksj/3tzpHHhSid8P2rpaDflAAD2tJKL70KuvHhgf+a7bDjzL+bTc4jrT/nHjNMZJGnNnK/9x0A7K5KuaOQrqyNL9PCmz6floUY3U+oO2e7vzbKSu+VkYTWm+XbmGKpfgVzhpSKCVHekvpsQbGT5Y1UNWSMMhUmRn1PV/vLrQed4EYInsx9TLw4DCA2jK+9VnPl+3lbrvvU8B4k1OS2Aan07A9L6Z+IYRI8jsydMw2DH+2Xt5zmFUPeVA3ZdN3jyK5dfG0bvAgDnD36E3WJOhxxKN0FaTxHaj+ndI9D2I4WRxs7Egpe9hup7SjrBP+xVEFYGhnoWXrNxmDB5/ERRI66H//NhDzOOEHT475WPlI5tUFNyE+xDSJ0D2Xuxo2qKC9BAHCucCKNPsdoIv9G5WpxTWkq2sVOGZBtVVaHaMfP4sul5G1YtEn8yzgd7HXKgL9hqY8K/BUK++23eTyBlyl4sFn6NYUE1sXL1fLTNMU8/KBS6UjiKrdJ8S/HmIefpMtq8F9iOXk7vnqKT+om0F/zVOwJ6yu2quJZo6+Uk9asSA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966006)(40470700004)(36840700001)(8936002)(107886003)(2616005)(186003)(6512007)(336012)(53546011)(36756003)(6486002)(5660300002)(6506007)(47076005)(6862004)(26005)(33656002)(86362001)(478600001)(40480700001)(70206006)(40460700003)(2906002)(356005)(36860700001)(41300700001)(82740400003)(81166007)(83380400001)(316002)(54906003)(82310400005)(70586007)(4326008)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 13:00:06.0442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b481b1d3-c9bd-4d09-97fc-08da8f3e8e18
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7458

SGkgSnVsaWVuLA0KDQo+IE9uIDUgU2VwIDIwMjIsIGF0IDEzOjA4LCBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMDUvMDkvMjAyMiAxMjo1NCwg
QmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+IEhpIEp1bGllbiwNCj4+PiBPbiA1IFNlcCAyMDIy
LCBhdCAxMjo0MywgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4gDQo+
Pj4gDQo+Pj4gDQo+Pj4gT24gMDUvMDkvMjAyMiAxMjoxMiwgUmFodWwgU2luZ2ggd3JvdGU6DQo+
Pj4+IEhpIEp1bGllbiwNCj4+PiANCj4+PiBIaSBSYWh1bCwNCj4+PiANCj4+Pj4+IE9uIDIgU2Vw
IDIwMjIsIGF0IDU6MjAgcG0sIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0K
Pj4+Pj4gDQo+Pj4+PiANCj4+Pj4+IA0KPj4+Pj4gT24gMDIvMDkvMjAyMiAxNjo1NCwgUmFodWwg
U2luZ2ggd3JvdGU6DQo+Pj4+Pj4gSGkgSnVsaWVuLA0KPj4+Pj4gDQo+Pj4+PiBIaSBSYWh1bCwN
Cj4+Pj4+IA0KPj4+Pj4+PiBPbiAyIFNlcCAyMDIyLCBhdCA0OjA1IHBtLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IEhpIEJlcnRyYW5kLA0K
Pj4+Pj4+PiANCj4+Pj4+Pj4gT24gMDIvMDkvMjAyMiAxNTo1MSwgQmVydHJhbmQgTWFycXVpcyB3
cm90ZToNCj4+Pj4+Pj4+PiBPbiAxIFNlcCAyMDIyLCBhdCAxOToxNSwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4+Pj4+Pj4gQUZBSVUsIGl0IGlzIG5vdCBwb3NzaWJs
ZSB0byBoYXZlICpfeGVuc3RvcmUgPSB0cnVlIGFuZCAqX2VuaGFuY2VkID0gZmFsc2UuIEkgdGhp
bmsgaXQgd291bGQgYmUgY2xlYXJlciBpZiBgYGRvbTBsZXNzX2VuaGFuY2VkYGAgaXMgdHVybmVk
IHRvIGFuIGVudW0gd2l0aCAzIHZhbHVlczoNCj4+Pj4+Pj4+PiAtIE5vbmUNCj4+Pj4+Pj4+PiAt
IE5PWEVOU1RPUkUvQkFTSUMNCj4+Pj4+Pj4+PiAtIEZVTExZX0VOSEFOQ0VEDQo+Pj4+Pj4+Pj4g
DQo+Pj4+Pj4+Pj4gSWYgd2Ugd2FudCB0byBiZSBmdXR1cmUgcHJvb2YsIEkgd291bGQgdXNlIGEg
ZmllbGQgJ2ZsYWdzJyB3aGVyZSBub24temVybyBtZWFucyBlbmhhbmNlZC4gRWFjaCBiaXQgd291
bGQgaW5kaWNhdGUgd2hpY2ggZmVhdHVyZXMgb2YgWGVuIGlzIGV4cG9zZWQuDQo+Pj4+Pj4+PiBJ
IHRoaW5rIHRoYXQgY291bGQgYmUgYSBnb29kIHNvbHV0aW9uIGlmIHdlIGRvIGl0IHRoaXMgd2F5
Og0KPj4+Pj4+Pj4gLSBkZWZpbmUgYSBkb20wbGVzcyBmZWF0dXJlIGZpZWxkIGFuZCBoYXZlIGRl
ZmluZXMgbGlrZSB0aGUgZm9sbG93aW5nOg0KPj4+Pj4+Pj4gI2RlZmluZSBET00wTEVTU19HTlRU
QUINCj4+Pj4+Pj4+ICNkZWZpbmUgRE9NMExFU1NfRVZFTlRDSE4NCj4+Pj4+Pj4+ICNkZWZpbmUg
RE9NMExFU1NfWEVOU1RPUkUgPg0KPj4+Pj4+Pj4gLSBkZWZpbmUgZG9tMGxlc3MgZW5oYW5jZWQg
YXMgdGhlIHJpZ2h0IGNvbWJpbmF0aW9uOg0KPj4+Pj4+Pj4gI2RlZmluZSBET00wTEVTU19FTkhB
TkNFRCA9IChET00wTEVTU19HTlRUQUJ8IERPTTBMRVNTX0VWRU5UQ0hOfCBET00wTEVTU19YRU5T
VE9SRSkNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IEkgd291bGQgcmF0aGVyIGludHJvZHVjZSBET00wTEVT
U19FTkhBTkNFRF9CQVNJQyAob3Igc2ltaWxhcikgaW5zdGVhZCBvZiBkZWZpbmluZyBhIGJpdCBm
b3IgZ250dGFiIGFuZCBldnRjaG4uIFRoaXMgd2lsbCBhdm9pZCB0aGUgcXVlc3Rpb24gb2Ygd2h5
IHdlIGFyZSBpbnRyb2R1Y2luZyBiaXRzIGZvciBib3RoIGZlYXR1cmVzIGJ1dCBub3QgdGhlIGh5
cGVyY2FsbC4uLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gQXMgdGhpcyBpcyBhbiBpbnRlcm5hbCBpbnRl
cmZhY2UsIGl0IHdvdWxkIGJlIGVhc2llciB0byBtb2RpZnkgYWZ0ZXJ3YXJkcy4NCj4+Pj4+PiBI
b3cgYWJvdXQgdGhpcz8NCj4+Pj4+PiAvKg0KPj4+Pj4+ICAqIExpc3Qgb2YgcG9zc2libGUgZmVh
dHVyZXMgZm9yIGRvbTBsZXNzIGRvbVVzDQo+Pj4+Pj4gICoNCj4+Pj4+PiAgKiBET00wTEVTU19F
TkhBTkNFRF9CQVNJQzogWGVuIFBWIGludGVyZmFjZXMsIGluY2x1ZGluZyBncmFudC10YWJsZSBh
bmQNCj4+Pj4+PiAgKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBldnRjaG4sIHdpbGwgYmUgZW5hYmxlZCBmb3IgdGhlIFZNLg0KPj4+Pj4g
DQo+Pj4+PiBUZWNobmljYWxseSwgdGhlIGd1ZXN0IGNhbiBhbHJlYWR5IHVzZSB0aGUgZ3JhbnQt
dGFibGUgYW5kIGV2dGNobiBpbnRlcmZhY2VzLiBUaGlzIGFsc28gcmVhZHMgcXVpdGUgb2RkIHRv
IG1lIGJlY2F1c2UgImluY2x1ZGluZyIgZG9lc24ndCB0ZWxsIHdoYXQncyBub3QgZW5hYmxlZC4g
U28gb25lIGNvdWxkIGFzc3VtZSBYZW5zdG9yZWQgaXMgYWxzbyBlbmFibGVkLiBJbiBmYWN0IHRo
ZSB3b3JkaW5nIGZvciBgYERPTTBMRVNTX0VOSEFOQ0VEYGAgaXMgd2hhdCBtYWtlcyBpdCBhIGxv
dCBtb3JlIGNvbmZ1c2luZy4NCj4+Pj4+IA0KPj4+Pj4gU28gSSB3b3VsZCBzdWdnZXN0IHRoZSBm
b2xsb3dpbmcgd29yZGluZzoNCj4+Pj4+IA0KPj4+Pj4gIk5vdGlmeSB0aGUgT1MgaXQgaXMgcnVu
bmluZyBvbiB0b3Agb2YgWGVuLiBBbGwgdGhlIGRlZmF1bHQgZmVhdHVyZXMgYnV0IFhlbnN0b3Jl
IHdpbGwgYmUgYXZhaWxhYmxlLiBOb3RlIHRoYXQgYW4gT1MgKm11c3QqIG5vdCByZWx5IG9uIHRo
ZSBhdmFpbGFiaWxpdHkgb2YgWGVuIGZlYXR1cmVzIGlmIHRoaXMgaXMgbm90IHNldC4NCj4+Pj4+
ICINCj4+Pj4+IA0KPj4+Pj4gVGhlIHdvcmRpbmcgY2FuIGJlIHVwZGF0ZWQgb25jZSB3ZSBwcm9w
ZXJseSBkaXNhYmxlIGV2ZW50IGNoYW5uZWwvZ3JhbnQgdGFibGUgd2hlbiB0aGUgZmxhZyBpcyBu
b3Qgc2V0Lg0KPj4+Pj4gDQo+Pj4+Pj4gICogRE9NMExFU1NfWEVOU1RPUkU6ICAgICAgICAgICAg
ICBYZW5zdG9yZSB3aWxsIGJlIGVuYWJsZWQgZm9yIHRoZSBWTS4NCj4+Pj4+IA0KPj4+Pj4gSSB3
b3VsZCBtYWtlIGNsZWFyIHRoaXMgY2FuJ3QgYmUgdXNlZCB3aXRob3V0IHRoZSBmaXJzdCBvbmUu
DQo+Pj4+PiANCj4+Pj4+PiAgKiBET00wTEVTU19FTkhBTkNFRDogICAgICAgICAgICAgIFhlbiBQ
ViBpbnRlcmZhY2VzLCBpbmNsdWRpbmcgZ3JhbnQtdGFibGUgeGVuc3RvcmUgPiAgICogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYW5kDQo+
Pj4+PiBldnRjaG4sIHdpbGwgYmUgZW5hYmxlZCBmb3IgdGhlIFZNLg0KPj4+Pj4gDQo+Pj4+PiBT
ZWUgYWJvdmUgYWJvdXQgIlBWIGludGVyZmFjZXMiLiBTbyBJIHdvdWxkIHN1Z2dlc3QgdG8gcmV3
b3JkIHRvOg0KPj4+Pj4gDQo+Pj4+PiAiTm90aWZ5IHRoZSBPUyBpdCBpcyBydW5uaW5nIG9uIHRv
cCBvZiBYZW4uIEFsbCB0aGUgZGVmYXVsdCBmZWF0dXJlcyAoaW5jbHVkaW5nIFhlbnN0b3JlKSB3
aWxsIGJlIGF2YWlsYWJsZSIuDQo+Pj4+PiANCj4+Pj4+PiAgKi8NCj4+Pj4+PiAjZGVmaW5lIERP
TTBMRVNTX0VOSEFOQ0VEX0JBU0lDIEJJVCgwLCBVTCkNCj4+Pj4+PiAjZGVmaW5lIERPTTBMRVNT
X1hFTlNUT1JFICAgICAgIEJJVCgxLCBVTCkNCj4+Pj4+IA0KPj4+Pj4gQmFzZWQgb24gdGhlIGNv
bW1lbnQgYWJvdmUsIEkgd291bGQgY29uc2lkZXIgdG8gZGVmaW5lIERPTTBMRVNTX1hFTlNUT1JF
IGFzIGJpdCAwIGFuZCAxIHNldC4NCj4+Pj4+IA0KPj4+Pj4+ICNkZWZpbmUgRE9NMExFU1NfRU5I
QU5DRUQgICAgICAgKERPTTBMRVNTX0VOSEFOQ0VEX0JBU0lDIHwgRE9NMExFU1NfWEVOU1RPUkUp
DQo+Pj4+ICBCZXJ0cmFuZCBhbmQgSSBkaXNjdXNzZWQgdGhpcyBhZ2FpbiB3ZSBjYW1lIHRvIHRo
ZSBjb25jbHVzaW9uIHRoYXQgRE9NMExFU1NfRU5IQU5DRURfQkFTSUMgaXMgbm90DQo+Pj4+IHRo
ZSBzdWl0YWJsZSBuYW1lIGFzIHRoaXMgbWFrZXMgdGhlIGNvZGUgdW5jbGVhciBhbmQgZG9lcyBu
b3QgY29ycmVzcG9uZCB0byBEVCBzZXR0aW5ncy4gV2UgcHJvcG9zZSB0aGlzDQo+Pj4+IHBsZWFz
ZSBsZXQgbWUga25vdyB5b3VyIHRob3VnaHRzLg0KPj4+IA0KPj4+IFRvIG1lIHRoZSBkZWZhdWx0
IG9mICJlbmhhbmNlZCIgc2hvdWxkIGJlIGFsbCBYZW4gZmVhdHVyZXMuIEFueXRoaW5nIGVsc2Ug
c2hvdWxkIGJlIGNvbnNpZGVyIGFzIHJlZHVjZWQvYmFzaWMvbWluaW11bS4gSGVuY2Ugd2h5IEkg
c3RpbGwgdGhpbmsgd2UgbmVlZCB0byBhZGQgaXQgaW4gdGhlIG5hbWUgZXZlbiBpZiB0aGlzIGlz
IG5vdCB3aGF0IHdlIGV4cG9zZSBpbiB0aGUgRFQuIEluIGZhY3QuLi4NCj4+Pj4gIC8qDQo+Pj4+
ICAqIExpc3Qgb2YgcG9zc2libGUgZmVhdHVyZXMgZm9yIGRvbTBsZXNzIGRvbVVzDQo+Pj4+ICAq
DQo+Pj4+ICAqIERPTTBMRVNTX1hFTlNUT1JFOgkJWGVuc3RvcmUgd2lsbCBiZSBlbmFibGVkIGZv
ciB0aGUgVk0uIFRoaXMgZmVhdHVyZQ0KPj4+PiAgKiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAJY2FuJ3QgYmUgZW5hYmxlZCB3aXRob3V0IHRoZSBET00wTEVT
U19FTkhBTkNFRC4NCj4+Pj4gICogRE9NMExFU1NfRU5IQU5DRUQ6ICAgICAgIAlOb3RpZnkgdGhl
IE9TIGl0IGlzIHJ1bm5pbmcgb24gdG9wIG9mIFhlbi4gQWxsIHRoZQ0KPj4+PiAgKiAgICAgICAg
ICAgICAgICAgICAgICAgICAgCQkJCWRlZmF1bHQgZmVhdHVyZXMgKGluY2x1ZGluZyBYZW5zdG9y
ZSkgd2lsbCBiZQ0KPj4+PiAgKiAgICAgICAgICAgICAgICAgICAgICAgICAgCQkJCWF2YWlsYWJs
ZS4gTm90ZSB0aGF0IGFuIE9TICptdXN0KiBub3QgcmVseSBvbiB0aGUNCj4+Pj4gICogICAgICAg
ICAgICAgICAgICAgICAgICAgIAkJCQlhdmFpbGFiaWxpdHkgb2YgWGVuIGZlYXR1cmVzIGlmIHRo
aXMgaXMgbm90IHNldC4NCj4+PiANCj4+PiAuLi4gd2hhdCB5b3Ugd3JvdGUgaGVyZSBtYXRjaCB3
aGF0IEkgd3JvdGUgYWJvdmUuIFNvIGl0IGlzIG5vdCBjbGVhciB0byBtZSB3aGF0J3MgdGhlIHBv
aW50IG9mIGhhdmluZyBhIGZsYWcgRE9NMExFU1NfWEVOU1RPUkUuDQo+PiBXaGVuIHdlIGxvb2tl
ZCBhdCB0aGUgY29kZSB3aXRoIHRoZSBzb2x1dGlvbiB1c2luZyBCQVNJQywgaXQgd2FzIHJlYWxs
eSBub3QgZWFzeSB0byB1bmRlcnN0YW5kLg0KPiANCj4gSSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5k
IGhvdyB0aGlzIGlzIGRpZmZlcmVudCBmcm9tIEVOSEFOQ0VELCBFTkhBTkNFRF9GVUxMLiBJbiBm
YWN0LCB3aXRob3V0IGxvb2tpbmcgYXQgdGhlIGRvY3VtZW50YXRpb24sIHRoZXkgbWVhbiBleGFj
dGx5IHRoZSBzYW1lLi4uDQo+IA0KPiBUaGUgZGlmZmVyZW5jZSBiZXR3ZWVuICJCQVNJQyIgYW5k
ICJFTkhBTkNFRCIgaXMgY2xlYXIuIFlvdSBrbm93IHRoYXQgaW4gb25lIGNhc2UsIHlvdSB3b3Vs
ZCBnZXQgbGVzcyB0aGFuIHRoZSBvdGhlci4NCj4gDQo+PiBCeSB0aGUgd2F5IHRoZSBjb21tZW50
IGlzIHdyb25nIGFuZCBjb3JyZXNwb25kIHRvIHdoYXQgc2hvdWxkIGJlIEVOSEFOQ0VEX0ZVTEwg
aGVyZQ0KPj4gRU5IQU5DRUQgd291bGQgYmUgdGhlIGJhc2Ugd2l0aG91dCBYZW5zdG9yZS4NCj4g
DQo+IFRoYW5rcyBmb3IgdGhlIGNvbmZpcm1hdGlvbi4gSSBhbSBhZnJhaWQsIEkgYW0gc3Ryb25n
bHkgYWdhaW5zdCB0aGUgdGVybWlub2xvZ3kgeW91IHByb3Bvc2VkIChzZWUgYWJvdmUgd2h5KS4N
Cj4gDQo+IEkgdGhpbmsgQkFTSUMgKG9yIHNpbWlsYXIgbmFtZSkgaXMgYmV0dGVyLiBCdXQgSSBh
bSBvcGVuIHRvIHN1Z2dlc3Rpb24gc28gbG9uZyBpdCBpcyBub3QgIkRPTTBMRVNTX0VOSEFOQ0VE
IiB2cyAiRE9NMExFU1NfRU5IQU5DRURfRlVMTCIuDQoNCkkgZG8gbm90IGFncmVlIGJ1dCBJIHRo
aW5rIHRoaXMgaXMgb25seSBpbnRlcm5hbCBhbmQgY291bGQgZWFzaWx5IGJlIG1vZGlmaWVkIG9u
ZSBkYXkgaWYgd2UgaGF2ZSBtb3JlIHVzZS1jYXNlcy4NClNvIGxldOKAmXMgZ28gZm9yIEJBU0lD
IGFuZCB1bmJsb2NrIHRoaXMgYmVmb3JlIHRoZSBmZWF0dXJlIGZyZWV6ZS4NCg0KQmVydHJhbmQN
Cg0KPiANCj4gQXMgYW4gYXNpZGUsIEkgdGhpbmsgaXQgaXMgbW9yZSBsb2dpY2FsIGlmIHlvdSBk
ZWZpbmUgRE9NMExFU1NfWEVOU1RPUkUgYXMgYml0IDEuIEJ1dCB0aGF0J3MgTklUIGF0IHRoaXMg
cG9pbnQuIFdoYXQgbWF0dGVycyBpcyB0aGUgbmFtaW5nLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4g
LS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

