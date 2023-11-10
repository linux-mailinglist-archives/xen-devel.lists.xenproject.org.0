Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0387E7B00
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 10:41:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630065.982746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1O0A-0001yE-Lf; Fri, 10 Nov 2023 09:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630065.982746; Fri, 10 Nov 2023 09:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1O0A-0001wZ-Ir; Fri, 10 Nov 2023 09:40:34 +0000
Received: by outflank-mailman (input) for mailman id 630065;
 Fri, 10 Nov 2023 09:40:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVdC=GX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r1O09-0001wP-2y
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 09:40:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30bc0de2-7fad-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 10:40:32 +0100 (CET)
Received: from AM9P193CA0029.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::34)
 by DB9PR08MB9609.eurprd08.prod.outlook.com (2603:10a6:10:456::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 09:40:29 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:20b:21e:cafe::eb) by AM9P193CA0029.outlook.office365.com
 (2603:10a6:20b:21e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Fri, 10 Nov 2023 09:40:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Fri, 10 Nov 2023 09:40:28 +0000
Received: ("Tessian outbound 5d213238733f:v228");
 Fri, 10 Nov 2023 09:40:28 +0000
Received: from c8489abf9ac9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 05168C9F-F001-4948-A265-8F81D0D795FA.1; 
 Fri, 10 Nov 2023 09:40:21 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c8489abf9ac9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Nov 2023 09:40:21 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DBAPR08MB5749.eurprd08.prod.outlook.com (2603:10a6:10:1af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 09:40:17 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::f6b:d51:7aa3:ad16]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::f6b:d51:7aa3:ad16%6]) with mapi id 15.20.6977.019; Fri, 10 Nov 2023
 09:40:17 +0000
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
X-Inumbo-ID: 30bc0de2-7fad-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aq2l+IF6edK7ofn3k24soZav3WcqE1/vS+R3Xq04CygGacEM9G3+fMaO69705QheFiQQuabwtHZ5+w2cwmIPUQYa8SQMO/WkQCv6OXSQ7Rg2kP+mbOo9NVAMc7JupTl4a3r6CVJBpLuzN3je1kInGPDNZq0X4jUnAWRTBCZVok+ySYhFyEBcQL6e3jV8wHAyyKSFxRg4014MzXdcLwIHARS7vDSkAYqICNY+3zKc+spgcW2QT/VxTICbp+J/pCf8v0go21JFPGAbzJEh1LRuqk6irvFaTnFUD3/leHnO7+sEbtaY5KpfwKyNSyYSB54dqOnDPQBKHK1YkQO1ZUJK0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49iWbs0oTofh0qgWuQtE0ROcS+N2iYb2ciHgBI9nlY4=;
 b=GeGkT+DurCGi03bKi8oYFKUp5w3cCcGTI7QEthYz9o2RtsLUGYuiZTNSBIVUBJ2DD9J18TO7xUi36jt74pBjECcu3+oqQLI7ud3ZsTPflPWnZb/m7tXQrXyvyG751wIjrYirolMA4cHwbKRCZmfUQpdrb1KFOKHaRVB1nBk/238whl4S4ZBL/CknZAIg+7ANSdM9WkvKIEDoFaH5FDilT4QIpVja5Nbct7ZzfX6LMIeQr5U8EhzErwVP1332kl1UO89hT6b/aQuX8xPhnBZn/6L/HGchtPDRgW3QrF+5t+G092hwaYQtoucboCImq5yXBOqR8XWsI/zQgIG67H7AlQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49iWbs0oTofh0qgWuQtE0ROcS+N2iYb2ciHgBI9nlY4=;
 b=6QEaJiEjB9HKtlDh2fckN0jgHCQQdmEk85s3v6iZ2GWav+gbCuuGTq3lEmLae2zRZcR09gGNZassCPEOAoLhxxT321LohcR9FkFi3JlvhZKG92WS5End9mfxe9h1I2ttNDg/XM4ZOJ2/8INBq0cWZRGrED3TqRJoe4Wa7RN2jpU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3bda914360d12bda
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nV/a2u5nXa8jDLStHLR81kpqOJUPVhkzp3ge+4g+CUUjHaW+BPaYpXRJBoAIpB7U0kOzXP/dDBo2/V3aFBKE8a6UwivQC3zlTXNigGrIa0RgDiAhV/umHlFWaUdSwcCREp5PjUflb1ofc/Jq2zipspj+Gda8nKkb/4uCj3K2V16uphuH33HOZmDC1YPpYi4zq44Ol8bsxDzpylBa5NeDjYbN5jtufW4KFKgxXsBl+1zQ42WAqj+xcy7q+K2H1NhKVaqlJDO1Qr0MnuCmTu2JDYntWLHr0gNI+PMH2XnI79TdqB2AbkXiEVnvNhFhIQXEE8a43heO9HZhbvBV43cueg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49iWbs0oTofh0qgWuQtE0ROcS+N2iYb2ciHgBI9nlY4=;
 b=mOLbumZCJrwWHCEAkFtY4Jkkm9KuaPWwhlfOYMiB82gZVFh47tFg76Q4ULFQP18O8h6TC8Bedoj1daUYkDYmycX35XluHPYRXddPZdGYvDXNvR+dX/PtV1T/7AS4xxTjziSPNLz68OH4bYZvLWtKHYQXcGHQyYzhPMEFPYrNIaPs7X+0Y/Ttt8XxRbDbh7JZu08rDU5YpJYtxogldSjR+LDKZ9NBwlkz47BTK9KFxMaqqFg7m4MYbofl3mkZdw6WhbFol9/QgY5KzN2Ienp5I7pSb3qK6WKFhmDvmrJR/lDaefVn/NSS2Q+YcwJBdRs/TX3iTGIIS8rorqApUq6A8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49iWbs0oTofh0qgWuQtE0ROcS+N2iYb2ciHgBI9nlY4=;
 b=6QEaJiEjB9HKtlDh2fckN0jgHCQQdmEk85s3v6iZ2GWav+gbCuuGTq3lEmLae2zRZcR09gGNZassCPEOAoLhxxT321LohcR9FkFi3JlvhZKG92WS5End9mfxe9h1I2ttNDg/XM4ZOJ2/8INBq0cWZRGrED3TqRJoe4Wa7RN2jpU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 5/5] arm/dom0less: introduce Kconfig for dom0less
 feature
