Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1581D60E082
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 14:20:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430518.682284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onfOM-000198-V3; Wed, 26 Oct 2022 12:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430518.682284; Wed, 26 Oct 2022 12:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onfOM-00016c-RA; Wed, 26 Oct 2022 12:20:18 +0000
Received: by outflank-mailman (input) for mailman id 430518;
 Wed, 26 Oct 2022 12:20:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TgK0=23=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1onfOL-00016W-CE
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 12:20:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60060.outbound.protection.outlook.com [40.107.6.60])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c81163e-5528-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 14:20:16 +0200 (CEST)
Received: from FR3P281CA0147.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:95::10)
 by DB8PR08MB5529.eurprd08.prod.outlook.com (2603:10a6:10:115::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Wed, 26 Oct
 2022 12:20:12 +0000
Received: from VI1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:95:cafe::8a) by FR3P281CA0147.outlook.office365.com
 (2603:10a6:d10:95::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.13 via Frontend
 Transport; Wed, 26 Oct 2022 12:20:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT025.mail.protection.outlook.com (100.127.144.151) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Wed, 26 Oct 2022 12:20:11 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Wed, 26 Oct 2022 12:20:10 +0000
Received: from 4673a6d39c61.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 235F6828-B499-46F5-BA0E-3BF5EC4B4DED.1; 
 Wed, 26 Oct 2022 12:20:03 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4673a6d39c61.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Oct 2022 12:20:03 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB8568.eurprd08.prod.outlook.com (2603:10a6:20b:565::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Wed, 26 Oct
 2022 12:20:01 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5746.028; Wed, 26 Oct 2022
 12:20:01 +0000
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
X-Inumbo-ID: 8c81163e-5528-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=LHL64mfh3MZR5s1a8zyHvrVzXOlGPAB2Q0KjvIdcCsiWCv38fJy5+8TWKrm1Wdb3C+JyisqpxyWJENrxQc8rt4RQXVi357sKXTU75E+/QMT9R/eir+yEn2DhcC6ECFjWMY8B0O/Mn6ZGMLdOQXfYuPssk7Bpqn73vthgh7h4axG4GQ6A1Mnqiy3yTIoAxMEWwdDBHK8SMx0giqTvQKJZcGQ+LzaE2kOxJlzL2XJcSVoVcvoRS4r+jT3WARaKj3FY6IrDhuJKbiL92ct7FiiYC9Vb/tAj0R51bg1UKM4NFICTGT1PMCva5LJYSTy6sbRZR0LRBpNjtJZVfQIJgfyZCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7+r2fMd+HdGVHU93NjBLkR9hPHnC+ku8Vd0l1aYhnU=;
 b=FoBxC91W3HPfvTato+yFO0bHnG52jFlq7uuHvvfbRk7cQHQTIM4JDWDxWAHSaORzYSffbYBh1qzPRT/ONq725tU1RR2ttMoeZ8LnvRBxB9UmiMO5yqvERJB3580LILBv2OG41BTRimwbxmFGzeYBqwnDREh8Sniw+iPgTDHluOpujrD5EPJtFHO7ywvFJHhZ1TQFCKWemCAigrJxNo5owDlUwp/smcmWpdjtmqNA/aNqZD9SvYTQnpaJVLNd89q3t+XMg73ehcYzIzbMm/uUJNm+cfZKFbXC2xnpHUtDZ53hF+v6Flg388FP44pfnyQPQaWVKhPVIouo8YlBBGGXsw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7+r2fMd+HdGVHU93NjBLkR9hPHnC+ku8Vd0l1aYhnU=;
 b=WzpVaYtHvIUHx09kx6dSS1uOWmGxS99tel6x7NWnwFgmTIb+PfD+le4rIUfMpLMdWQpuNuBm//+8DkNul0bnj0WgBnHokO+7FTdLg0M9uBvISTgi7ueacoMng5xwS8PynPtwWp54vybyUsltkQxqmpoxpSGyyALGP8QNcQTBOgg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: de29177873210349
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZA7X7887VCLBQGsKO68y3Dqy5bYmwxUo5+1N/+F7OOWP743pXBXhCQZ5yQbcoEGVp8yrjPCgQ3qmB/nvg7FVYhfyBTlyunaBq5JFlnK5cRPSKiUvrJvn91P1oJTXDa4HwQCrjplmjBGOgSPwqEgZ7mbiHM1bK2/ZHzCmdOagPVPfXL/BWXCvt6/Q4/6TP9UlQNTgl2LypIPV3g9/tBkuL7HYpGXyV89JJQbNGimDCfbaqzKcZ7tUjXGKdEUxXUcpda0/BAJaISZZziHQT4kSHWnE8T7y1NftyGYQyHdOd32cOdSLwVttNkAsKA0f8Gs4F/ucXEWaMoGUaghC4VJLLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7+r2fMd+HdGVHU93NjBLkR9hPHnC+ku8Vd0l1aYhnU=;
 b=AQXMehb3Daq94B3W8V4A+i1zq1ciSxkBmTbWVbsFctklqT+/ulU4OHiVeUdSXVMt1GWl++5rSrEOAU883ZeYDQ33hdcwVsinP/EqKHRMEFPLQE9Y0WjieqwDur4FTbQEofOCA7zbUoP0tr7LHioP4sTKmbpOUunXFi8JZFOhP+nMqpu29+PKhU8rrISJsSlc9YjwmoaDS/9h8v2yWBpmokR8JPJCIeN0kXE6S0ruYGHnfsuZPJfXSdYI3SRlaTitfyS2ZRF8UqtIu0bS5Z7j1FLtugkCt/8TmmGWJuYi6ghkB75aLma9gIEk2BIdYlCEhnpTvBoXnNq8fw+j5UmZwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7+r2fMd+HdGVHU93NjBLkR9hPHnC+ku8Vd0l1aYhnU=;
 b=WzpVaYtHvIUHx09kx6dSS1uOWmGxS99tel6x7NWnwFgmTIb+PfD+le4rIUfMpLMdWQpuNuBm//+8DkNul0bnj0WgBnHokO+7FTdLg0M9uBvISTgi7ueacoMng5xwS8PynPtwWp54vybyUsltkQxqmpoxpSGyyALGP8QNcQTBOgg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Deadcode discussion based on Arm NS phys timer
Thread-Topic: Deadcode discussion based on Arm NS phys timer
Thread-Index:
 AQHY54gZ+lETtnfh9UiF8D+fGFbI5q4dXjCAgAANxICAAB5kgIAAySOAgABfjwCAAAmGgIAABfAAgAADzwCAAccwgIAADfkA
Date: Wed, 26 Oct 2022 12:20:01 +0000
Message-ID: <54F41F27-8753-4BA5-98D5-23E649EBE339@arm.com>
References: <d55938a3-aaca-1d01-b34f-858dbca9830b@amd.com>
 <8691e100-4548-9752-8e7e-b292643cae83@xen.org>
 <6aefd6d6-45a2-a1f3-24da-8bbbba22fc08@amd.com>
 <aff58db0-646c-6699-48af-033e28c5626f@xen.org>
 <alpine.DEB.2.22.394.2210241819420.1151068@ubuntu-linux-20-04-desktop>
 <ed0bf3da-fe9f-e00c-9bc3-35e10840701e@amd.com>
 <06D2C614-0F17-4364-BE52-FB0DB51D097B@arm.com>
 <89ff9e50-be23-82c2-cd6b-81e05d339778@amd.com>
 <7C838BB9-E8FA-4239-B851-B179CB6B7A02@arm.com>
 <a3306efe-16bb-feb0-91aa-d6a9b0e30691@amd.com>
In-Reply-To: <a3306efe-16bb-feb0-91aa-d6a9b0e30691@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB8568:EE_|VI1EUR03FT025:EE_|DB8PR08MB5529:EE_
X-MS-Office365-Filtering-Correlation-Id: a3157a49-c8f4-4993-08e3-08dab74c6db2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Q19V1iPzrjOv105zxJtQk0iZQZ/4ZPKN+M9gVfS/qlISWewjTz3zd1X9YUXPY640ygo2v/zcS0tW8l9bQCSDVaVnbNQE07/fP7bSQMwfp94fkL0FdLFoDIKYZjkyCCA1OKNRS0Al5XPlxMHcoCn18VwDdnWn+4cAvUlLy7y0oNcJaZ6GtkqweWRn+z5s5Li6YdFwN9UgJMDx477C8vjTYfVTtaksV4h2ykiacttvigmnfDngFPKFuS6TPxMCnrFizXB4AvPUj2+zFKF013Y/idIIxmcPVePblmsATu1b8nkUEz+wJydM40yIDL1s6wizx2u4BLL02vQnnasFnjB+rMqcPNAp76BE+C1KzI7aioQly0ASbAk8c6Kb53pT0xNa9CQHbkejwYA+x3hURRKCJb3KUbjZAJAQ2Hfl7/dQj8UHPkLIpYv/zHTQdaVTrNS92MFbsWAs9wlk3KO3NOkmJo4/6DhCTDUPVUTDpPDm2tBwu3b8fioL43Rt3z1CdocEJ++YFIScK7MTiK4UYxsJr8x0I9bm0/vJeaQtsDNxtNZIrxW7hx6vZTc9oHgELOlgCe2L6iKBDRLwCLu46ZLu4hfp/16FWOVrp7AOuB4fAzHwbVyGDJ48KsTDsckfi52fXvZhHsXk6x4KwVabQA11taRxmejdUr+v80qdpdkoWDN7Ue+C2GDq7g7kdqlRcaKppjKQwRiwd7rto1iqIkDF82A5OZWRot3DOJFAU911RGPucF5zohq5Hi8naZbtbA0BEHWPWw+8YKQGCr6pE0uHttb6el1H29/TExkkGpgBZqE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(451199015)(66476007)(66946007)(66556008)(66446008)(6916009)(64756008)(91956017)(4326008)(2906002)(8676002)(86362001)(54906003)(41300700001)(316002)(76116006)(8936002)(5660300002)(33656002)(186003)(38100700002)(122000001)(83380400001)(478600001)(6486002)(6506007)(53546011)(2616005)(38070700005)(71200400001)(26005)(6512007)(66899015)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <245A41D00B893F4280B7E57668EB4B55@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8568
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e651af40-b02c-41c1-58af-08dab74c67a2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kxSmrz8NpjIDScMLQwjPW9z2y8VsZQDE7F5oz1iGJaN/xCbrClxJBDs+LYFvMFzzvBFq5iFXHdf730+DbME37l3EFeJQSbW+Ub0CerGe/T1pQW7SlYBISVlC75xCBZX+94CW6LdVrYUB6RXrob3WhJtnznUPg7QfGf4/OL+/6dhJK9Zud2Kn5hv/ZpsPjhSnFeFe89e/HQPoYSOHvjru29wiBCCNBOX3QL2YGbw1+71DZtTnWMhLT1yZnXEWC4wBLy3mSyyP3n9oz+R2iipQScFezl6vC059YqugMBsSQbbgmQi+QTR8iVi/aOeGGd2WRqnsotddM1iWp16MdnwC+DoKY0gInTa78aXLe/IQmTmMWl0kqtg41C+Wpe4f+HeFzoGnQYx694XaLiGxHFvJD0AeePRmXJWZyaY/0CJ6VVvFl0uy+XHfiHoazJ/FuMjYMig0kdH2+fxEqW0AfqmeTIj86ZFjzFBU6MZN00Vum3g1v3cGH/xg/aSK4GZKyyZ9xT9G6WZQguNRqUTkNE7Z30NxIo6vuDvCofyeSwr4sHRhbpbUROh1QehkOHZ95FF02yiEbPAc0m5qEQBY+M5HjgA6DaEGlPLD0VSvnZ7KyLP/baXO1aSAcLQQA3AWrg053shoJ8UV10hQsQI9cfhpR2DvxqKmDAfXyGZxPsB44s2kN1RjQXLKTBDoazY6ygzbqKfDKcy3wtf5W4yyQzw4ZB7IuJ0s82YmjwrWdsIvmIW18KGVtZ4DGj/ZPvGydsGZw6nnXoVhZW4KLXIVGfahwg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(36756003)(66899015)(86362001)(6486002)(36860700001)(41300700001)(4326008)(47076005)(82310400005)(82740400003)(478600001)(356005)(8936002)(6512007)(33656002)(83380400001)(336012)(40460700003)(54906003)(2616005)(186003)(2906002)(81166007)(53546011)(5660300002)(6862004)(316002)(8676002)(6506007)(40480700001)(26005)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 12:20:11.0722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3157a49-c8f4-4993-08e3-08dab74c6db2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5529

SGkgTWljaGFsLA0KDQo+IE9uIDI2IE9jdCAyMDIyLCBhdCAxMjoyOSwgTWljaGFsIE9yemVsIDxt
aWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBhbGwsDQo+IA0KPiBPbiAyNS8x
MC8yMDIyIDEwOjIwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gQ2F1dGlvbjogVGhpcyBt
ZXNzYWdlIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFVzZSBwcm9wZXIgY2F1
dGlvbiB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNraW5nIGxpbmtzLCBvciByZXNwb25k
aW5nLg0KPj4gDQo+PiANCj4+IEhpIE1pY2hhbCwNCj4+IA0KPj4+IE9uIDI1IE9jdCAyMDIyLCBh
dCAwOTowNywgTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+Pj4g
DQo+Pj4gSGkgQmVydHJhbmQsDQo+Pj4gDQo+Pj4gT24gMjUvMTAvMjAyMiAwOTo0NSwgQmVydHJh
bmQgTWFycXVpcyB3cm90ZToNCj4+Pj4gDQo+Pj4+IA0KPj4+PiBIaSBNaWNoYWwsDQo+Pj4+IA0K
Pj4+Pj4gT24gMjUgT2N0IDIwMjIsIGF0IDA4OjExLCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnpl
bEBhbWQuY29tPiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gSGksDQo+Pj4+PiANCj4+Pj4+IE9uIDI1
LzEwLzIwMjIgMDM6MjksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+Pj4+PiANCj4+Pj4+
PiANCj4+Pj4+PiBPbiBNb24sIDI0IE9jdCAyMDIyLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+
Pj4+PiBPbiAyNC8xMC8yMDIyIDEyOjUxLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+Pj4+Pj4g
Q2F1dGlvbjogVGhpcyBtZXNzYWdlIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2Uu
IFVzZSBwcm9wZXINCj4+Pj4+Pj4+PiBjYXV0aW9uIHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywg
Y2xpY2tpbmcgbGlua3MsIG9yIHJlc3BvbmRpbmcuDQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gDQo+
Pj4+Pj4+Pj4gT24gMjQvMTAvMjAyMiAxMDowNywgTWljaGFsIE9yemVsIHdyb3RlOg0KPj4+Pj4+
Pj4+PiBIZWxsbywNCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBIaSBNaWNoYWwsDQo+Pj4+Pj4+Pj4g
DQo+Pj4+Pj4+Pj4+IFJlY2VudGx5IEkgY2FtZSBhY3Jvc3MgYSBkZWFkY29kZSBpbiBYZW4gQXJt
IGFyY2ggdGltZXIgY29kZS4gQnJpZWZseQ0KPj4+Pj4+Pj4+PiBzcGVha2luZywgd2UgYXJlIHJv
dXRpbmcNCj4+Pj4+Pj4+Pj4gdGhlIE5TIHBoeXMgdGltZXIgKENOVFApIElSUSB0byBYZW4sIGV2
ZW4gdGhvdWdoIFhlbiBkb2VzIG5vdCBtYWtlIHVzZQ0KPj4+Pj4+Pj4+PiBvZiBpdCAoYXMgaXQg
dXNlcyB0aGUgaHlwZXJ2aXNvciB0aW1lciBDTlRIUCkuDQo+Pj4+Pj4+Pj4+IFRoaXMgdGltZXIg
aXMgZnVsbHkgZW11bGF0ZWQsIHdoaWNoIG1lYW5zIHRoYXQgdGhlcmUgaXMgbm90aGluZyB0aGF0
IGNhbg0KPj4+Pj4+Pj4+PiB0cmlnZ2VyIHN1Y2ggSVJRLiBUaGlzIGNvZGUgaXMNCj4+Pj4+Pj4+
Pj4gYSBsZWZ0IG92ZXIgZnJvbSBlYXJseSBkYXlzLCB3aGVyZSB0aGUgQ05USFAgd2FzIGJ1Z2d5
IG9uIHNvbWUgbW9kZWxzDQo+Pj4+Pj4+Pj4+IGFuZCB3ZSBoYWQgdG8gdXNlIHRoZSBDTlRQIGlu
c3RlYWQuDQo+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+PiBBcyBmYXIgYXMgdGhlIHByb2JsZW0gaXRz
ZWxmIGlzIG5vdCByZWFsbHkgaW50ZXJlc3RpbmcsIGl0IHJhaXNlcyBhDQo+Pj4+Pj4+Pj4+IHF1
ZXN0aW9uIG9mIHdoYXQgdG8gZG8gd2l0aCBhIGRlYWRjb2RlLA0KPj4+Pj4+Pj4+PiBhcyB0aGVy
ZSBtaWdodCBiZS9hcmUgb3RoZXIgZGVhZGNvZGUgcGxhY2VzIGluIFhlbi4NCj4+Pj4+Pj4+PiAN
Cj4+Pj4+Pj4+PiBUaGVyZSBhcmUgbXVsdGlwbGUgZGVmaW5pdGlvbiBvZiBkZWFkY29kZS4gRGVw
ZW5kaW5nIG9uIHdoaWNoIG9uZSB5b3UNCj4+Pj4+Pj4+PiBjaG9zZSwgdGhlbiB0aGlzIGNvdWxk
IGNvdmVyIElTX0VOQUJMRUQoKSBhbmQgcG9zc2libHkgI2lmZGVmLiBTbyB0aGlzDQo+Pj4+Pj4+
Pj4gd291bGQgcmVzdWx0IHRvIGEgbG90IG9mIHBsYWNlcyBpbXBhY3RlZCB3aXRoIHRoZSBkZWNp
c2lvbi4NCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBTbyBjYW4geW91IGNsYXJpZnkgd2hhdCB5b3Ug
bWVhbiBieSBkZWFkY29kZT8NCj4+Pj4+Pj4+IEluIHRoZSB0aW1lciBleGFtcGxlLCBJIHRoaW5r
IHdlIGhhdmUgYm90aCBhIGRlYWRjb2RlIGFuZCB1bnJlYWNoYWJsZSBjb2RlLg0KPj4+Pj4+Pj4g
Rm9yIHRoZSBwdXJwb3NlIG9mIHRoaXMgZGlzY3Vzc2lvbiwgbGV0J3MgdGFrZSB0aGUgTUlTUkEg
ZGVmaW5pdGlvbiBvZiBhDQo+Pj4+Pj4+PiBkZWFkY29kZSB3aGljaCBpcyBhICJjb2RlIHRoYXQg
Y2FuIGJlIGV4ZWN1dGVkDQo+Pj4+Pj4+PiBidXQgaGFzIG5vIGVmZmVjdCBvbiB0aGUgZnVuY3Rp
b25hbCBiZWhhdmlvciBvZiB0aGUgcHJvZ3JhbSIuIFRoaXMgZGlmZmVycw0KPj4+Pj4+Pj4gZnJv
bSB0aGUgdW5yZWFjaGFibGUgY29kZSBkZWZpbml0aW9uIHRoYXQgaXMNCj4+Pj4+Pj4+IGEgImNv
ZGUgdGhhdCBjYW5ub3QgYmUgZXhlY3V0ZWQiLiBTZXR0aW5nIHVwIHRoZSBJUlEgZm9yIFhlbiBp
cyBhbiBleGFtcGxlDQo+Pj4+Pj4+PiBvZiBhIGRlYWRjb2RlLiBDb2RlIHdpdGhpbiBJUlEgaGFu
ZGxlciBpcyBhbiB1bnJlYWNoYWJsZSBjb2RlDQo+Pj4+Pj4+PiAodGhlcmUgaXMgbm90aGluZyB0
aGF0IGNhbiB0cmlnZ2VyIHRoaXMgSVJRKS4NCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gV2hhdCBJIG1l
YW4gYnkgZGVhZGNvZGUgaGFwcGVucyB0byBiZSB0aGUgc3VtIG9mIHRoZSB0d28gY2FzZXMgYWJv
dmUgaS5lLg0KPj4+Pj4+Pj4gdGhlIGNvZGUgdGhhdCBjYW5ub3QgYmUgZXhlY3V0ZWQgYXMgd2Vs
bCBhcyB0aGUgY29kZSB0aGF0DQo+Pj4+Pj4+PiBkb2VzIG5vdCBpbXBhY3QgdGhlIGZ1bmN0aW9u
YWxpdHkgb2YgdGhlIHByb2dyYW0uDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4g
T25lIG1heSBzYXkgdGhhdCBpdCBpcyB1c2VmdWwgdG8ga2VlcCBpdCwgYmVjYXVzZSBvbmUgZGF5
LA0KPj4+Pj4+Pj4+PiBzb21lb25lIG1pZ2h0IG5lZWQgaXQgd2hlbiBkZWFsaW5nIHdpdGggeWV0
IGFub3RoZXIgYnJva2VuIEhXLiBTdWNoDQo+Pj4+Pj4+Pj4+IHBlcnNvbiB3b3VsZCBzdGlsbCBu
ZWVkIHRvIG1vZGlmeSB0aGUgb3RoZXINCj4+Pj4+Pj4+Pj4gcGFydCBvZiB0aGUgY29kZSAoZS5n
LiByZXByb2dyYW1fdGltZXIpLCBidXQgdGhlcmUgd291bGQgYmUgbGVzcyB3b3JrDQo+Pj4+Pj4+
Pj4+IHJlcXVpcmVkIG92ZXJhbGwuIFBlcnNvbmFsbHksIEknbSBub3QgaW4gZmF2b3Igb2YNCj4+
Pj4+Pj4+Pj4gc3VjaCBhcHByb2FjaCwgYmVjYXVzZSB3ZSBzaG91bGQgbm90IHJlYWxseSBzdXBw
b3J0IHBvc3NpYmxlIHNjZW5hcmlvcw0KPj4+Pj4+Pj4+PiB3aXRoIGJyb2tlbiBIVyAoZXhjZXB0
IGZvciBlcnJhdGFzIGxpc3Rpbmcga25vd24gaXNzdWVzKS4NCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+
PiBUaGUgZGlmZmVyZW5jZSBiZXR3ZWVuICJicm9rZW4gSFciIGFuZCAiSFcgd2l0aCBrbm93biBl
cnJhdGEiIGlzIGEgYml0DQo+Pj4+Pj4+Pj4gdW5jbGVhciB0byBtZS4gQ2FuIHlvdSBjbGFyaWZ5
IGhvdyB5b3Ugd291bGQgbWFrZSB0aGUgZGlmZmVyZW5jZSBoZXJlPw0KPj4+Pj4+Pj4+IA0KPj4+
Pj4+Pj4+IEluIHBhcnRpY3VsYXIsIGF0IHdoaWNoIHBvaW50IGRvIHlvdSBjb25zaWRlciB0aGF0
IHRoZSBIVyBzaG91bGQgbm90IGJlDQo+Pj4+Pj4+Pj4gc3VwcG9ydGVkIGJ5IFhlbj8NCj4+Pj4+
Pj4+IEknbSBub3Qgc2F5aW5nIHRoYXQgSFcgc2hvdWxkIG5vdCBiZSBzdXBwb3J0ZWQuIFRoZSBk
aWZmZXJlbmNlIGZvciBtZQ0KPj4+Pj4+Pj4gYmV0d2VlbiBicm9rZW4gSFcgYW5kDQo+Pj4+Pj4+
PiBIVyB3aXRoIGtub3duIGVycmF0YSBpcyB0aGF0IGZvciB0aGUgZm9ybWVyLCB0aGUgaW5jb3Jy
ZWN0IGJlaGF2aW9yIGlzIG9mdGVuDQo+Pj4+Pj4+PiBkdWUgdG8gdGhlIGVhcmx5IHN1cHBvcnQg
c3RhZ2UsDQo+Pj4+Pj4+PiB1c2luZyBlbXVsYXRvcnMvbW9kZWxzIGluc3RlYWQgb2YgcmVhbCBI
Vywgd2hlcmVhcyBmb3IgdGhlIGxhdHRlciwgdGhlIEhXIGlzDQo+Pj4+Pj4+PiBhbHJlYWR5IHJl
bGVhc2VkIGFuZCBpdCBoYXBwZW5zIHRvIGJlIHRoYXQgaXQgaXMgYnVnZ3kNCj4+Pj4+Pj4+ICh0
aGUgSFcgdmVuZG9yIGlzIGF3YXJlIG9mIHRoZSBpc3N1ZSBhbmQgcmVsZWFzZWQgZXJyYXRhcyku
DQo+Pj4+Pj4+IA0KPj4+Pj4+PiBUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLiBXaGF0IEkg
d291bGQgY2FsbCBicm9rZW4gaXMgYW55dGhpbmcgdGhhdCBjYW4ndA0KPj4+Pj4+PiBiZSBmaXhl
ZCBpbiBzb2Z0d2FyZS4gRm9yIGEgbm90IHRvbyBmaWN0aW9uYWwgZXhhbXBsZSwgYW4gSFcgd2hl
cmUgUENJIGRldmljZXMNCj4+Pj4+Pj4gYXJlIHVzaW5nIHRoZSBzYW1lIHN0cmVhbSBJRC4gU28g
ZWZmZWN0aXZlbHksIHBhc3N0aHJvdWdoIGNhbid0IGJlIHNhZmVseQ0KPj4+Pj4+PiBzdXBwb3J0
ZWQuDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBSZWdhcmRpbmcsIG5vdCB5ZXQgcmVsZWFzZWQgSFcsIEkg
ZG9uJ3QgdGhpbmsgWGVuIHNob3VsZCBoYXZlIHdvcmthcm91bmQgZm9yDQo+Pj4+Pj4+IHRoZW0u
IEkgd291bGRuJ3QgZXZlbiBjYWxsIGl0ICJicm9rZW4iIGJlY2F1c2UgdGhleSBhcmUgbm90IHll
dCByZWxlYXNlZCBhbmQNCj4+Pj4+Pj4gaXQgaXMgY29tbW9uIHRvIGhhdmUgYnVnIGluIGVhcmx5
IHJldmlzaW9uLg0KPj4+Pj4+PiANCj4+Pj4+Pj4+IERvIHdlIGhhdmUgYW55IGV4YW1wbGUgaW4g
WGVuIGZvciBzdXBwb3J0aW5nIGJyb2tlbiBIVywNCj4+Pj4+Pj4+IHdob3NlIHZlbmRvciBpcyBu
b3QgYXdhcmUgb2YgdGhlIGlzc3VlIG9yIGRpZCBub3QgcmVsZWFzZSBhbnkgZXJyYXRhPw0KPj4+
Pj4+PiBJIHdpbGwgbm90IGNpdGUgYW55IEhXIG9uIHRoZSBNTC4gQnV0IGZyb20gbXkgZXhwZXJp
ZW5jZSwgdGhlIHZlbmRvcnMgYXJlIG5vdA0KPj4+Pj4+PiB2ZXJ5IHZvY2FsIGFib3V0IGlzc3Vl
cyBpbiBwdWJsaWMgKHNvbWUgZG9uJ3QgZXZlbiBzZWVtIHRvIGhhdmUgcHVibGljIGRvYykuDQo+
Pj4+Pj4+IFRoZSBiZXN0IHdheSB0byBmaW5kIHRoZSBpc3N1ZXMgaXMgdG8gbG9vayBhdCBMaW51
eCBjb21taXQuDQo+Pj4+Pj4+IA0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+IEFs
c28sIGFzIHBhcnQgb2YgdGhlIGNlcnRpZmljYXRpb24vRlVTQSBwcm9jZXNzLCB0aGVyZSBzaG91
bGQgYmUgbm8NCj4+Pj4+Pj4+Pj4gZGVhZGNvZGUgYW5kIHdlIHNob3VsZCBoYXZlIGV4cGxhbmF0
aW9uIGZvciBldmVyeSBibG9jayBvZiBjb2RlLg0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IFNlZSBh
Ym92ZS4gV2hhdCBhcmUgeW91IHRyeWluZyB0byBjb3ZlciBieSBkZWFkY29kZT8gV291bGQgcHJv
dGVjdGluZw0KPj4+Pj4+Pj4+IGNvZGUgd2l0aCBJU19FTkFCTEVEKCkgKG9yICNpZmRlZikgb2s/
DQo+Pj4+Pj4+PiBJIHRoaW5rIHRoaXMgd291bGQgYmUgb2sgZnJvbSB0aGUgY2VydGlmaWNhdGlv
biBwb2ludCBvZiB2aWV3ICh0aGlzIHdvdWxkIGF0DQo+Pj4+Pj4+PiBsZWFzdCBtZWFucywgdGhh
dCB3ZSBhcmUgYXdhcmUgb2YgdGhlIGlzc3VlDQo+Pj4+Pj4+PiBhbmQgd2UgdG9vayBzb21lIHN0
ZXBzKS4gT3RoZXJ3aXNlLCBzdWNoIGNvZGUgaXMganVzdCBhbiBleGFtcGxlIG9mIGENCj4+Pj4+
Pj4+IGRlYWRjb2RlL3VucmVhY2hhYmxlIGNvZGUuDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBUaGFua3Mg
Zm9yIHRoZSBjbGFyaWZpY2F0aW9uLiBTbyB0aGUgZXhhY3QgYXBwcm9hY2ggd2lsbCBkZXBlbmQg
b24gdGhlDQo+Pj4+Pj4+IGNvbnRleHQuLi4uDQo+Pj4+Pj4+IA0KPj4+Pj4+Pj4+PiBUaGVyZSBh
cmUgZGlmZmVyZW50IHdheXMgdG8gZGVhbCB3aXRoIGEgZGVhZGNvZGU6ID4gMS4gR2V0IHJpZCBv
ZiBpdA0KPj4+Pj4+Pj4+PiBjb21wbGV0ZWx5DQo+Pj4+Pj4+Pj4+IDIuIExlYXZlIGl0IGFzIGl0
IGlzDQo+Pj4+Pj4+IA0KPj4+Pj4+PiAuLi4gdGhpcyBpcyBteSBwcmVmZXJlbmNlIGluIHRoZSBj
b250ZXh0IG9mIHRoZSB0aW1lci4NCj4+Pj4+PiANCj4+Pj4+PiBGcm9tIGEgY2VydGlmaWNhdGlv
biBwb2ludCBvZiB2aWV3LCB0aGUgZmV3ZXIgbGluZXMgb2YgY29kZSB0aGUgYmV0dGVyLA0KPj4+
Pj4+IGFuZCBpZGVhbGx5IGFsbCB0aGUgbGluZXMgb2YgY29kZSB1c2VkIGZvciB0aGUgY2VydGlm
aWVkIGJ1aWxkIHNob3VsZCBiZQ0KPj4+Pj4+IHRlc3RhYmxlIGFuZCB1c2VkLg0KPj4+Pj4+IA0K
Pj4+Pj4+IFNvIEkgdGhpbmsgMi4gaXMgdGhlIGxlc3QgdXNlZnVsIG9wdGlvbiBmcm9tIGEgY2Vy
dGlmaWNhdGlvbg0KPj4+Pj4+IHBlcnNwZWN0aXZlLiBGb3IgdGhpcyByZWFzb24sIEknZCBwcmVm
ZXIgYW5vdGhlciBhbHRlcm5hdGl2ZS4NCj4+Pj4+PiANCj4+Pj4+PiANCj4+Pj4+Pj4gSWYgdGhl
IG90aGVyIGRvbid0IGxpa2UgaXQsIHRoZW4gMSB3b3VsZCBiZSBteSBwcmVmZXJlbmNlLg0KPj4+
Pj4+PiANCj4+Pj4+Pj4gSW4gZ2VuZXJhbCwgbXkgcHJlZmVyZW5jZSB3b3VsZCBiZSBlaXRoZXIg
My4zIG9yIDMuMiAoc2VlIGJlbG93KS4NCj4+Pj4+PiANCj4+Pj4+PiBJIGFsc28gdGhpbmsgdGhh
dCAzLjIgYW5kIDMuMyBhcmUgZ29vZCBvcHRpb25zIGZvciB0aGUgZ2VuZXJhbCBjYXNlLiBGb3IN
Cj4+Pj4+PiB0aGUgdGltZXIsIEkgY2FuIHNlZSB3aHkgMSBpcyB5b3VyIChzZWNvbmQpIHByZWZl
cmVuY2UgYW5kIEkgYW0gZmluZQ0KPj4+Pj4+IHdpdGggMSBhcyB3ZWxsLg0KPj4+Pj4gT2ssIHNv
dW5kcyBnb29kIHRvIG1lLiBMZXQncyBzdGlsbCBnaXZlIEJlcnRyYW5kIHRoZSBjaGFuY2UgdG8g
c2hhcmUgaGlzIG9waW5pb24uDQo+Pj4+IA0KPj4+PiBXZSBuZWVkIHRvIGdldCByaWQgb2YgZGVh
ZCBjb2RlIGFuZCByZW1vdmluZyBpdCBpcyBub3QgYWx3YXlzIHRoZSBiZXN0IHNvbHV0aW9uLg0K
Pj4+PiANCj4+Pj4gSWYgdGhlIGNvZGUgaXMgb3IgY291bGQgYmUgdXNlZnVsIGZvciBzb21lb25l
IHNvbWUgZGF5LCBwcm90ZWN0aW5nIGl0IHdpdGggaWZkZWYgaXMgb2suDQo+Pj4+IA0KPj4+PiBJ
biB0aGUgbWlkIHRlcm0gd2Ugd2lsbCBoYXZlIHRvIGludHJvZHVjZSBhIGxvdCBtb3JlIGlmZGVm
IG9yIElTX0VOQUJMRUQgaW4gdGhlDQo+Pj4+IGNvZGUgc28gdGhhdCB3ZSBjYW4gY29tcGlsZSBv
dXQgd2hhdCB3ZSBkbyBub3QgbmVlZCBhbmQgY29kZSBub3QgYXBwbHlpbmcgdG8NCj4+Pj4gc29t
ZSBoYXJkd2FyZSBpcyBhIGNhc2Ugd2hlcmUgd2Ugd2lsbCBkbyB0aGF0IChkb2VzIG5vdCBtZWFu
IHRoYXQgYnkgZGVmYXVsdA0KPj4+PiB3ZSB3aWxsIG5vdCBjb21waWxlIGl0IGluIGJ1dCB3ZSB3
aWxsIG1ha2UgaXQgZWFzaWVyIHRvIHJlZHVjZSB0aGUgY29kZSBzaXplIGZvciBhDQo+Pj4+IHNw
ZWNpZmljIHVzZSBjYXNlKS4NCj4+Pj4gDQo+Pj4+IFNvIDMuMiBhbmQgMy4zIGFyZSBvayBmb3Ig
bWUuDQo+Pj4gDQo+Pj4gU28gd2UgYWxsIGFncmVlIHRoYXQgdGhlIGNvZGUgaW4gdGhlIGN1cnJl
bnQgZm9ybSBpcyBhIG5vIGdvIGZyb20gY2VydGlmaWNhdGlvbiBwdXJwb3Nlcy4NCj4+PiBUaGF0
IGlzIGdvb2QgOikNCj4+PiANCj4+PiBUaGUgcmVhc29uIHdoeSBJIG9wdCBmb3Igc29sdXRpb24g
MSBhbmQgbm90IHRoZSBvdGhlcnMgaXMgdGhhdCBpbiB0aGUgbGF0dGVyIGNhc2UgaXQgd291bGQN
Cj4+PiBtZWFuIGludHJvZHVjaW5nIHRoZSBLY29uZmlnIG9wdGlvbiB0byBhbGxvdyB1c2VyIHRv
IHNlbGVjdCB0aGUgdGltZXIgdG8gYmUgdXNlZCBieSBYZW4uDQo+Pj4gVGhpcyBpcyBub3QgcmVh
bGx5IGNvcnJlY3QuIEFsc28gaW4gdGhlIGN1cnJlbnQgZm9ybSwgaXQgd291bGQgYWxzbyByZXF1
aXJlIGFkZGluZyBtb3JlDQo+Pj4gY29kZSB0byB0aW1lLmMgY29kZSBiZWNhdXNlIGF0IHRoZSBt
b21lbnQgdXNpbmcgQ05UUCBmb3IgWGVuIHdvdWxkIG5vdCB3b3JrIG91dCBvZiB0aGUgYm94Lg0K
Pj4+IFRoZSBhcmNoaXRlY3R1cmUgZGVmaW5lcyB0aGUgaHlwZXJ2aXNvciB0aW1lciBmb3IgYSBw
dXJwb3NlLiBJZiBpdCBkb2VzIG5vdCB3b3JrLCBpdCBtZWFucw0KPj4+IHRoYXQgdGhlIEhXIGlz
IHByb2JsZW1hdGljLiBJIGFncmVlIHRoYXQgd2Ugd291bGQgd2FudCB0byBzdXBwb3J0IHN1Y2gg
dXNlIGNhc2UgYnV0IEknbSBub3QNCj4+PiByZWFsbHkgYXdhcmUgb2YgYW55IGlzc3VlIGxpa2Ug
dGhhdC4gQWRkaW5nIG1vcmUgY29kZSBhbmQgS2NvbmZpZyBvcHRpb25zIGp1c3QgYmVjYXVzZQ0K
Pj4+IG9uZSBkYXkgc29tZW9uZSBtYXkgZmFjZSBpc3N1ZXMgd2l0aCBhIG5ldyBIVyBpcyBzb21l
dGhpbmcgSSBhbSBub3QgYSBmYW4gb2YuDQo+PiANCj4+IEkgc2VlIDIgc29sdXRpb25zIGhlcmU6
DQo+PiAtIHNvbWVob3cgcHVzaCB0aGUgY29kZSB0byBhIGRpZmZlcmVudCBmaWxlIChub3QgcXVp
dGUgc3VyZSB0aGlzIGlzIGZlYXNpYmxlIGhlcmUpDQo+PiAtIHJlbW92ZSBjb21wbGV0ZWx5IHRo
ZSBjb2RlIHdpdGggYSBjbGVhbiBjb21taXQuIERvaW5nIHRoaXMgaXQgd2lsbCBiZSBlYXN5IGZv
ciBzb21lb25lIG5lZWRpbmcgdGhpcyB0byBsYXRlciByZXZlcnQgdGhlIHBhdGNoDQo+PiANCj4+
IEl0IGlzIGRlZmluaXRlbHkgdHJ1ZSBoZXJlIHRoYXQgYWRkaW5nIG1vcmUgY29kZSB0byBrZWVw
IHNvbWUgdW51c2VkIGNvZGUgZG9lcyBub3QgcmVhbGx5IG1ha2Ugc2Vuc2UuDQo+PiBBbmQgbGV0
4oCZcyBiZSByZWFsaXN0aWMgaGVyZSwgaWYgd2UgbmVlZCB0aGF0IG9uZSBkYXksIGl0IHdpbGwg
bm90IHRha2UgYWdlcyB0byBzdXBwb3J0IGl0IHNvbWVob3cuDQo+PiANCj4+IEFzIHNhaWQsIGZy
b20gYSBwdXJlIGNlcnRpZmljYXRpb24gcG9pbnQgb2YgdmlldzoNCj4+IC0gd2UgbXVzdCBub3Qg
aGF2ZSBkZWFkY29kZQ0KPj4gLSBwcm9wZXIgaWZkZWYgaXMgYWNjZXB0YWJsZQ0KPj4gLSBpZiAw
IGlzIG5vdCBhY2NlcHRhYmxlDQo+PiAtIGNvbW1lbnRlZCBjb2RlIGlzIG5vdCBhY2NlcHRhYmxl
DQo+IA0KPiBHaXZlbiB0aGF0IHdlIGFncmVlIG9uIHRoYXQgKCsgSVNfRU5BQkxFRCBvcHRpb24g
aWYgcG9zc2libGUpLCBhbmQgdGhlIG9wdGlvbiAxIHNlZW1zDQo+IHRvIGJlIHRoZSBiZXN0IGNo
b2ljZSBmb3IgdGhlIHRpbWVyLCBJIHdpbGwgY3JlYXRlIGEgcGF0Y2ggcmVtb3ZpbmcgdGhlIElS
USBwYXRoIHRvIGdldCByaWQNCj4gb2YgdGhlIGRlYWRjb2RlL3VucmVhY2hhYmxlIGNvZGUuDQo+
IA0KPiBEbyB5b3UgdGhpbmsgdGhpcyBpcyBzb21ldGhpbmcgd2Ugd2FudCBmb3IgNC4xNz8NCj4g
VGhlIHJpc2sgaXMgbG93IGFzIHRoZSBjb2RlIGlzIGFscmVhZHkgZGVhZCBhbmQgdGhlIGJlbmVm
aXQgaXMgdGhhdCB3ZSBoYXZlIG5vIGRlYWRjb2RlLg0KPiBXaGF0IGRvIHlvdSB0aGluaz8NCj4g
DQoNCldlIGFyZSB2ZXJ5IG5lYXIgZnJvbSB0aGUgcmVsZWFzZSBzbyBmcm9tIG15IHBvaW50IG9m
IHZpZXcgYXMgaXQgaXMgbm90IHNvbHZpbmcgYSBidWcsIHRoaXMgc2hvdWxkIG5vdCBnbyBpbnRv
IDQuMTcuDQoNCkJlcnRyYW5kDQoNCj4gfk1pY2hhbA0KDQo=

