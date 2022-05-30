Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F00E537C9E
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 15:35:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338574.563363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvfYK-0003cO-0S; Mon, 30 May 2022 13:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338574.563363; Mon, 30 May 2022 13:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvfYJ-0003a5-Ta; Mon, 30 May 2022 13:35:23 +0000
Received: by outflank-mailman (input) for mailman id 338574;
 Mon, 30 May 2022 13:35:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zbnX=WG=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nvfYI-0003Zy-74
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 13:35:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7d00::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59eef907-e01d-11ec-837f-e5687231ffcc;
 Mon, 30 May 2022 15:35:21 +0200 (CEST)
Received: from DB6PR0601CA0039.eurprd06.prod.outlook.com (2603:10a6:4:17::25)
 by DU0PR08MB8137.eurprd08.prod.outlook.com (2603:10a6:10:3ec::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.18; Mon, 30 May
 2022 13:35:11 +0000
Received: from DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::8a) by DB6PR0601CA0039.outlook.office365.com
 (2603:10a6:4:17::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Mon, 30 May 2022 13:35:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT025.mail.protection.outlook.com (100.127.142.226) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13 via Frontend Transport; Mon, 30 May 2022 13:35:11 +0000
Received: ("Tessian outbound d3318d0cda7b:v120");
 Mon, 30 May 2022 13:35:11 +0000
Received: from de056ea01835.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7FB4741A-1A7F-4E96-AF9C-7EE616CFE2BE.1; 
 Mon, 30 May 2022 13:35:04 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de056ea01835.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 30 May 2022 13:35:04 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB7PR08MB3372.eurprd08.prod.outlook.com (2603:10a6:10:4f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 13:35:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 13:35:02 +0000
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
X-Inumbo-ID: 59eef907-e01d-11ec-837f-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gXMBOZhs9dKS5fJNXRsW2X+N/+OngxRIwqUDt1jxJbjCcHF2Mr2m47O6U76EpjkdsABdAp3hamHy7w0jJHZndWhjwjiu/PYfSQFS+7JPqmA4LbkOGwl0DgSqOcqJhIt26Ts/Ulx8ZB+umY5YBPp4psjG6KdctPu83K4A29Cyifz/cDmAWIbkQy9n2GDlq4apRn4yMQi5ax+/M97CaPSufV1hxiPu+UWYfuKVS/PDP1lzU1sg5rST5/S+V3dITbTfl5QD7ZuCTql1YT4as3D+qo+YGOCkWDCGmNLQ+wZjh4tnfB5KXirkEeT7XQXXUDuEekgZb6nE57OQntjayQxe8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9H14ODKESzObRYbib1NHPXEfCCsVmJYuV9g5hRVU8Q=;
 b=X2E6xOJHwhMjhh1OB1ZM5y91EVjkO+Z4toBhS7GItxem+WJqDjOcj3NyhqXZPlYcU9X/zRIEpNq/u+w63+OFQ2n1bYFBYQb5LFEkrFiwZyYoHFCWGi2GdA7mJJCdv2+5BnDsk8jhIMiBH47WP9ProqQ34aX7L6I3DHHuChJ3PPqJfzFeCcOLVeKhomkeQG7jXpRNuXh+/U5qZP6zrcaqw5Ap1SVbKZxwcACLoPfT92HtEXp8CorQ+t7a+ixZBBBeYFWD9mgfWdb/Vgatfi79hSrWekYqd31RdloF+BnMbVkD6WQZjHLN2Byrklh1UdbxOhmXoFfoHVU/o6p7UMFAaQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9H14ODKESzObRYbib1NHPXEfCCsVmJYuV9g5hRVU8Q=;
 b=z005+Us4UxnF16qcxFX9UguVvYZWg7yZGhWQzj6yZHZMD3mVyeTIUzQgB6OxI18szOSa2DVKWOQOwQJj3X+IFVcLi3d6MPwzuxa2w4fnC1iLp+N5d+d0Zcjc+eQ5l0GAVNv5vKZ5K+9njTqVw7H+NeyYPw/Izyfjx8dQKgbsW6Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d7ae9bbe2e614c85
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEUM5KZzbuqymaA+aghRdguDkkYq/HNMy3qp8ubU4eyNQv2S97/lsPDaN9ZrJJtic1veMwtzpS0mPBnUxmUFtZ7gHY/uDnsVEdIRov5RTtGZSkQuYupPCxjXVtVnOcAd8Ox6cA05WJsnEHdFmpWaog6QQH5MITOArZMwRy+D/APLdIbIOCk68kCn8o1389xfPm7HGUf1fY9TmpiYlL0Xsrd7UyFX0CobF8uB0DU0OdTYxqNEirznacjM42Oip29yL55/j0m0JS3PM6lfqkQNdNyJ/0ar9XbcFUVKjICO0kDKsmE3qASn/ZgEPaO19e4HjJIEGj+JiRqHnJ0Jz+83ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9H14ODKESzObRYbib1NHPXEfCCsVmJYuV9g5hRVU8Q=;
 b=dSyYpJkYqcd0prjXqtO6SdfgQWFHVAnMiBwNm3ek6zZklBPdRxcMy9OE83dcxjV6rVs7UVpRUyaWPtpGCM15g3xcYRZtt95/OZhc2MaY1/uFLySRG47fzIUeacbB8MQmKa4obd3R/1BARz1220XD73wzdzSsp9JGBjOUp/UiGv1wRIP5Vwzz0TdaXsnVObFS0/JCkAzHwQ3vd++MAjHUVZj9rLq/pFIZ+N9qwcSYvCWH5yt4x33kTzMYHckBlxecfdqW2gwqfZ4ZT9lqNZVFOdroC4p59aSLZZDRRNoTTQ9moqj3/MFZjMopG2dcUeStUz+DcHKvFmWwB27i1/Vs9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9H14ODKESzObRYbib1NHPXEfCCsVmJYuV9g5hRVU8Q=;
 b=z005+Us4UxnF16qcxFX9UguVvYZWg7yZGhWQzj6yZHZMD3mVyeTIUzQgB6OxI18szOSa2DVKWOQOwQJj3X+IFVcLi3d6MPwzuxa2w4fnC1iLp+N5d+d0Zcjc+eQ5l0GAVNv5vKZ5K+9njTqVw7H+NeyYPw/Izyfjx8dQKgbsW6Y=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: George Dunlap <george.dunlap@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] docs/misra: introduce rules.rst
Thread-Topic: [PATCH 1/2] docs/misra: introduce rules.rst
Thread-Index:
 AQHYb89Ql1y5oYxB8EW1dQIiqL2u/a0vNXYAgAEjhQCAAJGbAIAAAxAAgAAFpwCAAC97AIAAc0MAgAC4OQCAARHVgIADyvaAgAABVgCAAALZAIAAAdqAgAACLACAAAPcAIAAB2OAgAA1/YA=
Date: Mon, 30 May 2022 13:35:02 +0000
Message-ID: <138D3C39-74A6-46CB-B598-2FC5FAD1E52D@arm.com>
References:
 <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
 <20220525003505.304617-1-sstabellini@kernel.org>
 <a19d22ca-33ef-b348-ac88-490010464bad@xen.org>
 <alpine.DEB.2.22.394.2205251740280.1905099@ubuntu-linux-20-04-desktop>
 <0cf7383d-896e-76f0-b1cc-2f20bd7f368e@suse.com>
 <D9A44AC3-A959-442F-A94C-C9EFB359BEF1@arm.com>
 <da68ca4d-3498-ec6a-7a5d-040f23dd41a6@suse.com>
 <765738F2-97E9-40EF-A50E-2912C7D2A286@arm.com>
 <alpine.DEB.2.22.394.2205261233000.1905099@ubuntu-linux-20-04-desktop>
 <c0b481fb-5172-3515-764f-dba9f906c049@suse.com>
 <alpine.DEB.2.22.394.2205271602320.1905099@ubuntu-linux-20-04-desktop>
 <3882cc86-72a7-8e19-5f7b-b1cc89cce02e@xen.org>
 <5b790260-dd5c-9f62-7151-7684a0dc18fa@suse.com>
 <0cc9c342-f355-5816-09e9-a996624c6a79@xen.org>
 <6d6115a9-2810-0c9b-bba3-968b3ac50110@suse.com>
 <d4c6aa78-cc94-274c-db05-c62ff0badc9d@xen.org>
 <dcafd462-f912-8c59-f1bf-32f65ae45fd4@suse.com>
 <A7121189-9A68-41C6-A8EF-D823A0BBF4FF@citrix.com>
In-Reply-To: <A7121189-9A68-41C6-A8EF-D823A0BBF4FF@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e46885d1-fbd2-4a23-9348-08da4241387c
x-ms-traffictypediagnostic:
	DB7PR08MB3372:EE_|DBAEUR03FT025:EE_|DU0PR08MB8137:EE_
X-Microsoft-Antispam-PRVS:
	<DU0PR08MB8137D5E0AB163B49293B1B8C9DDD9@DU0PR08MB8137.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dngJxvO4qmDf/P8Wa8vtVbgXyUWbCisXbXcOMfjGe7yjsMSyp78dgs1JSXzwHEUl8TzuOUg02kKrItALB8xjrb2/tkAHATjNfQF3+9cOFU6HZJLZ9Jf9Zb4SHJLR56TldLvLXLuTO4kUfbT0H3vM5d9xaQlCC2y2tCFPxhTAD9/8tXTnRMSX2sIDKI1PrkfDw0siCjwwEBytY2W4ObcQA/5Wxd0bAqZweXevpUzA1BzYt+K5w5TX2T2xGOwxcF36hxrH3fNIDWz2G8ISLDUNKBa72/ZNgwBlChl9MLgg3F287r9D4Sbc9wsYbr5WT5SBTotO8j4KLBF3XoFv9YEfzagPYXSY33IvDjLVMBuG9av5HniXKI6lIUpxfWi8JiAygtR1kYmLNCObwo5ix4bVY5t9ia/O2Op9ORltsQxhVcew5zVB79nCVIXdz8K3yEefhgh63IH2PEXgqFF3f6iKni+nZzP4f+heGBUWfr3nQnd5iaFFvfyUIZi2NkbY27fgQyqgq0CDRv9yBfDSmo4m+ls2wbWYy3boNUsLwMlulphAQBSPtNCqE/Tzs5PGTVso9NfA7w9CtRpLxN4z4unGd98D1pXEdYprVt99sn0PTX85LpVzNnthp1M9QyS/06obUcX1ESSN1Ad4dHUrBLTBjzZwHtKqnK7kYc63vcCVw6JdN2FpOK5EDPmYmCgMhqdya0SdWpm4uzavWzx/PZG7rpFqf98TN693fzK64syqNpg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(6486002)(5660300002)(33656002)(8936002)(508600001)(6506007)(86362001)(26005)(6512007)(2906002)(122000001)(66556008)(2616005)(66946007)(64756008)(38100700002)(186003)(83380400001)(38070700005)(8676002)(4326008)(316002)(36756003)(6916009)(54906003)(66446008)(76116006)(91956017)(71200400001)(66476007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0D7BD255760FE4EB0651CBE80788DC1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3372
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	347f028b-783e-406a-d3b3-08da4241335e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0gBy8ie1cSycFtH4KFNHFYwS/L1GEKqkWNzElYgHo6Vd45ws82WrNnDmkmrO2qkHXyuOUtQEsii/3KmDmsrAmX6f+ZR3BEyxU8CcTVLztFyBKiLizT6BaowbzGaTcC4+UhPgQpDiXLpMBMQE8o+f7uBw33vLAmj0CzlrzEVEhda65z2JP/R9kO161YjPPYP66594YqnSl/6kbb65eaWqlXvsL0eEBStEfKVJ2e4GuvKWfbvCcmwZqCA45qstp8BB7DWDCR4yD/trI/UgHafQ68LWNHrV7+4aeWUeuVaSBTOiV4KYFEzlw2wziNIJA+Psi2MC7uNFtY4Qw/YhpLlTywu83XgpfP3rQ8e3SXVtR3uw/ZaAqtXpC/atqZTI90MdJ1ju5IDUiAq5c+Xxf/j+fbxKJunIxKfr/4/QDnEP/4MM6aIkuN729e/uaMVbTASo0JddPQnPEbw2HQ+C7v6+KEfEJ21LUl1u5Ayj0MfTGUXDv3Pb+5M3x5RWNi3AuQ7XPSCp27HzgbRohzCQE8C6OMYGRjwuaCZgT/3MjGS4RGEs8LIfN7lmE7LfHmtrfqOci8WlN5MR1dmPnxeNKUP0F3ZsfubUsZoClcb1cDlrvphkuH8sw6OV0rm4QOMzo4yqP7iCpvNxWVOa9CHuixHTl1wxbu0ttNhQ4WPe6efTx2YijFZfZqT4N4aeF65ERhaL
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(81166007)(26005)(6506007)(53546011)(2616005)(107886003)(83380400001)(6512007)(33656002)(36756003)(5660300002)(82310400005)(2906002)(8936002)(6862004)(8676002)(4326008)(70206006)(54906003)(70586007)(356005)(86362001)(186003)(36860700001)(47076005)(336012)(6486002)(508600001)(40460700003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 13:35:11.4342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e46885d1-fbd2-4a23-9348-08da4241387c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8137

SGksDQoNCj4gT24gMzAgTWF5IDIwMjIsIGF0IDExOjIxLCBHZW9yZ2UgRHVubGFwIDxnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gMzAgTWF5IDIwMjIs
IGF0IDEwOjU1LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4gDQo+
PiBPbiAzMC4wNS4yMDIyIDExOjQxLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4gDQo+Pj4gDQo+
Pj4gT24gMzAvMDUvMjAyMiAxMDozMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDMwLjA1
LjIwMjIgMTE6MjcsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+IEhpLA0KPj4+Pj4gDQo+Pj4+
PiBPbiAzMC8wNS8yMDIyIDEwOjE2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+PiBPbiAzMC4w
NS4yMDIyIDExOjEyLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+Pj4+IE9uIDI4LzA1LzIwMjIg
MDA6MTYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+Pj4+Pj4+ICIiIg0KPj4+Pj4+Pj4g
SXQgaXMgcG9zc2libGUgdGhhdCBpbiBzcGVjaWZpYyBjaXJjdW1zdGFuY2VzIGl0IGlzIGJlc3Qg
bm90IHRvIGZvbGxvdyBhDQo+Pj4+Pj4+PiBydWxlIGJlY2F1c2UgaXQgaXMgbm90IHBvc3NpYmxl
IG9yIGJlY2F1c2UgdGhlIGFsdGVybmF0aXZlIGxlYWRzIHRvDQo+Pj4+Pj4+PiBiZXR0ZXIgY29k
ZSBxdWFsaXR5LiBUaG9zZSBjYXNlcyBhcmUgY2FsbGVkICJkZXZpYXRpb25zIi4gVGhleSBhcmUN
Cj4+Pj4+Pj4+IHBlcm1pc3NpYmxlIGFzIGxvbmcgYXMgdGhleSBhcmUgZG9jdW1lbnRlZCwgZWl0
aGVyIGFzIGFuIGluLWNvZGUgY29tbWVudA0KPj4+Pj4+Pj4gb3IgYXMgcGFydCBvZiB0aGUgY29t
bWl0IG1lc3NhZ2UuIE90aGVyIGRvY3VtZW50YXRpb24gbWVjaGFuaXNtcyBhcmUNCj4+Pj4+Pj4g
DQo+Pj4+Pj4+IEkgd291bGQgZHJvcCB0aGUgImFzIHBhcnQgb2YgdGhlIGNvbW1pdCBtZXNzYWdl
IiBiZWNhdXNlIGl0IGlzIGEgbG90DQo+Pj4+Pj4+IG1vcmUgZGlmZmljdWx0IHRvIGFzc29jaWF0
ZSB0aGUgZGV2aWF0aW9uIHdpdGggYSByYXRpb25hbGUgKHRoZSBjb2RlIG1heQ0KPj4+Pj4+PiBo
YXZlIGJlZW4gbW92ZWQgYW5kIHlvdSB3b3VsZCBuZWVkIHRvIGdvIHRocm91Z2ggdGhlIGhpc3Rv
cnkpLg0KPj4+Pj4+IA0KPj4+Pj4+IEJ1dCB0aGlzIHdhcyBhZGRlZCBpbiByZXNwb25zZSB0byBt
ZSBwb2ludGluZyBvdXQgdGhhdCBjb2RlIGNvbW1lbnRzDQo+Pj4+Pj4gYXJlbid0IHN0YW5kYXJk
aXplZCB5ZXQgYXMgdG8gdGhlaXIgZm9ybWF0LiBUaGUgYWx0ZXJuYXRpdmUsIGFzIHNhaWQNCj4+
Pj4+PiBiZWZvcmUsIHdvdWxkIGJlIHRvIGNvbWUgdXAgd2l0aCBhIHNjaGVtZSBmaXJzdCwgYmVm
b3JlIHN0YXJ0aW5nIHRvDQo+Pj4+Pj4gbWFuZGF0ZSBwbGF5aW5nIGJ5IGNlcnRhaW4gb2YgdGhl
IHJ1bGVzIChhbmQgaGVuY2UgcmVxdWlyaW5nIGRldmlhdGlvbnMNCj4+Pj4+PiB0byBiZSBkb2N1
bWVudGVkKS4NCj4+Pj4+IA0KPj4+Pj4gSSBkb24ndCB0aGluayB0aGlzIGlzIG5lY2Vzc2FyeSBz
aG9ydCB0ZXJtLiBJdCBpcyBlYXN5IHRvIHJld29yayBhDQo+Pj4+PiBjb21tZW50IGFmdGVyIHRo
ZSBmYWN0LiBJdCBpcyBhIGxvdCBtb3JlIGRpZmZpY3VsdCB0byBnbyB0aHJvdWdoIHRoZQ0KPj4+
Pj4gaGlzdG9yeSBhbmQgZmluZCB0aGUgcmF0aW9uYWxlLg0KPj4+PiANCj4+Pj4gV2UgYWxsIGtu
b3cgd2hhdCAic2hvcnQgdGVybSIgbWF5IG1lYW4gLSB3ZSBtYXkgcmVtYWluIGluIHRoaXMgbW9k
ZSBvZg0KPj4+PiBvcGVyYXRpb24gZm9yIGFuIGV4dGVuZGVkIHBlcmlvZCBvZiB0aW1lLiBJdCds
bCBwb3RlbnRpYWxseSBiZSBxdWl0ZSBhDQo+Pj4+IGJpdCBvZiBjaHVybiB0byBzdWJzZXF1ZW50
bHkgYWRqdXN0IGFsbCBzdWNoIGNvbW1lbnRzIHdoaWNoIHdvdWxkDQo+Pj4+IGhhdmUgYWNjdW11
bGF0ZWQsIGFuZCAtIGZvciBub3QgYmVpbmcgc3RhbmRhcmRpemVkIC0gY2FuJ3QgZWFzaWx5IGJl
DQo+Pj4+IGdyZXAtZWQgZm9yLg0KPj4+IA0KPj4+IFdlbGwuLi4gU2Nhbm5lciB3aWxsIGxpa2Vs
eSBwb2ludCBvdXQgdGhlIGlzc3VlcyB3ZSBkZXZpYXRlIGZyb20uIFNvIHlvdSANCj4+PiB3ZSBo
YXZlIGFuIGVhc3kgd2F5IHRvIGtub3cgd2hlcmUgdGhlIGNvbW1lbnRzIG5lZWQgdG8gYmUgYWRq
dXN0ZWQuDQo+Pj4gDQo+Pj4+IEJ5IGRvY3VtZW50aW5nIHRoaW5ncyBpbiB0aGUgY29tbWl0IG1l
c3NhZ2UgdGhlIHN0YXRlIG9mDQo+Pj4+IHRoZSBjb2RlIGJhc2UgZG9lc24ndCBjaGFuZ2UsIGFu
ZCB3ZSdsbCBjb250aW51ZSB0byByZWx5IG9uIHNjYW5uZXJzDQo+Pj4+IHRvIGxvY2F0ZSBzZXRz
IG9mIGNhbmRpZGF0ZXMgZm9yIGFkanVzdG1lbnQgb3IgZGV2aWF0aW9uIGNvbW1lbnRhcnkuDQo+
Pj4gDQo+Pj4gVGhlIHBhcnQgSSBhbSBtaXNzaW5nIGhvdyBkb2N1bWVudGluZyB0aGUgZGV2aWF0
aW9ucyBpbiB0aGUgY29tbWl0IA0KPj4+IG1lc3NhZ2UgaGVscC4uLiBDYW4geW91IGNsYXJpZnkg
aXQ/DQo+PiANCj4+IEkgdW5kZXJzdG9vZCBTdGVmYW5vIGZvciB0aGlzIHRvIG1lcmVseSBiZSBm
b3IgdGhlIHB1cnBvc2Ugb2YganVzdGlmeWluZw0KPj4gdGhlIGRldmlhdGlvbiAocHJlZW1wdGlu
ZyByZXZpZXcgY29tbWVudHMpLg0KPiANCj4gUmlnaHQsIHNvIGF0IGEgdmVyeSBtaW5pbXVtLCBp
ZiB3ZSBzYXkg4oCcVGhpcyBpcyBhIHJ1bGUgbm934oCdLCBhbmQgYSBzdWJtaXR0ZXIgd2FudHMg
YSBkZXZpYXRpb24gZnJvbSB0aGF0IHJ1bGUsIHRoZW4gdGhlIHJldmlld2VyIG5lZWRzIHRvIGtu
b3cgdGhlIGp1c3RpZmljYXRpb24gZm9yIHRoZSBkZXZpYXRpb24uICBUaGUgY29tbWl0IG1lc3Nh
Z2UgaXMgdGhlIG9idmlvdXMgcGxhY2UgZm9yIHRoYXQuDQoNCkFncmVlDQoNCj4gDQo+IE9idmlv
dXNseSBzb21ldGhpbmcgKmVsc2UqIHdlIG1pZ2h0IHdhbnQgaXMgYSBtb3JlIGNvbnZlbmllbnQg
d2F5IHRvIGtlZXAgdGhhdCByYXRpb25hbGUgZm9yIHRoZSBmdXR1cmUsIHdoZW4gd2Ugc3RhcnQg
dG8gb2ZmaWNpYWxseSBkb2N1bWVudCBkZXZpYXRpb25zLiAgR2l2ZW4gdGhhdCB0aGUgc2Nhbm5l
ciB3aWxsIHBvaW50IG91dCBhbGwgdGhlIHBsYWNlcyB3aGVyZSBkZXZpYXRpb25zIGhhcHBlbiwg
SSBkb27igJl0IHRoaW5rIGFuIHVuc3RydWN0dXJlZCBjb21tZW50IHdpdGggYW4gaW5mb3JtYWwg
c3VtbWFyeSBvZiB0aGUganVzdGlmaWNhdGlvbiB3b3VsZCBiZSBhIHByb2JsZW0g4oCUIGl0IHNl
ZW1zIGxpa2UgaXQgd291bGQgYmUgYSBsb3QgZWFzaWVyLCB3aGVuIHdlIHN0YXJ0IHRvIG9mZmlj
aWFsbHkgZG9jdW1lbnQgZGV2aWF0aW9ucywgdG8gdHJhbnNmb3JtIGNvbW1lbnRzIGluIHRoZSBl
eGlzdGluZyBjb2RlYmFzZSwgdGhhbiB0byBzZWFyY2ggdGhyb3VnaCB0aGUgbWFpbGluZyBsaXN0
cyBhbmQvb3IgZ2l0IGNvbW1pdCBoaXN0b3J5IHRvIGZpbmQgdGhlIHJhdGlvbmFsZSAob3IgdHJ5
IHRvIHdvcmsgb3V0IHVuYWlkZWQgd2hhdCB0aGUgaW50ZW50IHdhcykuICBCdXQgSSBkb27igJl0
IGhhdmUgc3Ryb25nIG9waW5pb25zIG9uIHRoZSBtYXR0ZXIuDQoNCk1heWJlIGFncmVlaW5nIG9u
IGEgc2ltcGxlIHRhZyB0byBzdGFydCB0aGF0IGNhbiBsYXRlciBiZSBpbXByb3ZlZCAoTHVjYSBG
YW5jZWxsdSBvbiBteSBzaWRlIHdpbGwgc3RhcnQgd29ya2luZyBvbiB0aGF0IHdpdGggdGhlIEZ1
U2EgU0lHIGFuZCBFY2xhaXIgbmV4dCBtb250aCkuDQoNClNvIEkgd291bGQgc3VnZ2VzdDoNCg0K
LyoqDQogKiBNSVNSQV9ERVY6IFJ1bGUgSUQNCiAqIHh4eHh4IGp1c3RpZmljYXRpb24NCiAqDQog
Ki8NCg0KV2hlbmV2ZXIgd2Ugd2lsbCBoYXZlIGRlZmluZWQgdGhlIGZpbmFsIHdheSwgd2Ugd2ls
bCByZXBsYWNlIHRob3NlIGVudHJpZXMgd2l0aCB0aGUgbmV3IHN5c3RlbS4NCg0KV291bGQgdGhh
dCBiZSBhbiBhZ3JlZWFibGUgc29sdXRpb24gPw0KDQpSZWdhcmRzDQpCZXJ0cmFuZA0KDQoNCj4g
DQo+ICAtR2VvcmdlDQoNCg==

