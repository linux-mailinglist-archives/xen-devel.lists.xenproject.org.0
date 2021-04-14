Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7E635EBB5
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 06:24:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110222.210392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWX48-00045Z-An; Wed, 14 Apr 2021 04:23:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110222.210392; Wed, 14 Apr 2021 04:23:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWX48-00044m-5D; Wed, 14 Apr 2021 04:23:48 +0000
Received: by outflank-mailman (input) for mailman id 110222;
 Wed, 14 Apr 2021 04:23:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yF16=JL=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lWX46-00044V-PF
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 04:23:46 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.88]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5446e9f-2a32-4271-997e-ab558357917b;
 Wed, 14 Apr 2021 04:23:45 +0000 (UTC)
Received: from AM6PR04CA0008.eurprd04.prod.outlook.com (2603:10a6:20b:92::21)
 by DBBPR08MB4346.eurprd08.prod.outlook.com (2603:10a6:10:ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 14 Apr
 2021 04:23:43 +0000
Received: from AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::26) by AM6PR04CA0008.outlook.office365.com
 (2603:10a6:20b:92::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Wed, 14 Apr 2021 04:23:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT051.mail.protection.outlook.com (10.152.16.246) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 14 Apr 2021 04:23:43 +0000
Received: ("Tessian outbound 47ca92dabae7:v90");
 Wed, 14 Apr 2021 04:23:43 +0000
Received: from be6b4dd75a0e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0F5B6655-C50D-491D-90ED-B15AD3D31F6B.1; 
 Wed, 14 Apr 2021 04:23:37 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id be6b4dd75a0e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Apr 2021 04:23:37 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB3343.eurprd08.prod.outlook.com (2603:10a6:803:46::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Wed, 14 Apr
 2021 04:23:34 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9%4]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 04:23:34 +0000
Received: from [192.168.0.11] (82.8.129.65) by
 LO2P265CA0367.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a3::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21 via Frontend Transport; Wed, 14 Apr 2021 04:23:33 +0000
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
X-Inumbo-ID: e5446e9f-2a32-4271-997e-ab558357917b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/Dq2cy9NxK/tiUL1TVPJyz45kZREAyGBq8vIS5Uin8=;
 b=ZqiIH+2uECUQWmBHBptRsf0nyQ7o73MJk9DBS0B+yxPi2vYKr3ESPhOH3wifL3JBpNKMhDzQy8VWxZNoS3U/zK/4I0OFicjUvAR0soFFIxJodj6cC6tzUgLpTymY22CulMlvmNvHyerK47O2TW7TMg89Gfcth+wqN5twJPDo3gg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 75835d679b8bc0fb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOXlkl/qRmpBLQendHx2/r+AVcVyKygumxlSlgh2dJru4I8yuihaTYoNJfrZrwKW0jeuAYimQI6sD/naGEQhMMuIzowO+2kzv8kN5PQJyHFsSG5cO9NG65rYM7mGDIZwbopPQYEwH6UkAQBXXpzer798RZWA3dygRyD3NcBY8FAIKONdrMwYxCjrTtk4tPG+XOGJ0xHukgRsaBeVPrG8ln3zRnBKDFOLTOCbYO9rjcUzayXT2Le7Hg7ymlHPpN3k9aSCurdkt9CivTbIe3lBQxrbOmb2T8CNMxqnAjdu/PVhHsxTqI0KxJm57YiqEtoNVTNkZWNzojdzXU4DDIRmFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/Dq2cy9NxK/tiUL1TVPJyz45kZREAyGBq8vIS5Uin8=;
 b=b7PIXAL9+eihzrjZx7Si/SKcOQt+1RbrDaZWGhoYrXvKmfzsiV8vrK4TMjR0duoMb6LzmoeMIu9itQ1tlqMFRTLtcl3BbdchvYnPnxjkvnUeu4mPdJYEB9KUxLG4I7hGqB6hgOBnLmuKlXX1f747ZyaFZLcv3IJOQ9FfI5mJDeZ0tC1doOxqueTqe19cEzN2LL1y+JDA3co4MFK15oIbfZiKVnfo8ozK3kocjuz/JzBdhvrJrFWHGaBNfwoViRqoopaE2rKLA/x62afpHMGO0lAhxVe0FmZXkMQCkUk85VyeYxY32lxsAiQQXHZfYHsgGM94axn4VkAxzkIJaMnm5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/Dq2cy9NxK/tiUL1TVPJyz45kZREAyGBq8vIS5Uin8=;
 b=ZqiIH+2uECUQWmBHBptRsf0nyQ7o73MJk9DBS0B+yxPi2vYKr3ESPhOH3wifL3JBpNKMhDzQy8VWxZNoS3U/zK/4I0OFicjUvAR0soFFIxJodj6cC6tzUgLpTymY22CulMlvmNvHyerK47O2TW7TMg89Gfcth+wqN5twJPDo3gg=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v3 3/4] xen/arm: Reserve domid 0 for Dom0
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <db54612f-e237-2084-f11e-ffd5e045c3dc@xen.org>
Date: Wed, 14 Apr 2021 05:23:32 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <60A07B94-1499-4313-988C-60EE987B43AA@arm.com>
References: <20210412105243.23354-1-luca.fancellu@arm.com>
 <20210412105243.23354-4-luca.fancellu@arm.com>
 <db54612f-e237-2084-f11e-ffd5e045c3dc@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P265CA0367.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::19) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2b9289f-92b3-47fc-551a-08d8fefd16a3