Thread-Topic: [PATCH v3 5/5] arm/dom0less: introduce Kconfig for dom0less
 feature
Thread-Index: AQHaEuwVAcRvSKcty0WG4JBMWUF0b7BzQ0WAgAABDgCAAAbKAIAAAmwAgAAAZoA=
Date: Fri, 10 Nov 2023 09:40:17 +0000
Message-ID: <38A4D95A-E8E4-478C-A072-3BF1C46D3A9C@arm.com>
References: <20231109090615.3878767-1-luca.fancellu@arm.com>
 <20231109090615.3878767-6-luca.fancellu@arm.com>
 <43a1c5c8-6243-4912-bf3f-f3e35b504271@amd.com>
 <9FE35A69-2EEF-4098-8F9E-B373D813AB47@arm.com>
 <3BB52078-B58C-4476-867A-B29438C56487@arm.com>
 <4f381355-9de7-4e7f-8345-512be34aaa02@amd.com>
In-Reply-To: <4f381355-9de7-4e7f-8345-512be34aaa02@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DBAPR08MB5749:EE_|AMS0EPF000001AB:EE_|DB9PR08MB9609:EE_
X-MS-Office365-Filtering-Correlation-Id: 25961a4b-df5b-44af-c783-08dbe1d1130e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 aRzO3HkWKjzlaCFs++/Mg1299LrMj0jD6nACCPi3apFrsSRdAx+MKvE2qrMVpFMUAFU3/2NLmpkRRvmLGORXe0N0i+VPr/9cJ7ckxZoKvfyzfYzXC1UH3nCEgUDmuHtrmlCfKQTrmO5gPKGiCJHL1H+5qVrR+o3ijM7wNf18swL99fPDV6QbMwSSFVjWpUPJn3pJtOoB6gH/Z8jdBSMHGjRMtMWwfinfrlb8lDHqgtn21grkJnfTlDgLXijohOqIgiHFD51i/y6N3IPwVoCSQLZT0UGgtxycXMSy+Awgx0q9qztFdS8KrMT8JjHgdsiXR35kzbS8J5goVkAzxsvKPpX3Pr18RJ3JHVzfp+V04HEbZcRHJF/ycnxa7QTPZpMaMx9UCU3mf/bsu0qcbw7mFEGtTwnMje5tXTFLAIqBKZEgmPw4ZZAep9TJO4rljCZJ6Oiwkrdhn1fq8unjZRBYCJprRtxprBV1XPk4A7p6cw4V9SWzsatnJplRd6ks1/3rKU7NB69TIDk65fKiqgKqSYXYMlmobIVSEX2WG2OrYveGEX1tiw+vIHmYPAXHIhm5qMZDgsIMS8tdZlBr9kSwXBUekT063bMYrdZHJcIMJhYw1E7gC1mb63S7BrSALPsBmNCw0/LPAN/b9Uo/0XM/YfnfopId/yTkXIWqpXXj5UY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(376002)(39850400004)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(2906002)(6916009)(6512007)(2616005)(66946007)(6486002)(4326008)(41300700001)(54906003)(5660300002)(8936002)(8676002)(86362001)(38100700002)(66476007)(66556008)(26005)(91956017)(76116006)(66446008)(64756008)(83380400001)(316002)(122000001)(478600001)(33656002)(53546011)(36756003)(38070700009)(6506007)(71200400001)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3780B6BF21AA24EB845C0A4562FC0E3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5749
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b92466b3-c24f-4e42-0a39-08dbe1d10c61
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DHtm69In4ud8MV9ffNfMczql9Y+t9gxBtHKjCXkJ3sLJ0GAAVtpXtVc8Zum6hxsfoWvJsT0Fe2KAr8QYikxAJxxYUbnEerwsUR3eqZ6WIzEfz/SThqyh97MFTnaNSFMfoiCxm7papBmn14lEUaqmA0cXIo2YC1lFEBcjWjIjP1JDrXmdah7+ALEhxalGjK+ovuAr7b228uz7YsaLSyXMZ7CVOhgVvvCn//bBpXtTGzJuxQXFhk6IOZMHo6x8R7DJOjX+cWVfB2kx6RX264OSJGZ5ClL1lvo2ny0vnxFOrIyLogysWK0sCeiD80GVgsVpy380/UinCjk+Q4GT/ucobOwFr+y+ox7zXjLC57Nrr2f384rzDuHNCSk4H2DqHIMAVb8qdwTZVWouagMKLXbL+8ovOHi4qq5598G1hXJP/7/uoR7ssHaBK8jSb11YQbMUZMtmzHKC3DJiXM0vcLfDRZWhLuXoTpUT7HVGiYV0ug/sOuf+A/NpOa5sc/KfZ0XNeNcEW4YbOtJDQb5bknI8qx6lF2+5uow0Bvh3y5DlxZxMgqArvZbgxiNJZ3VnVHdDxv2f4FRZpAXY/hRKu7qFQl9Ao2dFjgijHvHJsiDaMFBU23O9xkVkXdX8yCwFZ2Yn0uyYPaxWykf8Fd2F4NUZv8QuQrlh/btVXg7CcNThL6VfIihjVPmZlk7IiV1oNnNzt7Fl/RgjeC+50+vL3cEHzaV5UzTVsPOupDKPB8GDCwY1KU/RPR+zG5b9AkdA1BNyOzWJOp8cFv9SCv1HClY2NQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(82310400011)(46966006)(36840700001)(40470700004)(40480700001)(40460700003)(478600001)(6506007)(6512007)(6486002)(2616005)(53546011)(36860700001)(356005)(33656002)(36756003)(81166007)(86362001)(82740400003)(54906003)(70206006)(47076005)(8936002)(70586007)(41300700001)(5660300002)(26005)(83380400001)(2906002)(336012)(107886003)(8676002)(316002)(4326008)(6862004)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 09:40:28.6582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25961a4b-df5b-44af-c783-08dbe1d1130e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9609

