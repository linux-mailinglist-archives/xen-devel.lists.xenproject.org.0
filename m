Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4001B33DA40
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 18:07:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98417.186705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMD9w-0008AN-0h; Tue, 16 Mar 2021 17:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98417.186705; Tue, 16 Mar 2021 17:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMD9v-00089y-Tn; Tue, 16 Mar 2021 17:07:07 +0000
Received: by outflank-mailman (input) for mailman id 98417;
 Tue, 16 Mar 2021 17:07:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M/08=IO=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lMD9u-00089s-B7
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 17:07:06 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.88]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60d6f742-51ae-48d8-8dd3-7b6466fd81c4;
 Tue, 16 Mar 2021 17:07:03 +0000 (UTC)
Received: from AM6P194CA0019.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::32)
 by AM0PR08MB4274.eurprd08.prod.outlook.com (2603:10a6:208:148::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 17:07:01 +0000
Received: from AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::64) by AM6P194CA0019.outlook.office365.com
 (2603:10a6:209:90::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Tue, 16 Mar 2021 17:07:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT027.mail.protection.outlook.com (10.152.16.138) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.30 via Frontend Transport; Tue, 16 Mar 2021 17:07:01 +0000
Received: ("Tessian outbound de94f9ae513a:v87");
 Tue, 16 Mar 2021 17:07:00 +0000
Received: from 0c995e595dc9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EDF8E1D4-0845-4384-975E-0F31808A12D0.1; 
 Tue, 16 Mar 2021 17:06:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0c995e595dc9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Mar 2021 17:06:54 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB4631.eurprd08.prod.outlook.com (2603:10a6:10:df::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 17:06:53 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d%7]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 17:06:53 +0000
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
X-Inumbo-ID: 60d6f742-51ae-48d8-8dd3-7b6466fd81c4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mm8MdkA4KdSN0n1Dij2AW5qLN6F/GlSkM5fRrXQnwNk=;
 b=FgaJHwzWBao7BLSz9XPQb5IaEJ67T5DuiUE7QRqRSVDY+v5ke1bKQvYWRCLduStbE5KCuItbxoIQJuYW1M10rw4HHCCIpjTdGCfMNTy1vHhRCiAlDLw32Z/TnVtO4+sBHuz2M2SCYlLIjRVi+wlsO0ECeV19JJaxVlTTw9TpChM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 835dc192ede73ba6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqb9/1pxzngVSxxD2hXONK5EU8LKs++m4HtBJP9ckh3ZQUTexEhgBganUBeNlpCHXcLUajIGr6eBjqwTLgCqms7yN4vFW9OH9Vbd0TZL6rPk34gbY8xvCDw2kxog81Dq6+HFSqctNXtWHV9hd176EUquDUzD6bCTJbdGCpDozSzSVp87fZIHSY1Oe8tL4bZDEudrZN+DN2SkiF7lM2JlVeAYXZsxUe3mx8heJa9tVNP2PVU7jYPxtiVxvi6+acC+/bSm2ztx3q8lvt4ZYLk8MxTmyBtRsMgiIhUurovDug95OfYtilgAbNGmylPKVM0DseovOTUXK1+x0ip9gPPWsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mm8MdkA4KdSN0n1Dij2AW5qLN6F/GlSkM5fRrXQnwNk=;
 b=eZFmQjhAhGpe2wWUA20MG0tEO9wVcgMqGzmb4rvC6/RD3gnO/g0IShulrDA+u5WBv+0grXJTsoyBZap/EPZ8F0xbTv6/YGO8c3QLmX11FunqosETTF47vOgRJArudopoIDM6eMY+S6b75MD8RAtnNgl6JdIFoNIJoeJSFPauzqbA0RkJ3cndXADIXtRbJGKxF+kCNf+JsxRdoSAlmeAomCeP+CCIrRW/EQrWZY3L6dCmUYH4J2BdIB37J+qJ9lqzPEXEhiJ4HkazNWbmwGKNDAhYu/RKKcXIVWcqcuoUvuhK7PAvb3Dby3qlp0J9JjxnGRN8L8guojNbikm6kfDcXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mm8MdkA4KdSN0n1Dij2AW5qLN6F/GlSkM5fRrXQnwNk=;
 b=FgaJHwzWBao7BLSz9XPQb5IaEJ67T5DuiUE7QRqRSVDY+v5ke1bKQvYWRCLduStbE5KCuItbxoIQJuYW1M10rw4HHCCIpjTdGCfMNTy1vHhRCiAlDLw32Z/TnVtO4+sBHuz2M2SCYlLIjRVi+wlsO0ECeV19JJaxVlTTw9TpChM=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 0/5] xen/arm: smmuv1: Fix stream match conflict issue
Thread-Topic: [PATCH 0/5] xen/arm: smmuv1: Fix stream match conflict issue
Thread-Index: AQHXFRDsIQlmaPX4d0+O/QrVoxXC06qGwSeAgAAiOwA=
Date: Tue, 16 Mar 2021 17:06:52 +0000
Message-ID: <422FB89E-E5A3-446A-BCD9-650F4EC79BA5@arm.com>
References: <cover.1615312254.git.rahul.singh@arm.com>
 <7b521058-7e83-2651-aa1b-02098e9bbc19@xen.org>
