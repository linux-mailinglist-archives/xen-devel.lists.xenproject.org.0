Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C786A3BBD74
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 15:24:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150230.277792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Oa0-0002h2-CB; Mon, 05 Jul 2021 13:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150230.277792; Mon, 05 Jul 2021 13:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Oa0-0002f8-7f; Mon, 05 Jul 2021 13:24:08 +0000
Received: by outflank-mailman (input) for mailman id 150230;
 Mon, 05 Jul 2021 13:24:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jU53=L5=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1m0OZz-0002f2-4B
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 13:24:07 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.76]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44c28a0a-dd94-11eb-8447-12813bfff9fa;
 Mon, 05 Jul 2021 13:24:05 +0000 (UTC)
Received: from AM5PR1001CA0004.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::17)
 by VI1PR08MB3166.eurprd08.prod.outlook.com (2603:10a6:803:42::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 13:24:02 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::40) by AM5PR1001CA0004.outlook.office365.com
 (2603:10a6:206:2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Mon, 5 Jul 2021 13:24:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 13:24:01 +0000
Received: ("Tessian outbound 1763b1d84bc3:v97");
 Mon, 05 Jul 2021 13:24:01 +0000
Received: from 62e03aaa2e26.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E87E741E-6B79-4A59-92ED-F9F956540526.1; 
 Mon, 05 Jul 2021 13:23:52 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 62e03aaa2e26.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Jul 2021 13:23:52 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR3PR08MB5753.eurprd08.prod.outlook.com (2603:10a6:102:87::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.32; Mon, 5 Jul
 2021 13:23:51 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::4a9:5afa:372e:97f5]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::4a9:5afa:372e:97f5%3]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 13:23:51 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0069.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:60::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.21 via Frontend Transport; Mon, 5 Jul 2021 13:23:50 +0000
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
X-Inumbo-ID: 44c28a0a-dd94-11eb-8447-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmqpiWhQDLnccsXoM2Qkk1dwrs3tCsLgyVwjedbcg+0=;
 b=No9cJub0XUD+u7QayWJAUjhcxgKlFjus0cOBX7AYU5cl/AtZ/WdFoHzt1AFl4siEDd9ncAowKqs03LXdaHqZJzQmhYpBZBGIk6esIeHUz5PcdJgUpgPGTJe0ePlGlItAUHgSE+jRkD998CFXbiiDyfnXaiZvzKebQhEf2GjzXeQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7fe1b51491c22c06
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ak69RY3MpnChUk9Ck6zsgeMIodM/HL2+gLUwS+14dnENMQd8ACXLdHApls2l6ERcusrljju44f3Xizsz8Dx3biifI+sIl/JZwCT+n8h7rdaqJrlppm1+puATtQ9pvRUw6VzX6RtOzQQple+jsVN1+NBXv9f0qc+/57ZX+YQ4wtp+FP4lYvdMSIE6PwS8s1oujpZEL2ooOtxd3iBieXFA9X90L3AKr7GWsjncsv1cZ/Am7aZj7f6iSeUNtVQgMc8grsevNpi3rfhpyy6UJHZw9SVOBfQV3v1QyDWNUxFo/1IrDtnO9XPnAyd4uxr9k53sm252fJpoXHr+aYk90PqNVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmqpiWhQDLnccsXoM2Qkk1dwrs3tCsLgyVwjedbcg+0=;
 b=fGWLYPvPMVRUdCCXVts6WQYOGIy6WS0R1koG9Mr+q+Ulpyu3+TyECeHEME+Xj/sdvEBIzvY3mB/vTO7RI5ztgOmylYg81inpwGLo6SJ9NXWoxUyI/vEryHmOuN+yyuhwUXTx3xf4Emj+lRQIVbReGk2vRjXwoLBtQ4dNw6KNDKKvMOkZX0c2SAu1eTrFpMM/Sk75f5PMc6RDtYgUA4SxdVUh7cY+VhD0j2aY7qNahN2nbcxCzag2xWKdZMYPaIIBj7Pde0UtsU6K6DI1Do9K2UL7Aj+9Fgp8O6XE3s9zhe8JeodFEk6paYzg1DasE6yHQ2JDV3OmDfuGch4U9dr97g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmqpiWhQDLnccsXoM2Qkk1dwrs3tCsLgyVwjedbcg+0=;
 b=No9cJub0XUD+u7QayWJAUjhcxgKlFjus0cOBX7AYU5cl/AtZ/WdFoHzt1AFl4siEDd9ncAowKqs03LXdaHqZJzQmhYpBZBGIk6esIeHUz5PcdJgUpgPGTJe0ePlGlItAUHgSE+jRkD998CFXbiiDyfnXaiZvzKebQhEf2GjzXeQ=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v7 9/9] docs/doxygen: doxygen documentation for
 grant_table.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <f1f026fb-33e4-4d18-5718-ae9f9f42327d@suse.com>