DQoNCj4gT24gMTAgTm92IDIwMjMsIGF0IDA5OjM4LCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnpl
bEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gMTAvMTEvMjAyMyAxMDozMCwg
THVjYSBGYW5jZWxsdSB3cm90ZToNCj4+IA0KPj4gDQo+Pj4gT24gMTAgTm92IDIwMjMsIGF0IDA5
OjA1LCBMdWNhIEZhbmNlbGx1IDxMdWNhLkZhbmNlbGx1QGFybS5jb20+IHdyb3RlOg0KPj4+IA0K
Pj4+IEhpIE1pY2hhbCwNCj4+PiANCj4+Pj4+IA0KPj4+Pj4gK2NvbmZpZyBET00wTEVTU19CT09U
DQo+Pj4+PiArICAgICAgIGJvb2wgIkRvbTBsZXNzIGJvb3Qgc3VwcG9ydCIgaWYgRVhQRVJUDQo+
Pj4+PiArICAgICAgIGRlcGVuZHMgb24gQVJNDQo+Pj4+IFlvdSdyZSBpbiB0aGUgQXJtIEtjb25m
aWcsIHNvIHRoZXJlIHNob3VsZCBiZSBubyBuZWVkIGZvciB0aGlzIGRlcGVuZGVuY3kgKGl0IGlz
IGltcGxpY2l0KS4NCj4+Pj4gDQo+Pj4+IEFwYXJ0IGZyb20gdGhhdCwgd2UgaGF2ZSAyIGZlYXR1
cmVzOiBzdGF0aWMgbWVtIGFuZCBzdGF0aWMgc2htZW0gdGhhdCBhcmUgb25seSBtZWFudCBmb3Ig
ZG9tMGxlc3MgZG9tVXMuDQo+Pj4+IFNob3VsZG4ndCB3ZSBtYWtlIHRoZW0gZGVwZW5kZW50IG9u
IERPTTBMRVNTX0JPT1Q/IE90aGVyd2lzZSwgd2hhdCBpcyB0aGUgcHVycG9zZSBvZiBzZWxlY3Rp
bmcgdGhlbQ0KPj4+PiB3aXRoIERPTTBMRVNTX0JPT1Q9bj8NCj4+PiANCj4+PiBTdXJlLCBJ4oCZ
bGwgYWRkIHRoZSBkZXBlbmRlbmNpZXMgYW5kIHJlbW92ZSB0aGUgQVJNIG9uZQ0KPj4gDQo+PiBK
dXN0IHRvIGJlIHN1cmUsIGlzIGl0IHdoYXQgeW91IGFyZSBhc2tpbmc/DQo+IFNlZSBiZWxvdw0K
PiANCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9LY29uZmlnIGIveGVuL2FyY2gv
YXJtL0tjb25maWcNCj4+IGluZGV4IDAzOTlmMmZhZjczNC4uZDljNTM0MGZmM2EyIDEwMDY0NA0K
Pj4gLS0tIGEveGVuL2FyY2gvYXJtL0tjb25maWcNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9LY29u
ZmlnDQo+PiBAQCAtOTAsNyArOTAsNiBAQCBjb25maWcgR0lDVjINCj4+IA0KPj4gY29uZmlnIERP
TTBMRVNTX0JPT1QNCj4+ICAgICAgICBib29sICJEb20wbGVzcyBib290IHN1cHBvcnQiIGlmIEVY
UEVSVA0KPj4gLSAgICAgICBkZXBlbmRzIG9uIEFSTQ0KPj4gICAgICAgIGRlZmF1bHQgeQ0KPj4g
ICAgICAgIGhlbHANCj4+ICAgICAgICAgIERvbTBsZXNzIGJvb3Qgc3VwcG9ydCBlbmFibGVzIFhl
biB0byBjcmVhdGUgYW5kIHN0YXJ0IGRvbVUgZ3Vlc3RzIGR1cmluZw0KPj4gQEAgLTIxNCw3ICsy
MTMsNyBAQCBzb3VyY2UgImFyY2gvYXJtL3RlZS9LY29uZmlnIg0KPj4gDQo+PiBjb25maWcgU1RB
VElDX1NITQ0KPj4gICAgICAgIGJvb2wgIlN0YXRpY2FsbHkgc2hhcmVkIG1lbW9yeSBvbiBhIGRv
bTBsZXNzIHN5c3RlbSIgaWYgVU5TVVBQT1JURUQNCj4+IC0gICAgICAgZGVwZW5kcyBvbiBTVEFU
SUNfTUVNT1JZDQo+PiArICAgICAgIGRlcGVuZHMgb24gU1RBVElDX01FTU9SWSAmJiBET00wTEVT
U19CT09UDQo+IG5vIG5lZWQgZm9yICYmIERPTTBMRVNTX0JPT1QNCg0KVGhhbmtzLCB5ZXMgSSB3
YXMgdW5zdXJlIGFib3V0IHRoYXQgaW5kZWVkDQoNCj4gDQo+PiAgICAgICAgaGVscA0KPj4gICAg
ICAgICAgVGhpcyBvcHRpb24gZW5hYmxlcyBzdGF0aWNhbGx5IHNoYXJlZCBtZW1vcnkgb24gYSBk
b20wbGVzcyBzeXN0ZW0uDQo+PiANCj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL0tjb25maWcg
Yi94ZW4vY29tbW9uL0tjb25maWcNCj4+IGluZGV4IDRkNmZlMDUxNjQxZC4uZTBlNWY0NDg1ZDFm
IDEwMDY0NA0KPj4gLS0tIGEveGVuL2NvbW1vbi9LY29uZmlnDQo+PiArKysgYi94ZW4vY29tbW9u
L0tjb25maWcNCj4+IEBAIC0xMDAsNyArMTAwLDcgQEAgY29uZmlnIE5VTUENCj4+IA0KPj4gY29u
ZmlnIFNUQVRJQ19NRU1PUlkNCj4+ICAgICAgICBib29sICJTdGF0aWMgQWxsb2NhdGlvbiBTdXBw
b3J0IChVTlNVUFBPUlRFRCkiIGlmIFVOU1VQUE9SVEVEDQo+PiAtICAgICAgIGRlcGVuZHMgb24g
QVJNDQo+PiArICAgICAgIGRlcGVuZHMgb24gQVJNICYmIERPTTBMRVNTX0JPT1QNCj4gbm8gbmVl
ZCBmb3IgQVJNLiBET00wTEVTU19CT09UIGFscmVhZHkgZGVwZW5kcyBvbiBBUk0uDQoNCk9rLCBJ
4oCZbGwgdXBkYXRlIGl0DQoNCj4gDQo+IH5NaWNoYWwNCj4gDQoNCg==

