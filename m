Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8025E58DACE
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 17:07:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382985.618064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLQom-0002LP-FV; Tue, 09 Aug 2022 15:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382985.618064; Tue, 09 Aug 2022 15:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLQom-0002IB-CJ; Tue, 09 Aug 2022 15:06:52 +0000
Received: by outflank-mailman (input) for mailman id 382985;
 Tue, 09 Aug 2022 15:06:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rEZx=YN=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oLQok-0002I5-3v
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 15:06:50 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00077.outbound.protection.outlook.com [40.107.0.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcfe9d6c-17f4-11ed-924f-1f966e50362f;
 Tue, 09 Aug 2022 17:06:36 +0200 (CEST)
Received: from DB8PR06CA0029.eurprd06.prod.outlook.com (2603:10a6:10:100::42)
 by AM0PR08MB3395.eurprd08.prod.outlook.com (2603:10a6:208:dc::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.19; Tue, 9 Aug
 2022 15:06:44 +0000
Received: from DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::1) by DB8PR06CA0029.outlook.office365.com
 (2603:10a6:10:100::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Tue, 9 Aug 2022 15:06:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT012.mail.protection.outlook.com (100.127.142.126) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16 via Frontend Transport; Tue, 9 Aug 2022 15:06:43 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Tue, 09 Aug 2022 15:06:43 +0000
Received: from 0f550bac390a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B2F787AB-FDC0-45B3-AFF2-1A5083BF43B7.1; 
 Tue, 09 Aug 2022 15:06:36 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0f550bac390a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Aug 2022 15:06:36 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AM5PR0802MB2498.eurprd08.prod.outlook.com (2603:10a6:203:98::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Tue, 9 Aug
 2022 15:06:34 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 15:06:34 +0000
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
X-Inumbo-ID: dcfe9d6c-17f4-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Mmg29+2AipvE1d/pFXAI3ZvHMEQRCNRmKU5am/t+EaiQQxaqOClsgB72Q5OayI4AEvZqtZsAaRL8H5/1Gpu08iiyDvrCRSCS+7yJysr6YZ9sPrnfuKd5osIZUewoZxFHSbcCaIQSKp7iMuc0U/4m6d2VU9EWiFK+28r5fREOvVxTI63dSrhP1f46anTh54r+S0ZHA5cemhMBG+06kRjuIzHQiK/48zGFpkKppDgsNfNX7IttMQboP0xIuxopFTptxVQtN7sxiGsG+FdGUqw7JCp1b+/n6wEzS30oxfzHcbawbImXHsQ3RF1LfX7/lN+fhUpX6qvj62lMgwZ0G5KcXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vK5HQKrElDf0iUkqMtc+bm6/H6U2KoyEA3OrM1FR6Xk=;
 b=KzGincdycrvzwyF5LdN1S6mN494Nz1bir2Vk5Yk7UgC7XibWh7a85HFxkMsf2J0ir4kknFsZX9Zb+TyKL9BHJHw+iBEZcdPK6CI8W8+atwh6nOCklYownhafbVFMNFqX9QJg88uSk4qtlLsPkfTtgTR/fDCR60UiTPVtv0eKf5YGW9QMhrKz1Y7tyMHwsMiRdTZHJa3Kw5HJthgJYkM+Yov+Z6kPDKyo92hZwPOIbpP3vNEshFGHdLW/NhfrZPvJHkKZK855mHL64kjHUAjm9Cq+9/99TX/firgMUHAm+UEut0oUFpAu5kpf8zRc8EWrTTIzpFz3r9E0P97yoMt36w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vK5HQKrElDf0iUkqMtc+bm6/H6U2KoyEA3OrM1FR6Xk=;
 b=3W9ex3FK0dNW0Bhan5aJWYasAT5LjzRSulURo5oJjgACynwpVE4aKaZxpJN2bXUcQpH49ix0ggEnMDPMXFVDgrpB6bV/6yfWu4/YHs4GHM2/z8isvTRyn+Vy54v+UVjGwGOUvLZvogIxO3lklP24cSsO0fxGMcydX3aAZgbLyQI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 000f1efb1970dbf2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qa0CG0Bn4BpL4azJ+juDiAfGPlBQfmhyU3yr/R+EN3J5pRtOcDfeoJqf7qfoSg3riehyt9QS/RpnVQpQc5BmV7XunkNuz0NhjpuBH0LCYKMp+l9Q4g6tPZkO4TsCAizQAUvxfabZkfdC5B4O47rLnqOhSMmMaRqrzkuXl+jmkF7fjbOxQvS9V7FjHyxJZa8+HFBkk5bfC9efV9QH0r3v92oEa6JhbMGn+Jfj2SaJ4wZ6+oQL7F4EAU7HD/RftvZ8fRB99lFM4lWmpamOTlZy15NL3NOOdQLet30qIUobzSfalBJlWzH/1kqJaLjPd7rAggrrWfDxu9tSonuiXUhRKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vK5HQKrElDf0iUkqMtc+bm6/H6U2KoyEA3OrM1FR6Xk=;
 b=J8u6mCzCPPJ7/oBDeNAUk7+FiUx6GTUWbpBJsgFO4dWGCSDlwm2e0YeidSWGAi43/9FLkXjBk9UBPHk/M8ujTui6QXHrbt+gQqw5/C7byFFdquoaBNvPFvJnT7EJ9F80kvV2FtA/9zfDdlvjY6jdN6Oy6WaSRxUrkMzVz4YOpuE6aIPBnBxiKgm/H7nos0lQIEnrgcnLh+tFiphDkwLZhoEJednL7iYvZIVZbXqaduZAnmvko9fhaLQlE/0TC32aOnnB8U/KlG7RO+tGozI8jT5oC8PKPJyYkP8oDK4ylMJ5ZrY9waDjnyLnKEp8HffAgqQt2X+dC2Jk3EelSPHjRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vK5HQKrElDf0iUkqMtc+bm6/H6U2KoyEA3OrM1FR6Xk=;
 b=3W9ex3FK0dNW0Bhan5aJWYasAT5LjzRSulURo5oJjgACynwpVE4aKaZxpJN2bXUcQpH49ix0ggEnMDPMXFVDgrpB6bV/6yfWu4/YHs4GHM2/z8isvTRyn+Vy54v+UVjGwGOUvLZvogIxO3lklP24cSsO0fxGMcydX3aAZgbLyQI=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] [RFC] xen/vpci: modify pci_get_pdev_by_domain() &
 pci_get_pdev()
Thread-Topic: [PATCH] [RFC] xen/vpci: modify pci_get_pdev_by_domain() &
 pci_get_pdev()
Thread-Index: AQHYqOI28IdG0PHJfUiTCQKz3s6xa62mXF0AgABVF4A=
Date: Tue, 9 Aug 2022 15:06:33 +0000
Message-ID: <9F5E81CD-858B-44CA-8BE3-B518111E2E85@arm.com>
References:
 <5650ddce1de4fd5471823bde44a12a03f157bc11.1659713913.git.rahul.singh@arm.com>
 <dd0ad0a4-6a01-7e35-51dc-614477bb9556@suse.com>
In-Reply-To: <dd0ad0a4-6a01-7e35-51dc-614477bb9556@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 204c268c-2942-41df-c08d-08da7a18c584
x-ms-traffictypediagnostic:
	AM5PR0802MB2498:EE_|DBAEUR03FT012:EE_|AM0PR08MB3395:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vYA1MQFTJb1QAgPUHBjtXkieB1nOdORg6taZWSGEzYNIB5tQSE6pXAm11Ja2yW+F0YecsyN6RJnnsy+ovcu+J+FGjcl3oo45cG4udmegT5IMw25AX0/8EmhqNerfKpteJ6DKW77wUhCAHlUOt36YjPxdfVNIylwkFvWonbTLeG+msxQCwqOtPm1RAfjyCnprfTWjMd9p37uO965vL/HDuoXsn7vnI/dwG89OXaBOgh7j7LZO3+kAniji2rekYwztGH4vfwf77QG2XrzULzwCbv/FTgrwM3D5L2ssc2jDs17cjsbY3z+tiIWXpl1XxVYGfuQJbmIWpO7ipMs3Vmb65pKf2FEbtPIBDh0T1UN6r1N3F7U3SETspYq98o47f6uuRLRFlw1dRsn21LF/BH+JoGjlkwEGnLf943ZD+5tJaKv33u/695/nBVX7zFMo5NOvxZLPHShzcVdnKHdJb4CNjXyOgoVHl/FywUrjAs6w1sdklIa8LyGnB0HLRNUBhanBX+O/04WGmfrXcWQ65Lc5tw5C07WFr05WG7TzDfol1UFyZXORyzzf2ai130qyD0xFb/JI7KGigFe8l7CTpUG6ZQu/TsMmajb72VEx5l8EcM59P4s4NSmTvKsNkDyW7MY/iKHjPamFFJvszYZ6m3THcRlzREfl6xUf7OcbxmAspMRjrSZCVHUQvppWgy+73pT9cr9jN9YnjytK8VO5WhXfxLkK0At4TdUdpz9E5xBfy5h6FH5RnlZIE2DkLg0QEte5loxyhzJn2P4JHwwDuuaDj5wc3mi5juPq0F8Y/DmMeYzvWFZX/qoBiAiQaeGm94SDvwoiNir/vPKhoWOHVBuXmQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(76116006)(8936002)(38100700002)(66446008)(91956017)(66556008)(5660300002)(66476007)(64756008)(8676002)(4326008)(66946007)(122000001)(2906002)(33656002)(6512007)(86362001)(38070700005)(36756003)(6486002)(478600001)(71200400001)(41300700001)(6916009)(316002)(2616005)(54906003)(186003)(26005)(6506007)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <11E40EA16C104A4C90C2E020CC858ACD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2498
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5d52fbf3-86a8-48a3-1e2d-08da7a18bfac
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5fyp9K9KZMxAouCFxYKUPaVL95xQBi5ew0rUnpk9IBmqgNfF7fvNHk8SFeotvt4KSDDhJfOl8i541OGkFPN6Uunw4IdCuTTmOUNmjgKwrbMwJaWnAttxcmC4IKxnLCvGNaJ86c77VQJQyGnXl50rlacTmqp5XRyD869jeGMPqEcSMoVmrgNkHglgkVN80/MzDwyAl2VO6vDhoqkIJpIIgbiOrb+7YL7Zfh8SKuVzIk3wMoI7u8A7g+sC9ANGbNUN8RuLRYz3PnEzpK/mczxWcEO2wz/kA6qFnHXiaiH6s2UuinTuKZp4G6h+0fcVuhZIO2EfKAURZcoO4MxH3ma8piDD2z+5dAjbikmnbpMHm2vZIhvf6WvryW3eQnxHAm9SGkJpUAskVav0mDZx2oDo9EQAwy1ft00mFm37DhK/7jp5QKk0bYnxDWnI3jf1DGM3eVAER3ok9zMUtHtz1qtbgad/FQ4xZUAWtbhb+8J6luFpByCaGU0ZYK049acDI8zySARrQHnDNBHVd1QXVsUf7HTTYmBp8AIH7t3V1kc5SPhahbKfJSTx2qY0cKDSdNH/igPXXq1DZvih+9euvqnoG5U3KXDZBZFfct2b4p7F7mjOI1H65h4euhjRwdZbMyfOyTpg3ns8W4XcxFUIhdpeVVgYNCWpS+4Q3zKCvaAm82fROhEsGUjCV8hXatv8uqwDDcb67+lpc+5tD7UUnutsxvVj1RNaW1ojSqPoTGBXBbY78m4AwTNfvEa0ZSC0U2fAQ6Zy1myKssCSAItpRsMsDJm/tFQERMWh2I3+3C/j89s40DqfmNZcYwAljpc6Eoyn
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(39860400002)(346002)(46966006)(36840700001)(40470700004)(40460700003)(2906002)(33656002)(478600001)(2616005)(82310400005)(86362001)(36756003)(40480700001)(5660300002)(36860700001)(6862004)(8936002)(54906003)(8676002)(6512007)(26005)(70206006)(4326008)(6506007)(53546011)(70586007)(41300700001)(336012)(316002)(47076005)(82740400003)(81166007)(356005)(186003)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 15:06:43.7961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 204c268c-2942-41df-c08d-08da7a18c584
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3395

SGkgSmFuLA0KDQo+IE9uIDkgQXVnIDIwMjIsIGF0IDExOjAyIGFtLCBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMDUuMDguMjAyMiAxNzo0MywgUmFodWwg
U2luZ2ggd3JvdGU6DQo+PiBwY2lfZ2V0X3BkZXZfYnlfZG9tYWluKCkgYW5kIHBjaV9nZXRfcGRl
digpIGZ1bmN0aW9ucyBmaW5kIHRoZSBwZGV2IGluDQo+PiB0aGUgcHNlZyBsaXN0LiBJZiBwZGV2
IGlzIG5vdCBpbiB0aGUgcHNlZyBsaXN0LCB0aGUgZnVuY3Rpb25zIHdpbGwgdHJ5DQo+PiB0byBm
aW5kIHRoZSBwZGV2IGluIHRoZSBuZXh0IHNlZ21lbnQuIEl0IGlzIG5vdCByaWdodCB0byBmaW5k
IHRoZSBwZGV2DQo+PiBpbiB0aGUgbmV4dCBzZWdtZW50IGFzIHRoaXMgd2lsbCByZXN1bHQgaW4g
dGhlIGNvcnJ1cHRpb24gb2YgYW5vdGhlcg0KPj4gZGV2aWNlIGluIGEgZGlmZmVyZW50IHNlZ21l
bnQgd2l0aCB0aGUgc2FtZSBCREYuDQo+PiANCj4+IEFuIGlzc3VlIHRoYXQgd2FzIG9ic2VydmVk
IHdoZW4gaW1wbGVtZW50aW5nIHRoZSBQQ0kgcGFzc3Rocm91Z2ggb24gQVJNLg0KPj4gV2hlbiB3
ZSBkZWFzc2lnbiB0aGUgZGV2aWNlIGZyb20gZG9tVSBndWVzdCwgdGhlIGRldmljZSBpcyBhc3Np
Z25lZA0KPj4gdG8gZG9tX2lvIGFuZCBub3QgdG8gZG9tMCwgYnV0IHRoZSB0b29sIHN0YWNrIHRo
YXQgcnVucyBpbiBkb20wIHdpbGwgdHJ5DQo+PiB0byBjb25maWd1cmUgdGhlIGRldmljZSBmcm9t
IGRvbTAuIHZwY2kgd2lsbCBmaW5kIHRoZSBkZXZpY2UgYmFzZWQgb24NCj4+IGNvbnZlcnNpb24g
b2YgR1BBIHRvIFNCREYgYW5kIHdpbGwgdHJ5IHRvIGZpbmQgdGhlIGRldmljZSBpbiBkb20wLCBi
dXQNCj4+IGJlY2F1c2UgZGV2aWNlIGlzIGFzc2lnbmVkIHRvIGRvbV9pbywgcGNpX2dldF9wZGV2
X2J5X2RvbWFpbigpIHdpbGwNCj4+IHJldHVybiBwZGV2IHdpdGggc2FtZSBCREYgZnJvbSBuZXh0
IHNlZ21lbnQuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5n
aEBhcm0uY29tPg0KPiANCj4gVGhpcyB3YW50cyBhIEZpeGVzOiB0YWcuDQoNCkFjay4gDQo+IA0K
Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+ICsrKyBiL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+PiBAQCAtNTkzLDEzICs1OTMsMTAgQEAgc3RydWN0IHBj
aV9kZXYgKnBjaV9nZXRfcGRldihpbnQgc2VnLCBpbnQgYnVzLCBpbnQgZGV2Zm4pDQo+PiAgICAg
ICAgICAgICByZXR1cm4gTlVMTDsNCj4+ICAgICB9DQo+PiANCj4+IC0gICAgZG8gew0KPj4gLSAg
ICAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeSAoIHBkZXYsICZwc2VnLT5hbGxkZXZzX2xpc3QsIGFs
bGRldnNfbGlzdCApDQo+PiAtICAgICAgICAgICAgaWYgKCAocGRldi0+YnVzID09IGJ1cyB8fCBi
dXMgPT0gLTEpICYmDQo+PiAtICAgICAgICAgICAgICAgICAocGRldi0+ZGV2Zm4gPT0gZGV2Zm4g
fHwgZGV2Zm4gPT0gLTEpICkNCj4+IC0gICAgICAgICAgICAgICAgcmV0dXJuIHBkZXY7DQo+PiAt
ICAgIH0gd2hpbGUgKCByYWRpeF90cmVlX2dhbmdfbG9va3VwKCZwY2lfc2VnbWVudHMsICh2b2lk
ICoqKSZwc2VnLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwc2Vn
LT5uciArIDEsIDEpICk7DQo+PiArICAgIGxpc3RfZm9yX2VhY2hfZW50cnkgKCBwZGV2LCAmcHNl
Zy0+YWxsZGV2c19saXN0LCBhbGxkZXZzX2xpc3QgKQ0KPj4gKyAgICAgICAgaWYgKCAocGRldi0+
YnVzID09IGJ1cyB8fCBidXMgPT0gLTEpICYmDQo+PiArICAgICAgICAgICAgIChwZGV2LT5kZXZm
biA9PSBkZXZmbiB8fCBkZXZmbiA9PSAtMSkgKQ0KPj4gKyAgICAgICAgICAgIHJldHVybiBwZGV2
Ow0KPj4gDQo+PiAgICAgcmV0dXJuIE5VTEw7DQo+PiB9DQo+PiBAQCAtNjQyLDE0ICs2MzksMTEg
QEAgc3RydWN0IHBjaV9kZXYgKnBjaV9nZXRfcGRldl9ieV9kb21haW4oY29uc3Qgc3RydWN0IGRv
bWFpbiAqZCwgaW50IHNlZywNCj4+ICAgICAgICAgICAgIHJldHVybiBOVUxMOw0KPj4gICAgIH0N
Cj4+IA0KPj4gLSAgICBkbyB7DQo+PiAtICAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5ICggcGRl
diwgJnBzZWctPmFsbGRldnNfbGlzdCwgYWxsZGV2c19saXN0ICkNCj4+IC0gICAgICAgICAgICBp
ZiAoIChwZGV2LT5idXMgPT0gYnVzIHx8IGJ1cyA9PSAtMSkgJiYNCj4+IC0gICAgICAgICAgICAg
ICAgIChwZGV2LT5kZXZmbiA9PSBkZXZmbiB8fCBkZXZmbiA9PSAtMSkgJiYNCj4+IC0gICAgICAg
ICAgICAgICAgIChwZGV2LT5kb21haW4gPT0gZCkgKQ0KPj4gLSAgICAgICAgICAgICAgICByZXR1
cm4gcGRldjsNCj4+IC0gICAgfSB3aGlsZSAoIHJhZGl4X3RyZWVfZ2FuZ19sb29rdXAoJnBjaV9z
ZWdtZW50cywgKHZvaWQgKiopJnBzZWcsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBzZWctPm5yICsgMSwgMSkgKTsNCj4+ICsgICAgbGlzdF9mb3JfZWFjaF9lbnRy
eSAoIHBkZXYsICZwc2VnLT5hbGxkZXZzX2xpc3QsIGFsbGRldnNfbGlzdCApDQo+PiArICAgICAg
ICBpZiAoIChwZGV2LT5idXMgPT0gYnVzIHx8IGJ1cyA9PSAtMSkgJiYNCj4+ICsgICAgICAgICAg
ICAgKHBkZXYtPmRldmZuID09IGRldmZuIHx8IGRldmZuID09IC0xKSAmJg0KPj4gKyAgICAgICAg
ICAgICAocGRldi0+ZG9tYWluID09IGQpICkNCj4+ICsgICAgICAgICAgICByZXR1cm4gcGRldjsN
Cj4+IA0KPj4gICAgIHJldHVybiBOVUxMOw0KPj4gfQ0KPiANCj4gSW5kZWVkIHByZXNlbnQgYmVo
YXZpb3IgaXMgd3JvbmcgLSB0aGFua3MgZm9yIHNwb3R0aW5nLiBIb3dldmVyIGluDQo+IGJvdGgg
Y2FzZXMgeW91J3JlIG1vdmluZyB1cyBmcm9tIG9uZSB3cm9uZ25lc3MgdG8gYW5vdGhlcjogVGhl
DQo+IGxvb2t1cCBvZiBmdXJ0aGVyIHNlZ21lbnRzIF9pc18gbmVjZXNzYXJ5IHdoZW4gdGhlIGlu
Y29taW5nICJzZWciDQo+IGlzIC0xIChhbmQgYXBwYXJlbnRseSB3aGVuIHRoaXMgbG9naWMgd2Fz
IGludHJvZHVjZWQgdGhhdCB3YXMgdGhlDQo+IG9ubHkgY2FzZSBjb25zaWRlcmVkKS4NCg0KSWYg
SSB1bmRlcnN0YW5kIGNvcnJlY3RseSB0aGVuIGZpeGVkIGNvZGUgc2hvdWxkIGJlIGxpa2UgdGhp
czogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQogICANCuKAlHNuaXDi
gJQgDQrigKYuICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgDQogICAgaWYgKCAhcHNlZyApICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KICAgIHsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICANCiAgICAgICAgaWYgKCBzZWcgPT0gLTEgKSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQogICAgICAgICAgICByYWRpeF90
cmVlX2dhbmdfbG9va3VwKCZwY2lfc2VnbWVudHMsICh2b2lkICoqKSZwc2VnLCAwLCAxKTsgICAg
ICAgIA0KICAgICAgICBpZiAoICFwc2VnICkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiAgICAgICAgICAgIHJldHVybiBOVUxMOyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIA0KICAgICAgICBkbyB7ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiAgICAgICAg
bGlzdF9mb3JfZWFjaF9lbnRyeSAoIHBkZXYsICZwc2VnLT5hbGxkZXZzX2xpc3QsIGFsbGRldnNf
bGlzdCApICAgICAgICAgDQogICAgICAgICAgICBpZiAoIChwZGV2LT5idXMgPT0gYnVzIHx8IGJ1
cyA9PSAtMSkgJiYgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KICAgICAgICAgICAgICAg
ICAocGRldi0+ZGV2Zm4gPT0gZGV2Zm4gfHwgZGV2Zm4gPT0gLTEpICkgICAgICAgICAgICAgICAg
ICAgICAgICANCiAgICAgICAgICAgICAgICByZXR1cm4gcGRldjsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQogICAgICAgIH0gd2hpbGUgKCByYWRp
eF90cmVlX2dhbmdfbG9va3VwKCZwY2lfc2VnbWVudHMsICh2b2lkICoqKSZwc2VnLCAgICAgICAg
IA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBzZWctPm5yICsgMSwgMSkg
KTsgICAgICAgICAgICAgICAgICAgICAgICANCiAgICAgICAgcmV0dXJuIE5VTEw7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQogICAg
fSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiAgICBsaXN0X2Zv
cl9lYWNoX2VudHJ5ICggcGRldiwgJnBzZWctPmFsbGRldnNfbGlzdCwgYWxsZGV2c19saXN0ICkg
ICAgICAgICAgICAgDQogICAgICAgIGlmICggKHBkZXYtPmJ1cyA9PSBidXMgfHwgYnVzID09IC0x
KSAmJiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KICAgICAgICAgICAgIChwZGV2
LT5kZXZmbiA9PSBkZXZmbiB8fCBkZXZmbiA9PSAtMSkgKSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICANCiAgICAgICAgICAgIHJldHVybiBwZGV2OyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0K
ICAgIHJldHVybiBOVUxMOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICANCn0gIA0KDQoNCj4gDQo+IEFzIGFuIGFzaWRlIC0gbXkg
bWFpbCBVSSBzaG93cyBtZSB1bmV4cGVjdGVkIHRocmVhZGluZyBiZXR3ZWVuDQo+IHRoaXMgcGF0
Y2ggYW5kIHR3byBzdWJzZXF1ZW50IG9uZXMuIElmIHRoZXkgd2VyZSBhY3R1YWxseSBtZWFudA0K
PiB0byBiZSBhIHNlcmllcywgY2FuIHRoZXkgcGxlYXNlIGJlIG1hcmtlZCBuLzM/DQoNClNvcnJ5
IGZvciB0aGUgY29uZnVzaW9uIGFsbCB0aGUgcGF0Y2hlcyBhcmUgaW5kZXBlbmRlbnQgb2YgZWFj
aCBvdGhlci4NCk1heWJlIHRoaXMgaXMgYmVjYXVzZSBJIHNlbmQgdGhlbSB2aWEgYSBzaW5nbGUg
Z2l0IHNlbmQtbWFpbCBjb21tYW5kLg0KSSB3aWxsIGZpeCB0aGF0IGluIHRoZSBuZXh0IHZlcnNp
b24uIA0KDQpSZWdhcmRzLA0KUmFodWw=