In-Reply-To: <7b521058-7e83-2651-aa1b-02098e9bbc19@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cef07b92-016c-4a7f-c468-08d8e89dea5d
x-ms-traffictypediagnostic: DBBPR08MB4631:|AM0PR08MB4274:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB4274EDA76B0C7C69ACAE6E49FC6B9@AM0PR08MB4274.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:923;OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QpcMOaQ4OY+KOE0WX9y2GT3MojS8SDDJHrPKv2HpyNX+Fch+h2CKOXaHTsmp748W0KKygp2tKTRGyHOckhvHO/UC71aKgGKsZGCBY+RwXpuavmYEHRAsWW7iFiJg4xKXExRubq4W39vdKUvuE0cV0qCqOsz6RrIiOU6NlD4g+9VUvXeNaKLO2I6fFPH+KJ7pFFzs0XUEqpdXocsyiklxN07U9oTDAUf31atig2dO7A2hw02WOn0G2bUDlQQG5BLaVSdu1gQOKRCr5J/k64LNB5v13rjn1quQfdpz+3xXnXUthfb+kZEXBGUmif3erSzLJ3ittynk1kki17qduxXG4e4xUQBdd7OQkDkasUemnfZsAlj7yOwpfuvTtIgCSj7w135HUR0jxof43Hc+37iUPg4TLNlje125v8taGnvRqB0PkRrQP5wHWR/d4gtytV4qwy7iSmXZJewh1W8U5riygjtjBhLRWy5Mv1Dhk10nMRrANrnHGH+rF1dsiCXK5HTnboJFvaL+M9E0tFPUlq7sdvY9Au3vxlmQl+aqExxWAuVqa702TwVaT/oDie3NpGtePYgbGYpkXR4FuEt0k24+0V5hTn7vfADcdzHFp2OWuE5aFu/Rb4milB/fSMkCK0/i
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(366004)(346002)(396003)(316002)(2616005)(6486002)(66556008)(33656002)(86362001)(6512007)(71200400001)(36756003)(2906002)(64756008)(54906003)(91956017)(76116006)(66476007)(4326008)(6506007)(8936002)(53546011)(8676002)(26005)(6916009)(66446008)(5660300002)(478600001)(66946007)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?XujBSLXN7AJVdJyQiR6geNuhMMBCqGCqM4jOGUbYfungsuJjvGKqJQOwzmWZ?=
 =?us-ascii?Q?0q0fu36Gpsq9JeF8rZdvv0a5uUQAGVZxToSogL7JZTLPVc6Z3mR3WO0HIhP/?=
 =?us-ascii?Q?BJXH2aTTw+OHr14bsuIz0THEk3ZpK2Oa2sZCdVXQK8Hz3Gd+czq2xioVMDRV?=
 =?us-ascii?Q?WdBLjgcaBVZtinfquao2Z/TIGUX48Koc0xcXmVpMVm3nGb/QSJguvjfdq9NC?=
 =?us-ascii?Q?B6XNVY56yFHjqpkhXKPdp+kz/ATWQzm9EPxZLQ3SkAOy5u2ZBZ2ARjzYzYPD?=
 =?us-ascii?Q?zX5fmEckCHibexP0eHD4kCa0RxZRaFT++NQxZFCiQSiTRqFjPR0lBaVioYHC?=
 =?us-ascii?Q?JxVhTorhmoPQyD/ZEX6MYqM07Q4OiFDXgHGgES1fptynWNA1vMnf1Ywj3CQf?=
 =?us-ascii?Q?C5INA3KU0mUwbr8bTc27z1HYduB/EOdN3xlIr2U7jYlfzGoirSn9xNBTMQzB?=
 =?us-ascii?Q?1pWpd+XVs/dTbXzftrfUyNTreuu55DhdXqoHhw37I/+drrkCFxU1LdG20UgH?=
 =?us-ascii?Q?BRsQ7onv5yXqKS6iSoRs+FTPoamj+4EWOOm6hledJqZODu4C2pq0kocwuzc6?=
 =?us-ascii?Q?ltOzXmlmIC50oXw86kdAy8m2y9VvntZsiUZp6sslVrU/Ci8YeiKy5Qh8i2qS?=
 =?us-ascii?Q?FuI8I2xcoaHRmG2J9bITlMIv8vkoLD4j7YybsWaKsYWkpqxhVOfSUIpPYQPC?=
 =?us-ascii?Q?0Ru9u3GXPIooBDqYGRXvpNX5f8Md09LeNtP8DJak/zbS22Ok+rZrwCc6TQ9t?=
 =?us-ascii?Q?wX85nmNo1mjm4BQvWstQoBLpUChgqTGdYO1vDPW0jZWsadXX6dcvnwfWxXHu?=
 =?us-ascii?Q?n3JDjFujuA9qsPJTou2Qlky14EWNt1/iST+zcpPIW/nY5x1oGAbGmZdBmiKS?=
 =?us-ascii?Q?IpKlLrh2aTRK4qVZFZBwd28Yk0SuCQTfSW1ZR+lv+UX8Krta0UZJJebLO4pa?=
 =?us-ascii?Q?Flb0B2q2+5lbDAgIntXrpjDi40HoIzRNs1GiBfaNUxosWwEPv56t38nl9ROb?=
 =?us-ascii?Q?Ql3Fb3CHBOHS+YDEd1w8z/d33hTR0ovsMvdgdXZ88BBBhDVCEVfG9qE3JrWk?=
 =?us-ascii?Q?1Nw4AEkuc8P4FS/5vgDs7E5fY3aYFNr2Tx0rWFQ9Uhy3JawMzF2QYuQX+8eN?=
 =?us-ascii?Q?l7ky7zM6JyAP/rR16zNF5mGb8ixseQQCKx1IPl0lT2P0hiEy1MReOKU54JfN?=
 =?us-ascii?Q?+ZEukaza39JU4lUvjhL+CC8nBfwWJB2wBtMylv8RpuRBqj4lBea86uPDuyBC?=
 =?us-ascii?Q?cFa+sMJq1Jv8sW95oAVXj0BQn1zk7rUHpPL/sXQepaq+Wc1HXzWv2N2ySpun?=
 =?us-ascii?Q?iMc8ceEqttfye7qL12hgNEDW?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <29753B9EC39B0741AE9DDC5C0557F98D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4631
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	10b0f058-1c67-41fc-4efd-08d8e89de583
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7n8g2itlCOky85cYDGGhMULg0upfSJQLloMMCJcS2y0mpG5I3HlKqRJoilVHmzXQdcI3rzyUKl08CShCPNbK8kgwU/vJ6mQbVpmru9TnmeitNJJ71O6m+W5dTJ1Kjn61UGth9t0RjL8/Hbq5ydriywKv8Z9sbFeSaj7rTifkrGUMy/XFaogyxcFXeXIUQ/5S7yQ0kcL/rsxBvgm+EahbTDa9/SgOc+SMqqZSjp/bGZkM5rSYerO0FoxOAQNbneoM2Ihe/3KeUP+me8ltoHpgzOngL8AHQ4XLO0+O7klaxddhKynBuFCDAtku9KbOWo/kySnVRGMAU9Dudi1u7gIVsmdE/ymmhPyONprs9I4JqFPv6Lwi7iuO9ezOVGYiF3Kw7v14Q7oLYOoHgeBO/aIIKBn47F4yboa5mcPb9+onysV2pzU5TL9v16B40PyDsuzeR9mlcWWGUQf9UWjqfza1zoU9a6q5HQdKJ6jIQSsApokW4wZmJuSfLeTvfKadW15axwFoNCTcU23uF4YcLStI2WmxCEy2QqxVp3kkk/O5m/hBZlgPcQBEwvyBVvnLrmqNHRUSmbV/dUlUgdXBADqlddueCgkFIsMPubUsEsbeZ1sVHybXQlemPIqIbz91yNOwORooBdrtItWY0b7724YJVb+a6b+395S3Bes8+veZ/DU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(36840700001)(46966006)(336012)(4326008)(33656002)(186003)(70586007)(26005)(47076005)(6512007)(107886003)(81166007)(36860700001)(8676002)(356005)(86362001)(6862004)(6486002)(53546011)(6506007)(70206006)(82310400003)(2906002)(36756003)(54906003)(5660300002)(2616005)(316002)(478600001)(82740400003)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 17:07:01.1858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cef07b92-016c-4a7f-c468-08d8e89dea5d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4274