X-MS-TrafficTypeDiagnostic: VI1PR08MB3343:|DBBPR08MB4346:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB4346AC3C841A06D8F67C82F5E44E9@DBBPR08MB4346.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 60JiIwDK6cTUtjtr/fa8dWhivLh8dbjoe0qko6oG3upidlqPmz6jFeb1nUvGdWHjhX7BFzJV3mpcceh/77VcdWEyKTIGJ1pPRVDF51prme6yRD6M2HGxoXZomGENzskN1jjidjUg9kNraAm0O9cax6lsjCUIFSUvK9soFMb0O45qBCNSwfhQAhZ2reB6RAhoosFTVR13TEdJ2zRZ35SQPKwmeUq1BGQ0T35PjGFZABg3rlt72HoVZ5eSH9iil9q+ANPuuhEyLu8M46seVI6zXLB2AuOcc4hcC/QpuMLiRr8BGrYG8I3xX8cNKpfde04/LtNvtwqLS9vohOGcpBs0oD7G3kJfytVnO0gIzNBdCeBQgonfSX4krc1iDHWq4efviZ62KlsaNDILsfmm2x6VYBeZDSKoSBZNWbIqAI6A6uWXrP9b5CkCdxdxFT+3WLg+pOwed60+NCra4zPE0WF/Jnx2ShYY/N5tpLOnFRrLlCrMxKSMNWXUZ7pgdiZ1Kyht5BewTuMWt49dWZfnQtp8l1L7KLy4R1yECtxYJBeh76opIqRUBbjCTkzdEMWZQMdidJrvlecarbG4UZJ7y35qaz1CXUdKJqAlVtH+DQkptneL6ssjImS72OUf0ocK2lCFaU5xGJ247sONwoKp/56HVWvZ3/wPuTWevtDtcN0Gna5j/C72kKGfq0ZR/4RZSRz0
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(346002)(136003)(396003)(366004)(33656002)(186003)(52116002)(478600001)(16526019)(956004)(53546011)(2616005)(66476007)(8936002)(6486002)(86362001)(8676002)(66946007)(6916009)(66556008)(38350700002)(2906002)(316002)(54906003)(38100700002)(36756003)(4326008)(83380400001)(44832011)(16576012)(5660300002)(26005)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?eXBvRjR0N3F5ODBBb3RpRWo0Mndka1lLeWswcW9CTVRxNDMvaUVJekE4ZGNP?=
 =?utf-8?B?VUZ3NGtnZDhQWjYzc0svYytFU3Q5TVB3OSs0dW5TaXVTaDNkc3UwYUhyZGtq?=
 =?utf-8?B?QTJIQkE0ZTI3VEN1My9RbmJDRHNqZGlna0w1Z3FmOU9GOFI4Z0daT3R2SElY?=
 =?utf-8?B?YjdXUEt0STAzU0c1STdiSjVjV080RFdpd3NvME1NUUVYRnV4S2Vsd2g2T1NG?=
 =?utf-8?B?VUwrTUJvaUhqZ2psRm42WXB4UTE3YWlabm56VkRIYkJDR3pBSm84UHJhdHV5?=
 =?utf-8?B?THNSZFpvUDgrNmQvLzI0RWM3NFRZeUVWYldyZGQrUUhpeTBnMkFFeXYvMHIw?=
 =?utf-8?B?Z0RORC9hb0NLanVhYmNWMWRueFY3WkpDbW03YmJaR2F1YVAzUEh1WjhpVlFm?=
 =?utf-8?B?ZERUWENJVnd5ekpmbWNSTkZjMnRjZkEvMmo0QjJScEluZmJhejByN3psNG11?=
 =?utf-8?B?cFl5STNmbFJHbTR2KzEwSmxBZHAzLzhzVnowV3NZTE5EMmt6Tzl0MHJBM3Q5?=
 =?utf-8?B?bndqUFZsMm1zUmlIaG5KNGY5Vklub3ZXMk5JWTIwSUNBTUVYaGJ1L1BkeGV1?=
 =?utf-8?B?ODJpY295WThtUHBmLy9UQXE1WE9BN2gzMXY2VThaSzhBT1orZ2lsSjg2c21G?=
 =?utf-8?B?Q1ZZclZYTWw0UllwckxOUCtKR1kzOHBrQmdsSFZ0RElIWjQvMlpjRjZLTFFh?=
 =?utf-8?B?dHJkT1c0YWtWTHp6T29QTUdFb2RsajRJRnVuWTdLSkdKbkJSQ0JvWVpqaXRP?=
 =?utf-8?B?NzZoOXNJb0k5dWxrYXRHdWJwYzhra0pLRVJKelplWVFlM09aSEQ1aXFRdVdD?=
 =?utf-8?B?U1NydWxBb1k3RVNkT1JLNHB6M0J3TXZJTjQyMHVKZXUrbmJPWXpMZElPbVZo?=
 =?utf-8?B?TDd5bGtlMmpId3htcHNzZVhnVlR5TTNEeDQydWRxZjVFd2pycnVPUE8rQTI5?=
 =?utf-8?B?Nk0vOUpyd1VTbGlNL0lvQ2prcG5QRmxtUWZObnlLc1VJcU5VUmRCVWtTQ0NQ?=
 =?utf-8?B?UzFYVG0vYUIySmEvSWU0bnA3akFja25GRUYyaG1ZTUJoeWVlMU5HMUZVQkdk?=
 =?utf-8?B?ZTdYcEt3NGh6L2dCZ0gxMXZkZTUxcjM5SHd4Z0Z6UVAwTUN6U3ZtM1ExRmo3?=
 =?utf-8?B?bzE0UVMzSytEeEZlcVJsZFdMWkQrUEVuK0tqRkJYcFJ6Mm1LVWdqbnh0WkRM?=
 =?utf-8?B?MTU5OXplYlZKb1hWTjZBMTY0STZKMFh3WGdjbmlXQ1Z5QkhEelBtTFhhbTc2?=
 =?utf-8?B?V250dWJwNWNCQUYwSWtYRDlJTm9GanhFRktNR3NNUFg1TXplcC9wSFVTcU5L?=
 =?utf-8?B?WmxmT2ZGM1RlTHhQd2lTelhoMnFwbTVPZHluN2NpR0pJSTRoQTlzb0tFNjMr?=
 =?utf-8?B?N1RXckc3SWxHSmxLMXoxYzFFejdqN0VjTFBoWHdTRmtGVXNJcmpSSjI0VUYz?=
 =?utf-8?B?bVFwNVVyODRGMTFVWFhEVXRuUWk2SENpUG11L0lkMTc2dWRTZzk1WkZHWEJr?=
 =?utf-8?B?eEZoSlV6MzFIM2ZWM0pSQVRlZkJrTVZxR1BKK1JkalhtemdPOHd1UmtBcXRB?=
 =?utf-8?B?bWUxNWJrUUdCYmlraU5iVFFEUytMbjRmUkRFNkNvMTZwVUdKUW92TkJTdXA1?=
 =?utf-8?B?U2N1VFU5MUgraUhZOENxZTNJbXFpU3lQdEo4TXorK3YxaUFMdkZGb0tDbVdk?=
 =?utf-8?B?UGNtNGk1TVFTdjhyWXVQK3pKNW8xd2FMTCsxWFQ3MSttMVZoeXZ6anBwZnp6?=
 =?utf-8?Q?Qps5a4AJ6oOdAgPDjGu0PnmSYU/RieEcIBxjFxK?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3343
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bcda8cc9-7fa0-4f9f-89ba-08d8fefd10cb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uncOkAislKRUAL+3jZDZT/YdpBWZsmvk3FJ52pd4ttVZDVJSnwP8ELlIymOjsNbdkh6zO0LW5IcLU1BuvMCzYFlp00nTQXypoThpe6wezEo2JqwDAQ/ifmpJOBQr41Cee0nw47ZyM1ai6B7jGJPAXU8dvtLwinwVsWoS+ck+rZgd5IYLwMNDjbFJfLOuTe/e5ZSXdUjQEm5XUhwWbAWPjdRD5NhpHvBMyN2nYvLOBTCbNBBogQGXC6PsVFOE8/DUSejcVtfXX1PwzrPaq8FvrQ7LKu2+qJN2H5lQSDmTj2ELYYItlbo87WeXr/lYYy/PSqy/m4JR/HtsjPJMLo70q/WjcB/G7sc7+9XndMoNKHmiJx6cqmZreuP+xKe2VFV/KFf9qGFyAxoPWelOk9vPnkviRpLKDk7DFvGWrtD4UKEy1LMtlv7pVmfIe8aykLSTMj2vHX9MkAV0SZzEKzy5n96a54f3iqv4Sdw/lODD1I2M1FVAgkyylIb1lMoeGNr+tFW3sQsI/k8gRtw6cTNT/l98JC9tE53XbGSyczZw0IdkDuZVjY2oXM6hriY5skEenjU5UVwNHRHh9A1wprfKi4VGMkvcCKjYFiC5gv2xAohBg6IIiu9E208fteBAmw6JTgcEukX8QJUTKB6qUO6c+StNoKN/lUmnPanaP0+xqWo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(376002)(36840700001)(46966006)(81166007)(36860700001)(47076005)(82740400003)(336012)(186003)(16526019)(8936002)(8676002)(5660300002)(478600001)(316002)(33656002)(70206006)(107886003)(70586007)(6862004)(2906002)(53546011)(16576012)(44832011)(956004)(82310400003)(4326008)(26005)(6486002)(83380400001)(36756003)(86362001)(2616005)(356005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 04:23:43.2379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b9289f-92b3-47fc-551a-08d8fefd16a3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4346



> On 13 Apr 2021, at 18:00, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> The title probably wants to be updated as you don't really reserve domid =
0. How about:
>=20
> xen/arm: Clarify how the domid is decided in create_domUs()

Sure I=E2=80=99ll update in the v4 patch I will send soon

Cheers,
Luca

>=20
> On 12/04/2021 11:52, Luca Fancellu wrote:
>> This patch adds a comment in create_domUs() right before
>> domain_create() to explain the importance of the pre-increment
>> operator on the variable max_init_domid, to ensure that the
>> domid 0 is allocated only during start_xen() function by the
>> create_dom0() and not on any other possible code path to the
>> domain_create() function.
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> Changes in v3:
>> - removed check introduced in v2.
>> ---
>>  xen/arch/arm/domain_build.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 359957dc1b..b1d7b9849f 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -2508,6 +2508,11 @@ void __init create_domUs(void)
>>                                           GUEST_VPL011_SPI - 32 + 1);
>>          }
>>  +        /*
>> +         * The variable max_init_domid is initialized with zero, so her=
e it's
>> +         * very important to use the pre-increment operator to call
>> +         * domain_create() with a domid > 0. (domid =3D=3D 0 is reserve=
d for Dom0)
>> +         */
>>          d =3D domain_create(++max_init_domid, &d_cfg, false);
>>          if ( IS_ERR(d) )
>>              panic("Error creating domain %s\n", dt_node_name(node));
>=20
> --=20
> Julien Grall