Date: Mon, 5 Jul 2021 14:23:44 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <54ADD75F-83DC-4891-914D-B85FBA69B440@arm.com>
References: <20210705105103.14509-1-luca.fancellu@arm.com>
 <20210705105103.14509-10-luca.fancellu@arm.com>
 <f1f026fb-33e4-4d18-5718-ae9f9f42327d@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P265CA0069.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::33) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cf8ec67-7bbe-4498-4338-08d93fb82791
X-MS-TrafficTypeDiagnostic: PR3PR08MB5753:|VI1PR08MB3166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3166DCA0450ED462DE4E3D26E41C9@VI1PR08MB3166.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HY3XJPKif8DF6aGNbxIpGiGhSgPh9DPuZBrtDn1X4wblZCLFL8eeYtqwGlpKsJniZXXkDlUQ5ri7vnIYhLPNO+dMJE+NxbxjPE739xdEVDIKoURaQi1How2jjAzukxy5kFBmCpcIpt0zMK+WjAaddHCZWGf7QJhS5pj+jT4jvU7024Lp5uzqBrq2T4PkWUZ8WvAQorKlbZxyDS10q0c87pT4jc/ZQASS6A4FLv4C333AS6/iWx6a3GPSd+vx5MGcKo4XWAESppWKXcvidznjaoqpr5dHNjicXYUBoM/EnAAbtW9dHldLugJaXt8LW1YNBV6cdy3sLLikL4l4AOCiVbW4HTe28QoEhwKB02nQnQudahyDNaJ+PJcwV8TXY1ldylb/TAM1ZPiD70AohSD2YluUke4tBfg/UeyTxK5fofaweh7aLF5cDNZYLlqHL1uQLYiY92U8OeBl62VoRlkTSQe6Bqumk31KW1DibBQZKgZu2TYyNmwz78yonYGgMw1/VnyZFi/G1rTdHocufdq3pUHJzWIf4JCqqzlqHuSaLjybPIVb04JTWLMr+thNd50H8BEmToY8dGVnbOn1GFgjBIqwKk2LfHHl2lCdI5I0eLqc2rpbw0cjpJsirhaL1zJjEvUc59zk9Ug0lp9b5yZrN30nBU+mRcYLWcS1uCzkPZHN8HjhlJ/fHk5eGabYAo5q4DAtobGKm6wjGQ9X/2I9FzGGHYVWiqFowVTrdwb3BWI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(478600001)(8676002)(956004)(186003)(16526019)(6512007)(66476007)(5660300002)(83380400001)(4326008)(66556008)(66946007)(26005)(2906002)(8936002)(44832011)(86362001)(2616005)(52116002)(36756003)(6486002)(6916009)(53546011)(33656002)(6666004)(54906003)(38100700002)(316002)(38350700002)(6506007)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RlphazZvSVBYTzhjK0FGSThZVHRLN2l2cmxFK0ltTDRGNndpYkVaQ2EwYWZL?=
 =?utf-8?B?VjNlMWRtZDBzbUlGZkk1Q1FDMG92NHRxMmMzYXp5am1hbnF4UThiYnJidDlH?=
 =?utf-8?B?QkN0TGV5YXBJcnhuaGdzRVFMV054azh2dXRuazZCL0V0Rk44azN5NmhaL2kx?=
 =?utf-8?B?NEZlYXN0UGhPZEpFSWU3b2N0VDROcHJLejM3WkxFaVVkU1RIa2F2T1NPQW5J?=
 =?utf-8?B?Q3VvcUdmUXFLN1ZWWGRYaTNWWWdManFiVXNxZFpTS09hdHRJdlNkaVMxWXNa?=
 =?utf-8?B?aGVxNG4ySDlZaU1pWVRhSkdLeVh2dXNKQUpaTjgyOUIya250dUhqcXQ0M1Yr?=
 =?utf-8?B?UHY5Q242WHhSRldKaG5SUUQ0UEFuaXJyN1Q4d1RWRjFRSzJmUTFEVmhmS05x?=
 =?utf-8?B?bFNVTmtXSWZEd3grVFJSYUhTUk5Qa004UjRoMFQwaDliQXViVXZDREo4UE5H?=
 =?utf-8?B?eGI3elAzNEczU2VML3dteVVGckhPMEpYUVhmeDB1dmRQUCtJM3hLWEFKdHpy?=
 =?utf-8?B?SVVzYVM3NEVIUnJFYVhqQmZIRWFQRlBmOEE0TDh0ckt2Z0RqU1hMUEsyQlVH?=
 =?utf-8?B?MngxMElVM0tJMjU0ZmV0d2NralhhekRlVW9TVDBDb3pUUExDVmNqMi8zc1VS?=
 =?utf-8?B?UUpGZGhURURDeExuWXduc2tWYjNTUE1kb3JTRGFNeW1IMklMZ0tHTlVncW1x?=
 =?utf-8?B?Z2NhTFdVVjIya0NTcThiZFZGMU9oRWc3bHBMcXJ2WXBQaVd5NUlJZkkwMDJ5?=
 =?utf-8?B?SUtjNTNjUm5WZTFPcVpQczZ5QUFrOUpwOGd0NDlmR3RxaWpOWVBGcE1KalNZ?=
 =?utf-8?B?TndzQ21vY01kMzVraisyd1RKU2VYR1ZJMXpjVVZ0VE1wOXJDNVZJWk5nWDgr?=
 =?utf-8?B?VkVyOFBCL2lERjBXVGtjcWtPNnNZUmsvYW9SM2ZBWlIwVjNDVUxBVllvcjVP?=
 =?utf-8?B?Mkhady9JT3FEMEhxeTVUa2M2bFpBclhyRG8vWmtxTjZVcGFlMjhNQUhsb3RK?=
 =?utf-8?B?ZnpaaEQyNjd3ZWtHSTNFSm9SSmtRV2hCV0d4c3AzQXlFTUh3THE3a1dZcSt3?=
 =?utf-8?B?NVUzdlFzcFZJb0dSU0piNXZCcTNDd0RwckJYRGJ0TEwxZjkyZG0zbFFhUiti?=
 =?utf-8?B?U04zYzZidVM1QTdNSGo1V0JadDlCaktUM2ZHZzU0Vmh3aXYrclRqS0RzbmZM?=
 =?utf-8?B?VlFBREZzZHd3Mm5qcmRMUEplOHNsQVhwaXY1UFZxZDJEaFlzRkFjNXBpbFI1?=
 =?utf-8?B?bmthUDhKemVXTzNHM2ZUK3BrZ0EzOGhLMmU2a0R3K3NNcjdZMHU4NlhkWGdu?=
 =?utf-8?B?c1dBdEhPVWtlSk5CVGI1Mm90TkpKZFFhWkphRXBGUEdNYTdNK0RIdFJRVzNl?=
 =?utf-8?B?Q0hGcW5EZFc4YVVzUG83R0FOSXcrT1BYc1ZUVTVOdHpiTkU4MDNEbitMNlZX?=
 =?utf-8?B?emJYM2gwT3FiODRCdW9pVXl0SlpiQTNSa04vckpaWFRhWHQybnNSL0xJZkpU?=
 =?utf-8?B?S2xJdFZXcEVuTERIdU9hK3pUbTJkTWROWE8zYzJWbFQxNkVYWDFFdytEdU4v?=
 =?utf-8?B?emdZNVFNWVJkZmJ6TmxwRHAwZGVNV25VcDVoSGN1NzIwMWlNTjNpT1pMaDFK?=
 =?utf-8?B?YmVKZkdubk8vdzVHQ0JkdWlwaGpWbHdPTUFNRFRRNmozakdEenNNSTZORDVP?=
 =?utf-8?B?NmtKbGo1LzB3eVBZeEowK3AxZ3pIUU9aNUhNYW9KbFdBVGdWNlQ3Mk5mczNN?=
 =?utf-8?Q?qsbZPIvbUrVCIh1UTNBQIPjEyd1hdV7wTcfEhz9?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5753
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4c60a6f6-be0c-42b1-6f94-08d93fb820d6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MmWhkMtFe+1Ni2DvYogexTfZLYg0MfICgj31alnwcvzhFHq4FJzxrXF9sMf9vaz+Hoaq8bspMqAEFZQ2VbR0OGxDx5bSMQoKWt1QFU1okf4RGd1FpQ2Oz61WZp8RHAgCjlp7SczisDLLW8XgKw3D59AsXnzWHzdzhPIFJ37EaSIRPMzsfDAA8E7KuvsLkXqumjze35LpAnPF07o5mBCZYB/ub9Qh5ri7vfCldQcCZJlfJMjX6nEOjSI7R8GFnUEs1oCk8gpp3w9YH2g1x5Dp03UJnV97qwqKV9XsBS5+NdBUykNDiuNtf6x6JgmspE5+GO13QzBaDDnYl/yMhsKhodU6rGCeFHJKhGGeiI8OPRoMRNHUGew5I+VmMuJhxPNYCfMJMSeq6aFh/4Rq1KlvyNjnbjbUL2Azq1aBy3ARLwaAhgDef8gK2PN7fdqPHIVKsZd57kkH4pxGtE/deJE9Wc1Xx4rc/28eSMJVPeQaeF6DdfXje7fjb/aSGxXCj2z8aOaAyCvgjTF5jJpo8W1kDr1I0Mk9JaS3STCiZncmDQnfYgRrBGLXgIlxxnbOrGNeKJfxvQ3CCSj/xPUAYzyjJ/dNfEQib9w8/m7r58MopbOSzlJgN+qzXa4KtT4PX60lU0WA0Lo9t/OTiVpl0KgibxpSAToJTRxxq3N9aqfiiX+LTyysA3iksJVqRM3ZzlRFdcwZ9oOCMYvdHPqujd9Q4w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(396003)(346002)(46966006)(36840700001)(2906002)(6512007)(86362001)(26005)(44832011)(70206006)(70586007)(82310400003)(5660300002)(956004)(6666004)(54906003)(336012)(53546011)(6506007)(2616005)(36860700001)(16526019)(82740400003)(33656002)(6486002)(83380400001)(47076005)(316002)(8936002)(81166007)(186003)(36756003)(356005)(6862004)(478600001)(4326008)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 13:24:01.8860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf8ec67-7bbe-4498-4338-08d93fb82791
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3166

