Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B2E3F2B97
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 13:54:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169462.309566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH35x-0006TP-VN; Fri, 20 Aug 2021 11:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169462.309566; Fri, 20 Aug 2021 11:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH35x-0006RM-Rz; Fri, 20 Aug 2021 11:53:57 +0000
Received: by outflank-mailman (input) for mailman id 169462;
 Fri, 20 Aug 2021 11:53:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pH7i=NL=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mH35w-0006RG-Fl
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 11:53:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.43]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13f219c7-3531-439d-bf05-88ae2d22b26e;
 Fri, 20 Aug 2021 11:53:54 +0000 (UTC)
Received: from DU2PR04CA0339.eurprd04.prod.outlook.com (2603:10a6:10:2b4::18)
 by AM0PR08MB4227.eurprd08.prod.outlook.com (2603:10a6:208:13d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Fri, 20 Aug
 2021 11:53:52 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::41) by DU2PR04CA0339.outlook.office365.com
 (2603:10a6:10:2b4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 11:53:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 11:53:52 +0000
Received: ("Tessian outbound 56612e04f172:v103");
 Fri, 20 Aug 2021 11:53:52 +0000
Received: from 91a45f384db9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1C5D4E1B-537E-4AA4-8F5A-A77A0912D3A3.1; 
 Fri, 20 Aug 2021 11:53:46 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 91a45f384db9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Aug 2021 11:53:46 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB4886.eurprd08.prod.outlook.com (2603:10a6:10:f4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 11:53:32 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 11:53:32 +0000
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
X-Inumbo-ID: 13f219c7-3531-439d-bf05-88ae2d22b26e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4EvlY1E7+4gXwKbUizIkzoLT2Wz5RlwoxRnBgJywBM=;
 b=N2s6pB/JmwEH2+bY0L8vdJ2hNDyJxD+ajFGRe+8mgrcA+9YELHGT1ZQZnbDybAJXzLZe6YNrhF0jg4nWssUYek1fT1lfntVt+Ho/8819Mqcrk+wvV6PoVLxifCVMpV28ZEmv5rPNqT3gCsy8y/+gLz2R1eCNUOtLnD0oaa4udNk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3a2c88a484c48d33
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PoyeX5di78L7Yge/2dZIkwz28KMfcSDdKI75qX+62+qAws7v2iGBIh2Cypn8t/167G45z/uU3oF/jLHfn0JTRdJ7UbQviGZcPiwRPh9DCfGO/Fo3c0slCuycoulkTEtbiNptiHJbN3vKNDKMy861ic2UbOP/Eh5JyyktORUf5hpSchIy+vycfukYDbQzs3k6InXLlD/bZa/ZSTBm1jgx4IKyX413meKHcxprQUhnQjl1PeP1wwGPIGYC6ayk2VUlYW5XZY/jBISyOn012EU0WHb9xcLTMrP3JlCEOEU7e75qdvSuzcAzNbIVYTokxhrYkPrDVFerruQYqWX3dcXelw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4EvlY1E7+4gXwKbUizIkzoLT2Wz5RlwoxRnBgJywBM=;
 b=FTgQG5t9JxEPPhyAC7QRzuCCjpBynSkB/lwYAc8/Hwr4vv62jYpdyHFS1C+KXbRf7rhpnKXo//yBzBcyaM5kEZU9EGjNuQcOSqcHwJFvMcTYWuJcFm4jx11LloNKfBEkcPtEXdkiiOUEXfL015NSYD/+CoZUIqR6C+1eSdcJyGlZ2dwahAS267L8749m9SuWYlgj68EFIuZVuipj739a7ctPoHPb8/lwmXlxnvM31rysNHhBrEzVgmhEjpoBhg4y28fuqpLx6SsilXN8kzJFswYNsPeykgiiaey+2tUknng+M/+dlLuy7QjRd2mN32e12IuA/eNPSuyfUpuFtxbsvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4EvlY1E7+4gXwKbUizIkzoLT2Wz5RlwoxRnBgJywBM=;
 b=N2s6pB/JmwEH2+bY0L8vdJ2hNDyJxD+ajFGRe+8mgrcA+9YELHGT1ZQZnbDybAJXzLZe6YNrhF0jg4nWssUYek1fT1lfntVt+Ho/8819Mqcrk+wvV6PoVLxifCVMpV28ZEmv5rPNqT3gCsy8y/+gLz2R1eCNUOtLnD0oaa4udNk=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 22/40] xen/arm: introduce a helper to parse device
 tree processor node
Thread-Topic: [XEN RFC PATCH 22/40] xen/arm: introduce a helper to parse
 device tree processor node
Thread-Index: AQHXjps9W9pBfq916EKAfG5ObJRyjat7LowAgACIpGCAAGq8AIAAIxsQ
Date: Fri, 20 Aug 2021 11:53:32 +0000
Message-ID:
 <DB9PR08MB6857FF0A21898C7BB2E680E99EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-23-wei.chen@arm.com>
 <b52884fd-da4b-f09c-8ed9-cefd7c5b6e97@xen.org>
 <DB9PR08MB6857105F17F529CCD54D83E89EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <317048b1-adfd-d537-aff4-4018e50f348a@xen.org>
In-Reply-To: <317048b1-adfd-d537-aff4-4018e50f348a@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CD7E85A195414543A17A26BA271DBB36.0
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6d54857f-5ecb-417e-dfe0-08d963d12e54
x-ms-traffictypediagnostic: DBBPR08MB4886:|AM0PR08MB4227:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB4227EC0939CE7EFEC72EBE2B9EC19@AM0PR08MB4227.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 orThC+ScTePdv0+agiKkQpTe6O9YGhlZv8HBMtGSMWCVe6lB9qRSe3zUHckPjwDfIw8CxmfY1pHYQa6EP2t6E29eV22+PtDcaMfVA+BpEzr4hUgUyRiZlhtoWYmoUhtiIVJ8vMTxi/cIjfyB8g8ldxus7R/AGR6ACrXg4x+UG4yiEJrcUMeNwV4Io/rk3/AizcKp0LEl5RK4IijwRNXRDrf7HuW8CAjksrtH7TO53gTH7B7DhQ1CN4M3XhksK9RQqxphDJLLB8SoSKGN40PVa0T1fLdx00CEOQlCAb8bRpebjqn/ey+82+9RB2rRbHRC9HzXflix72qAfNP1SqjDblMBhda1WsGwplJfDORnG7KAhk4MULrQrSjPeL3zM0l82s5NdQJFR2XHT2QQQ6ffJ7dLW9LuG6qHpm+MtHVSLrSN1iZiWtHHQNOH6n+80fPyvdfzSxaT4grt0cCFuoxyHJhA/09AAAzj55gYBrg4oA6XuPztmQZN2S6ymjK0ZBEo4flMKoldymEKoq48cOKCA8IOognoNAj1HBVtwZBsPFfPJ752trWn3IoGHNEQuAr0JjkIoeyWm9xEOXxKcsYhaEVHv0X2xzw0OJTlzqgy04DxMp/12HzKw2NM8WrsnBMvJzV8w+VTKxJ4UxHjuPgcJfyHYuKz6vkCq3KGY7ZVSlrXWDr8o+PStMG9WOHtZa81XEosp+TR08bWS3zW6fDClQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(66446008)(76116006)(64756008)(55016002)(478600001)(66476007)(316002)(66946007)(8676002)(66556008)(52536014)(38100700002)(2906002)(86362001)(6506007)(110136005)(122000001)(9686003)(53546011)(38070700005)(83380400001)(7696005)(186003)(8936002)(4326008)(5660300002)(33656002)(26005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TmIrOXN0R0NXNGdBTERFQ1hKMlM2UmswUW83TElQQkxmR0RHTDZmTFVzWVor?=
 =?utf-8?B?ZVFyVk4ycEhFS0hqK3dWSjJIVmhxUjhzeG95M0xxU2pzZFo2OWNKS0NZeXMv?=
 =?utf-8?B?L29pZlhEenl5QzQ0L1VnSVArSi9zcVhmWnFEMitPYTlDZVlyOUJ6WWM2MXRO?=
 =?utf-8?B?cXFtR3VZVEhrd21OempMSDh5RUwvb0dDSUcrNEVTcVhLamdTYTdVN3MxV0pO?=
 =?utf-8?B?ZmpNRFhsbVJsTG1BV1ZENzZxdWlYSTRJVGlWTktYbEJvMm9Ja0pFYWo4WlFT?=
 =?utf-8?B?bnVYUUxPM0FlN2FsbXdVTzNXckJ3WDluVVByekZ6aVAyZlE2Qncyb2EzMlRw?=
 =?utf-8?B?VnRSMFpzY1JXSmNpU2JKQW9uSWZXL0k4V2I1aUdvWGZBSzNzNW95aUdYNCtx?=
 =?utf-8?B?RUJLdWJ0anFhOThqaXVReTNpRFl6dEptZzZzai9uWlloRFlWdXlGRWNOTzR0?=
 =?utf-8?B?bWwzUVRleHVBRmQzOFh2cEgwVTdWNkpGQ0JaN2s5TjBheU0yT2RFTlVDRjBp?=
 =?utf-8?B?VVlwZklTdllXNXFUenEvRXl5MXppaHNaSU9VYWxRSlBBQTJ1aUNIV21wcGFM?=
 =?utf-8?B?VS9ZSU14QmFXRGlleEQ5LzB6Y2xaRHRRTDMrK1dWTDZKeHFZKyt2S3JMK0pp?=
 =?utf-8?B?MHRiRk90VHp1U2F3REt2ZVhDOXhtZUlpUUsvZW1uYmlSNWdidzRseUtDV2Ex?=
 =?utf-8?B?eVpXK09SRFZRQU55QVBIWFhnUjVwaENJMW9DNVhmNVh3OXUrVXg2cThwYktP?=
 =?utf-8?B?YU0xQ0YrVlJpWUlzVTJMcHp3UTlvRURCMmFPOUY5bHBNOGRvNlVwYW5iaXBa?=
 =?utf-8?B?VW14bENLQXB4L2lHZWtwUGg2NHloeHJkNkZDUXE1OU14Mk5TSlUzTUpycjY0?=
 =?utf-8?B?S245RitxMkJpbDJpekVBQnF5bkxVTHBhTngrTkxyVUJ1SHVSZEYwUEZsSTF0?=
 =?utf-8?B?Z09YYVFkYmo0c1VsSWJQRDJIdXZKSE1uMDRiQUdVOCtIQWFRY1R6cmR6ZW5j?=
 =?utf-8?B?ZFI2ZWhkdGlGNDFpODQ5UEJ6NDA3aHhoOE9QSTNmMERseTlnQWVDNG1kQmlB?=
 =?utf-8?B?MTVGQkhlbjk1Qlc4VTgvMC9JUm9OYzVaYzRmSXBZV0JuVlhLQXpTanFUWUhh?=
 =?utf-8?B?eXVRZHdQdmFMNHhEalNwVmpDZkFMTjBjZmlwcWRJc1J3SWxuNW54dHFEa0dm?=
 =?utf-8?B?b3JRem03alpDNFVJSU1sTGFUVHlZYXJXbFoxZXVWYzZmT2tUcnk3ODZIVjll?=
 =?utf-8?B?L3RBbXRGZDRGNmI1RzBXYzFXWnE3NHNiMmFqS250YzdqZ3BHclYwckRzeVZS?=
 =?utf-8?B?QmMvb3krSnk1R1c0SVFBekpvM3Jzcmk0dTJ0TFd3WkVUeWNmZGhVRkppS1Nl?=
 =?utf-8?B?d04rRlhQTXhxRlBTZEV2RVg3L09FZ0pCUEs1WUVEeUkrMXVHQTk0bEk2SUVm?=
 =?utf-8?B?Rld4eUMraGxrZXFsbmFlUktQakxtMEFFRHJqRk1OeTdWQ0dvUklMV05TSTBT?=
 =?utf-8?B?QUNJVlRTdU1kbzJpWkVHREhqZ2wzdlpiMVhmOWVLc1dkMW01SCsydTkzWVRt?=
 =?utf-8?B?MzhYTjcwenpmN0NaMjBzYlFteGR0bjRWdGhRZFBmblhvUnFKb1VoVE1ITmVQ?=
 =?utf-8?B?Wmo3aHMwYktsVEZSN0dzMEFmWlZObExtS21sMUdGNmxlZmw3akhoa21UTGRG?=
 =?utf-8?B?NlJYb0lKTHZCSEpySGt5WEhSVEp3TDFPQXh5ajBoS3ZVMm5CMFJzTTFjS2dQ?=
 =?utf-8?Q?U2MZgP70F+/e5hIH2UOlQoJK+aHajWMZcTPHhZo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4886
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5580ff17-e15d-46c5-bc4b-08d963d1222e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C+yZtY8sm3ZYuHEdbw0KJ7llnRazT4gAh+9ujMJCNdfqrsAbf8+3nMltkB/NYjpFdPcP3WmaWUcONIMQ4e837WDRHQIlXw3qyRXfw2unRrHjl8nwjW92+qBuORFzz/9DUJKZbCX0AZD6EM2LiSD7yx6qZ2vaxDJ/g9JnAsjBupXoI5XHw2vKGxaTwIednSUac6V/zkHX/C1/VRg9n/MtNnM5GJh6seG8z2J6xLEic/cfkxjHeIkYEQKIeFSXI4qdEF1KXdkfQ66QbZuj7mOJ/YwOY/f7QDOQgkw6t9sgVGp9nYoaiaamREaUjiJVcVrddI3ZpqatVuXTTjovTJ4UjhTiLBZP6Zuu5JXkFdmBUgSYGYj3TCWiuMlB5ocj4wZpC+S0lrolpyqW42HY1aQ2IZgnK261uAWYvyTYb4RZFSSmtqxCHhUXMz+ZvzOXBE34S+5GCZ84ZulsCQuMYYR1TOUZbAf9Qym3GJqsoat7xlwjHLzgWuXVB11ZasKuFDFWoBXJy7OFd5bflZZrdwyWia3mDEloKyODQYSc9z55uxKj/REAyGHJInssx+XXJdIjLDSNa+7xDscd1JF1oEyBlqZ4m5gtWenAGO3C9Gfy/VQ3br+xE92j66LJbIMM+AZus3Fn/EF0RCX8TDLgKDXoYw8JUGrlIzQPO2BtvfXgQfgSFzNcWue+016vn7Q9oA2ojYu8uFygFkz62GPqkjbkvQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(46966006)(36840700001)(4326008)(8936002)(9686003)(55016002)(336012)(26005)(47076005)(36860700001)(316002)(186003)(7696005)(6506007)(53546011)(52536014)(2906002)(82310400003)(82740400003)(478600001)(83380400001)(33656002)(5660300002)(86362001)(70586007)(8676002)(81166007)(70206006)(110136005)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 11:53:52.6184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d54857f-5ecb-417e-dfe0-08d963d12e54
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4227

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjDml6UgMTY6NDQN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1bGljaEBzdXNlLmNvbQ0K
PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMjIvNDBdIHhlbi9hcm06IGludHJvZHVjZSBhIGhlbHBl
ciB0byBwYXJzZQ0KPiBkZXZpY2UgdHJlZSBwcm9jZXNzb3Igbm9kZQ0KPiANCj4gDQo+IA0KPiBP
biAyMC8wOC8yMDIxIDAzOjIzLCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBIaSBKdWxpZW4sDQo+IA0K
PiBIaSBXZWksDQo+IA0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9t
OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiA+PiBTZW50OiAyMDIx5bm0OOaciDIw
5pelIDI6MTMNCj4gPj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiA+PiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1
bGljaEBzdXNlLmNvbQ0KPiA+PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVp
c0Bhcm0uY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMjIvNDBdIHhlbi9h
cm06IGludHJvZHVjZSBhIGhlbHBlciB0byBwYXJzZQ0KPiA+PiBkZXZpY2UgdHJlZSBwcm9jZXNz
b3Igbm9kZQ0KPiA+Pg0KPiA+PiBIaSBXZWksDQo+ID4+DQo+ID4+IE9uIDExLzA4LzIwMjEgMTE6
MjQsIFdlaSBDaGVuIHdyb3RlOg0KPiA+Pj4gUHJvY2Vzc29yIE5VTUEgSUQgaW5mb3JtYXRpb24g
aXMgc3RvcmVkIGluIGRldmljZSB0cmVlJ3MgcHJvY2Vzc29yDQo+ID4+PiBub2RlIGFzICJudW1h
LW5vZGUtaWQiLiBXZSBuZWVkIGEgbmV3IGhlbHBlciB0byBwYXJzZSB0aGlzIElEIGZyb20NCj4g
Pj4+IHByb2Nlc3NvciBub2RlLiBJZiB3ZSBnZXQgdGhpcyBJRCBmcm9tIHByb2Nlc3NvciBub2Rl
LCB0aGlzIElEJ3MNCj4gPj4+IHZhbGlkaXR5IHN0aWxsIG5lZWQgdG8gYmUgY2hlY2tlZC4gT25j
ZSB3ZSBnb3QgYSBpbnZhbGlkIE5VTUEgSUQNCj4gPj4+IGZyb20gYW55IHByb2Nlc3NvciBub2Rl
LCB0aGUgZGV2aWNlIHRyZWUgd2lsbCBiZSBtYXJrZWQgYXMgTlVNQQ0KPiA+Pj4gaW5mb3JtYXRp
b24gaW52YWxpZC4NCj4gPj4+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNo
ZW5AYXJtLmNvbT4NCj4gPj4+IC0tLQ0KPiA+Pj4gICAgeGVuL2FyY2gvYXJtL251bWFfZGV2aWNl
X3RyZWUuYyB8IDQxDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQ0KPiA+Pj4g
ICAgMSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4+
Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9udW1hX2RldmljZV90cmVlLmMNCj4g
Pj4gYi94ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5jDQo+ID4+PiBpbmRleCAxYzc0YWQx
MzVkLi4zN2NjNTZhY2YzIDEwMDY0NA0KPiA+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL251bWFfZGV2
aWNlX3RyZWUuYw0KPiA+Pj4gKysrIGIveGVuL2FyY2gvYXJtL251bWFfZGV2aWNlX3RyZWUuYw0K
PiA+Pj4gQEAgLTIwLDE2ICsyMCw1MyBAQA0KPiA+Pj4gICAgI2luY2x1ZGUgPHhlbi9pbml0Lmg+
DQo+ID4+PiAgICAjaW5jbHVkZSA8eGVuL25vZGVtYXNrLmg+DQo+ID4+PiAgICAjaW5jbHVkZSA8
eGVuL251bWEuaD4NCj4gPj4+ICsjaW5jbHVkZSA8eGVuL2RldmljZV90cmVlLmg+DQo+ID4+DQo+
ID4+IE5vdGhpbmcgaW4gdGhpcyBmaWxlIHNlZW1zIHRvIGRlcGVuZCBvbiB4ZW4vZGV2aWNlX3Ry
ZWUuaC4gU28gd2h5IGRvDQo+IHlvdQ0KPiA+PiBuZWVkIHRvIGluY2x1ZGUgaXQ/DQo+ID4+DQo+
ID4NCj4gPiBJIHJlbWVtYmVyIHRoYXQgd2l0aG91dCB0aGlzIGhlYWRlciBmaWxlLCBkZXZpY2Vf
dHJlZV9nZXRfdTMyIGluIHRoaXMNCj4gcGF0Y2gNCj4gPiB3aWxsIGNhdXNlIGNvbXBpbGluZyBm
YWlsZWQuDQo+IA0KPiBJIGxvb2tlZCBhdCB0aGUgcHJvdG90eXBlIG9mIGRldmljZV90cmVlX2dl
dF91MzIoKSBhbmQgSSBjYW4ndCBmaW5kIGhvdw0KPiBpdCBkZXBlbmRzIG9uIGJpdHMgZnJvbSBk
ZXZpY2VfdHJlZS5oLiBDYW4geW91IHBhc3RlIHRoZSBjb21waWxhdGlvbiBlcnJvcj8NCj4gDQoN
CkkgdGVzdGVkIGl0IGFnYWluLCB0aGlzIGhlYWRlciBmaWxlIHNob3VsZCBiZSBpbnRyb2R1Y2Vk
IGluIGZvbGxvd2luZyBwYXRjaGVzOg0KbnVtYV9kZXZpY2VfdHJlZS5jOiBJbiBmdW5jdGlvbiDi
gJhkZXZpY2VfdHJlZV9wYXJzZV9udW1hX2Rpc3RhbmNlX21hcF92MeKAmToNCm51bWFfZGV2aWNl
X3RyZWUuYzoyNDM6MTY6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDi
gJhkdF9yZWFkX251bWJlcuKAmSBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlv
bl0NCiAgMjQzIHwgICAgICAgICBmcm9tID0gZHRfcmVhZF9udW1iZXIobWF0cml4LCAxKTsNCiAg
ICAgIHwgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn4NCm51bWFfZGV2aWNlX3RyZWUuYzoy
NDM6MTY6IGVycm9yOiBuZXN0ZWQgZXh0ZXJuIGRlY2xhcmF0aW9uIG9mIOKAmGR0X3JlYWRfbnVt
YmVy4oCZIFstV2Vycm9yPW5lc3RlZC1leHRlcm5zXQ0KY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcg
dHJlYXRlZCBhcyBlcnJvcnMNCg0KSSB3aWxsIG1vdmUgaXQgdG8gYW5vdGhlciBwYXRjaC4NCg0K
PiA+DQo+ID4+PiArI2luY2x1ZGUgPGFzbS9zZXR1cC5oPg0KPiA+Pj4NCj4gPj4+ICAgIHM4IGRl
dmljZV90cmVlX251bWEgPSAwOw0KPiA+Pj4gK3N0YXRpYyBub2RlbWFza190IHByb2Nlc3Nvcl9u
b2Rlc19wYXJzZWQgX19pbml0ZGF0YTsNCj4gPj4+DQo+ID4+PiAtaW50IHNyYXRfZGlzYWJsZWQo
dm9pZCkNCj4gPj4+ICtzdGF0aWMgaW50IHNyYXRfZGlzYWJsZWQodm9pZCkNCj4gPj4+ICAgIHsN
Cj4gPj4+ICAgICAgICByZXR1cm4gbnVtYV9vZmYgfHwgZGV2aWNlX3RyZWVfbnVtYSA8IDA7DQo+
ID4+PiAgICB9DQo+ID4+Pg0KPiA+Pj4gLXZvaWQgX19pbml0IGJhZF9zcmF0KHZvaWQpDQo+ID4+
PiArc3RhdGljIF9faW5pdCB2b2lkIGJhZF9zcmF0KHZvaWQpDQo+ID4+PiAgICB7DQo+ID4+PiAg
ICAgICAgcHJpbnRrKEtFUk5fRVJSICJEVDogTlVNQSBpbmZvcm1hdGlvbiBpcyBub3QgdXNlZC5c
biIpOw0KPiA+Pj4gICAgICAgIGRldmljZV90cmVlX251bWEgPSAtMTsNCj4gPj4+ICAgIH0NCj4g
Pj4+ICsNCj4gPj4+ICsvKiBDYWxsYmFjayBmb3IgZGV2aWNlIHRyZWUgcHJvY2Vzc29yIGFmZmlu
aXR5ICovDQo+ID4+PiArc3RhdGljIGludCBfX2luaXQgZHRiX251bWFfcHJvY2Vzc29yX2FmZmlu
aXR5X2luaXQobm9kZWlkX3Qgbm9kZSkNCj4gPj4+ICt7DQo+ID4+PiArICAgIGlmICggc3JhdF9k
aXNhYmxlZCgpICkNCj4gPj4+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+Pj4gKyAgICBl
bHNlIGlmICggbm9kZSA9PSBOVU1BX05PX05PREUgfHwgbm9kZSA+PSBNQVhfTlVNTk9ERVMgKSB7
DQo+ID4+PiArCQliYWRfc3JhdCgpOw0KPiA+Pj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ID4+PiAr
CX0NCj4gPj4+ICsNCj4gPj4+ICsgICAgbm9kZV9zZXQobm9kZSwgcHJvY2Vzc29yX25vZGVzX3Bh
cnNlZCk7DQo+ID4+PiArDQo+ID4+PiArICAgIGRldmljZV90cmVlX251bWEgPSAxOw0KPiA+Pj4g
KyAgICBwcmludGsoS0VSTl9JTkZPICJEVDogTlVNQSBub2RlICV1IHByb2Nlc3NvciBwYXJzZWRc
biIsIG5vZGUpOw0KPiA+Pj4gKw0KPiA+Pj4gKyAgICByZXR1cm4gMDsNCj4gPj4+ICt9DQo+ID4+
PiArDQo+ID4+PiArLyogUGFyc2UgQ1BVIE5VTUEgbm9kZSBpbmZvICovDQo+ID4+PiAraW50IF9f
aW5pdCBkZXZpY2VfdHJlZV9wYXJzZV9udW1hX2NwdV9ub2RlKGNvbnN0IHZvaWQgKmZkdCwgaW50
IG5vZGUpDQo+ID4+PiArew0KPiA+Pj4gKyAgICB1aW50MzJfdCBuaWQ7DQo+ID4+PiArDQo+ID4+
PiArICAgIG5pZCA9IGRldmljZV90cmVlX2dldF91MzIoZmR0LCBub2RlLCAibnVtYS1ub2RlLWlk
IiwNCj4gTUFYX05VTU5PREVTKTsNCj4gPj4+ICsgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HICJD
UFUgb24gTlVNQSBub2RlOiV1XG4iLCBuaWQpOw0KPiA+Pj4gKyAgICBpZiAoIG5pZCA+PSBNQVhf
TlVNTk9ERVMgKQ0KPiA+Pj4gKyAgICB7DQo+ID4+PiArICAgICAgICBwcmludGsoWEVOTE9HX1dB
Uk5JTkcgIk5vZGUgaWQgJXUgZXhjZWVkcyBtYXhpbXVtIHZhbHVlXG4iLA0KPiA+PiBuaWQpOw0K
PiA+Pj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4+PiArICAgIH0NCj4gPj4+ICsNCj4g
Pj4+ICsgICAgcmV0dXJuIGR0Yl9udW1hX3Byb2Nlc3Nvcl9hZmZpbml0eV9pbml0KG5pZCk7DQo+
ID4+PiArfQ0KPiA+Pj4NCj4gPj4NCj4gPj4gLS0NCj4gPj4gSnVsaWVuIEdyYWxsDQo+IA0KPiBD
aGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