Hello Julien,

> On 16 Mar 2021, at 3:04 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul,
>=20
> On 09/03/2021 18:19, Rahul Singh wrote:
>> This patch is the work to fix the stream match conflict issue when two d=
evices
>> have the same stream-id.
>> Approach taken is to merge the below commit from Linux driver to fix the
>> issue.
>> 1. "iommu/arm-smmu: Handle stream IDs more dynamically"
>>     commit 21174240e4f4439bb8ed6c116cdbdc03eba2126e
>> 2. "iommu/arm-smmu: Consolidate stream map entry state"
>>     commit 1f3d5ca43019bff1105838712d55be087d93c0da
>> 3. "iommu/arm-smmu: Keep track of S2CR state"
>>     commit 8e8b203eabd8b9e96d02d6339e4abce3e5a7ea4b
>> 4. "iommu/arm-smmu: Add a stream map entry iterator"
>>     commit d3097e39302083d58922a3d1032d7d59a63d263d
>> 5. "iommu/arm-smmu: Intelligent SMR allocation"
>>     commit 588888a7399db352d2b1a41c9d5b3bf0fd482390
>=20
> A couple of questions:
> * Are they backported verbatim from Linux upstream?

Yes all the patches are backported verbatim form Linux upstream.

> * Did you check there was no bug fix afterwards?

Yes I checked there is no bug afterwards related to the patches added.

Regards,
Rahul

>=20
> Cheers,
>=20
> --=20
> Julien Grall