Hi Jan,

> On 5 Jul 2021, at 14:03, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 05.07.2021 12:51, Luca Fancellu wrote:
>> Modification to include/public/grant_table.h:
>>=20
>> 1) Add doxygen tags to:
>> - Create Grant tables section
>> - include variables in the generated documentation
>> - Used @keepindent/@endkeepindent to enclose comment
>>   section that are indented using spaces, to keep
>>   the indentation.
>> 2) Add .rst file for grant table
>>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> v7 changes:
>> - commit message changed
>> - Add comment about grant table queries and uses
>> to the documentation
>> v6 changes:
>> - Fix misaligned comment
>> - Moved comments to make them display in the docs
>> - Included more documentation in the docs
>> v5 changes:
>> - Move GNTCOPY_* define next to the flags field
>> v4 changes:
>> - Used @keepindent/@endkeepindent doxygen commands
>>  to keep text with spaces indentation.
>> - drop changes to grant_entry_v1 comment, it will
>>  be changed and included in the docs in a future patch
>> - Move docs .rst to "common" folder
>> v3 changes:
>> - removed tags to skip anonymous union/struct
>> - moved back comment pointed out by Jan
>> - moved down defines related to struct gnttab_copy
>>  as pointed out by Jan
>> v2 changes:
>> - Revert back to anonymous union/struct
>> - add doxygen tags to skip anonymous union/struct
>> ---
>> docs/hypercall-interfaces/arm64.rst           |   1 +
>> .../common/grant_tables.rst                   |   9 +
>=20
> In patch 8 you now add arm32.rst and x86.rst as well, so it's at
> least odd that here you alter only one of the three. However, ...
>=20
>> --- a/docs/hypercall-interfaces/arm64.rst
>> +++ b/docs/hypercall-interfaces/arm64.rst
>> @@ -8,6 +8,7 @@ Starting points
>> .. toctree::
>>    :maxdepth: 2
>>=20
>> +   common/grant_tables
>=20
> ... to me this seems the wrong way round anyway: I'd rather see
> common stuff not be linked from per-arch locations, but per-arch
> docs to be down the hierarchy from common ones.

The things is that common stuff is not really common, if you go and solve e=
very
define and so on, you end up with a different content for x86, aarch64, arm=
.

So you can=E2=80=99t have a common.rst containing the common things because=
 depending on each
platform the content will change.

Thanks anyway for your feedback, I think it=E2=80=99s good to make the comm=
unity know these changing
and discuss them all together.

Cheers,

Luca

>=20
> Jan


