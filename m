Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AE660CB57
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 13:57:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429807.681048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onIYV-0005eC-NC; Tue, 25 Oct 2022 11:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429807.681048; Tue, 25 Oct 2022 11:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onIYV-0005bm-Jy; Tue, 25 Oct 2022 11:57:15 +0000
Received: by outflank-mailman (input) for mailman id 429807;
 Tue, 25 Oct 2022 11:57:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bl8Y=22=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1onIYU-0005bg-Cp
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 11:57:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60078.outbound.protection.outlook.com [40.107.6.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29599da7-545c-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 13:57:13 +0200 (CEST)
Received: from AM5PR1001CA0048.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::25) by DB5PR08MB10162.eurprd08.prod.outlook.com
 (2603:10a6:10:4a3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 11:57:01 +0000
Received: from AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::dc) by AM5PR1001CA0048.outlook.office365.com
 (2603:10a6:206:15::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Tue, 25 Oct 2022 11:57:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT047.mail.protection.outlook.com (100.127.140.69) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Tue, 25 Oct 2022 11:57:00 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Tue, 25 Oct 2022 11:57:00 +0000
Received: from d50e99aefdad.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 14E850ED-1E57-4FAE-BD9E-A4437E02B1FB.1; 
 Tue, 25 Oct 2022 11:56:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d50e99aefdad.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Oct 2022 11:56:49 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AS2PR08MB9689.eurprd08.prod.outlook.com (2603:10a6:20b:607::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Tue, 25 Oct
 2022 11:56:42 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef%7]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 11:56:42 +0000
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
X-Inumbo-ID: 29599da7-545c-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lLSvf7jU+3xcQG4aEMYutOsdgzXOlog0K7YlOJTDgVweoW6wdknID+EjG1UkLsHcooVpIu/8segSPBd75iCjNZT19fgxNdDhFrYOWDzvT9eFV91ErmXJc1roR/6IoKtci8rz4K+qL8H5D+vhqcbJW0szAsw82vjG8W4GTxRZ4Eh2nqYApnGjxYY55LS/x/UlZNz6IHRh2vGWGs8RXKinxzh2lKvMI5fHxECrQYTnQmn/91UuJN0XJVCiFh3Oc9DP/QGcb+Ntj9oeyWnywpGMRhCe6a4GYmE+4CEwlv7hvy/sglWLw+FDC0LQtBTQEYOnqGgSa4PUjHSjRIOTr37K3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/booS25w3XCBT0qmwMl0HbX2D62yXBNu+E+mdDSk/6o=;
 b=kOdTxNJFaRZ5XA/RQSvbJT6P6xUBVVdMAZifnbxpfGwllqQ0NQFH/NX1N3/Mckh2fmiTh6KcyDbUWwg2qC75/CfDQTeMKXP9a8NZXjsZj8AM8P28mtzar4BO+xniaL/73OTS8i93V2iCIKl1lQPy0XYU3647HaOBQ9Z9GGqUuwnxB159S9jVLMqCNkzkbVBvNc425Ym84ppoHwQdDu7WTBrGpljwAy8wMeH335awFjcDVayEw/HD1wSnbDW+8YQvdfjauKEXcsssgqzyH4+dYLwv0A55LWImlbh3C7AQAG8EhNqrh46Qd6gOgDArfb6kmqAuyLa8qkwEz323nMCvnQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/booS25w3XCBT0qmwMl0HbX2D62yXBNu+E+mdDSk/6o=;
 b=8tf1wkh5NEkNxDHwxF7YyuDhQ7+FjM7fqowTabd7I6k2Q60p8Th7xjJ0/5s40zzHCzRHV4dtec1UkeZw2O23nyOaLPhvsdDj6rmeeakhCULGocmA7AptM/SAlphzu379tKH6Rqsv76tK1g8DdfII8Rrwy9Iks6XkI1HRF8ZL63I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 563b55afa99a0513
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hiHb4hDFJvLOxpCQpvesgYqmQC9c/zBlEU71Z850S0LTOnM1DXomp9tRZaP74tO8s+7KDts5/nrqujzC1Lt1kuypfIoL0TaggXI/Dla0rDu09XVxE+Do5jv782s4ae2zRkWk1nisIOx5yOGX6G+rUckAyLiBvTENe2MXYuC/K0msoeh1wwXfeKl8DBVgYLG4P2TbYccKkpnKmOEM5K04DLW64Z8UcPS7EA601SDpO1LfbfZK0/X7mh2qQ6io7pW1GhSt5DW2dhpRDHg6q9rhgsmSQzIQethSFT+0Lpw57sq0nE5rIvggnEnF/s1y7R+hN4io1+EA9Ouioie8tLx3Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/booS25w3XCBT0qmwMl0HbX2D62yXBNu+E+mdDSk/6o=;
 b=Cowt+KMEEXZVscqwSFiN2feV0pFTdXUdB5U+o9vT2sqEK4qfIYSSsfOmurk0IVrcCujdA1ZqtJLuH78DsUswGm3DnGEc6HpPXapzBBEv0x+yvwmvb2FmIRIlOwx0Lmabf5aHdBU2DP3HSS1Xh1obGoZUF+k+84CpYQR7heZVqzJH0MN92d6Tf/uOhSlPu9FBd6fGqJW7xVBGc9j5HGkEJU46Ou6HnWEQ4gdIxabwxwg+dEeJymu4m1A4YEeMwKNtTCk3Bqcx8cm7AjjKIOFEudYI7Rc8ohyvGdpHeVN4JVTHBxdkojeF7O5LfRSMRCWQkWlg3XWJOFfI5zDWTxDMaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/booS25w3XCBT0qmwMl0HbX2D62yXBNu+E+mdDSk/6o=;
 b=8tf1wkh5NEkNxDHwxF7YyuDhQ7+FjM7fqowTabd7I6k2Q60p8Th7xjJ0/5s40zzHCzRHV4dtec1UkeZw2O23nyOaLPhvsdDj6rmeeakhCULGocmA7AptM/SAlphzu379tKH6Rqsv76tK1g8DdfII8Rrwy9Iks6XkI1HRF8ZL63I=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	"marco.solieri@minervasys.tech" <marco.solieri@minervasys.tech>,
	"lucmiccio@gmail.com" <lucmiccio@gmail.com>, "carlo.nonato@minervasys.tech"
	<carlo.nonato@minervasys.tech>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC v2 04/12] xen/arm32: head: Remove restriction where to load
 Xen
Thread-Topic: [RFC v2 04/12] xen/arm32: head: Remove restriction where to load
 Xen
Thread-Index: AQHY5iekhdeljnYaKUO3Ilpr3vGfIK4fBWIA
Date: Tue, 25 Oct 2022 11:56:42 +0000
Message-ID: <F7ED0618-C95F-45FE-932C-A27D75DC8206@arm.com>
References: <20221022150422.17707-1-julien@xen.org>
 <20221022150422.17707-5-julien@xen.org>
In-Reply-To: <20221022150422.17707-5-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|AS2PR08MB9689:EE_|AM7EUR03FT047:EE_|DB5PR08MB10162:EE_
X-MS-Office365-Filtering-Correlation-Id: 89c32bbf-d8a2-4b4f-dc07-08dab6800696
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SiNVs1O2+8HHPL3qGv5TrZ1UQQI1U2KZtdyzVvkP8Hlx5m6LnoALTpJ4t0dULm/ynsTSEvuoAh2Lrvj5S3uMd5iTB6/Mq0Cbt/JDIxUldwZZ45ZPraTjT1cclcb7F7k7P9ef7N62sr6mQB6RfIrRmiVLxCinc/+3faGQOGMJDfHjBUEphoqxBzeBmXNZyXMhtTPKcwYetIdTI+H/hpUQvQs9R8w1MYQ/5zgM/w2M0GdQYMeD7ZiYseeRtI66nZeuk+b7gTO7iMfZJTwfkD/HI/U4HMv+gt1Nww/bhIWKyAFlcrGrDch7ntBTaaSey+F2hNxy/JVAnqWJBfPShg+4aTcAWWDAE/Ags3VA6rRhGIkwmfvUQkewg9ttfMDQ3wIUlpOzwD84VqFczjjsB0zQ9dIvgrevkm14Lqnt/pP1DfPhuhx1BooVt2Poon7f8A1I4778YaFAhiwH8LSX8OWCAOMqJD3TTvrxQ3e3a5sv/GmWT1c3InxR5VXlGNUARoEIkHQ/bcbAJX3WzpRUx3I+3a+H4xukhcVGSs5aquEG67Jk6dckphDDfeIS1xkWdc/zHw45LE0tHBZYZX5IKXAhYAWrkhKwxRoRX43WCrKKQyJJuVPIk9KVlqWP3nCSmou1WwbtR99hcX7IJ8VBg50FzPpxUSf6SRd0Y3oTCJoxMQvBFadfPoAVsfIowOdSQmXehVKxO3Rcd1nysQH7ESgW6LLFj5Mxfa404w83cEzMOI+hxvDU5Nty6jRHgl7jdDQVXCtsRHLoZATB1DArcqPdD3ynUKDEAHmGWA4TNLYIYp4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199015)(66556008)(76116006)(4326008)(36756003)(186003)(66946007)(478600001)(8676002)(64756008)(66476007)(38100700002)(83380400001)(41300700001)(2906002)(91956017)(6506007)(33656002)(66446008)(53546011)(54906003)(6916009)(38070700005)(6486002)(86362001)(26005)(2616005)(6512007)(71200400001)(316002)(5660300002)(8936002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BEE2A5F9645E649854A7FF73316FFFB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9689
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	01249721-0bd3-45c5-f139-08dab67ffbd5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tUdlHwxWGqSEdwvcMW2i7arSEnWVwv/GjsLnRklq6mc6L0hrbt3i7dVr8rowdxZApnVL0cdqk37i5+y0gQmZ4d5IEkbqdSMCvrqDXNzMEIinCdPFTeKAS13qjxBMv5jMu6Va6ALhFA6mafobfPNhDsSP1+etONjDHC6NwIcBruk+mjdB1und0iyLyKdHVz8TnPNi4yFnHzqFRFlf9ikb3IFp3SiFyOf6ZanIc7NNJdXJ+LU8OiJxcby6gWwkTp3pMBvVjOX16uKEgLEJ65yw5B2EPKOsaULTtTewOB+obLHgYoW2UgN2fWYe7u1lmrE/bFfU6QoIoY4Ncpx/0cSlF8yOKTs1DAtTbsKrE5y5B048AYxIwdt9+tvFxp+sy2olVQH8geB6rT+ka6Bg86ir8ymySurppzG3C4a63UjRHyhz1DpLt+k31Xw0of44J5slIh2l7FSvNC5AZb+Gj8H8bgNxV/hicO92ZftuqQnGZtJ3kTexTDFtDVo/XnrdIPWhclD/QSIW6h2XenXhSuB2uj/YNN9K60HWVJvz+PZOW8pGFX5v9CwByQhubi0zOhKfWcq47OndDN/qbhKJnvB5z6b8jiyqPkDF7F6WJ2b/p9jGsoAq2fHuMMy5DnSX3NNqryj/sZMaS/+VZOmjSXOD2R3AWL0xpEAXzloaftDilRM7IWZ0UIMkhoEIqna3q7g5Dfa3TedYPLRL3nbS3FOjCsq1mjwkj2qAlBXliatulc/jWfwPq5TlQnoE8ZcZTEQOgOKNa394tQYOLQ7b1nNIAg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199015)(36840700001)(40470700004)(46966006)(478600001)(82310400005)(107886003)(6486002)(26005)(6512007)(36756003)(53546011)(6506007)(2616005)(70586007)(70206006)(86362001)(186003)(8936002)(4326008)(41300700001)(33656002)(82740400003)(356005)(40460700003)(8676002)(81166007)(6862004)(47076005)(5660300002)(2906002)(40480700001)(54906003)(316002)(36860700001)(83380400001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 11:57:00.8184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c32bbf-d8a2-4b4f-dc07-08dab6800696
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10162

DQoNCj4gT24gMjIgT2N0IDIwMjIsIGF0IDE2OjA0LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+
DQo+IA0KPiBBdCB0aGUgbW9tZW50LCBib290bG9hZGVycyBjYW4gbG9hZCBYZW4gYW55d2hlcmUg
aW4gbWVtb3J5IGJ1dCB0aGUNCj4gcmVnaW9uIDJNQiAtIDRNQi4gV2hpbGUgSSBhbSBub3QgYXdh
cmUgb2YgYW55IGlzc3VlLCB3ZSBoYXZlIG5vIHdheQ0KPiB0byB0ZWxsIHRoZSBib290bG9hZGVy
IHRvIGF2b2lkIHRoYXQgcmVnaW9uLg0KPiANCj4gSW4gYWRkaXRpb24gdG8gdGhhdCwgaW4gdGhl
IGZ1dHVyZSwgWGVuIG1heSBncm93IG92ZXIgMk1CIGlmIHdlDQo+IGVuYWJsZSBmZWF0dXJlIGxp
a2UgVUJTQU4gb3IgR0NPVi4gVG8gYXZvaWQgd2lkZW5pbmcgdGhlIHJlc3RyaWN0aW9uDQo+IG9u
IHRoZSBsb2FkIGFkZHJlc3MsIGl0IHdvdWxkIGJlIGJldHRlciB0byBnZXQgcmlkIG9mIGl0Lg0K
PiANCj4gV2hlbiB0aGUgaWRlbnRpdHkgbWFwcGluZyBpcyBjbGFzaGluZyB3aXRoIHRoZSBYZW4g
cnVudGltZSBtYXBwaW5nLA0KPiB3ZSBuZWVkIGFuIGV4dHJhIGluZGlyZWN0aW9uIHRvIGJlIGFi
bGUgdG8gcmVwbGFjZSB0aGUgaWRlbnRpdHkNCj4gbWFwcGluZyB3aXRoIHRoZSBYZW4gcnVudGlt
ZSBtYXBwaW5nLg0KPiANCj4gUmVzZXJ2ZSBhIG5ldyBtZW1vcnkgcmVnaW9uIHRoYXQgd2lsbCBi
ZSB1c2VkIHRvIHRlbXBvcmFyaWx5IG1hcCBYZW4uDQo+IEZvciBjb252ZW5pZW5jZSwgdGhlIG5l
dyBhcmVhIGlzIHJlLXVzaW5nIHRoZSBzYW1lIGZpcnN0IHNsb3QgYXMgdGhlDQo+IGRvbWhlYXAg
d2hpY2ggaXMgdXNlZCBmb3IgcGVyLWNwdSB0ZW1wb3JhcnkgbWFwcGluZyBhZnRlciBhIENQVSBo
YXMNCj4gYm9vdGVkLg0KPiANCj4gRnVydGhlcm1vcmUsIGRpcmVjdGx5IG1hcCBib290X3NlY29u
ZCAod2hpY2ggY292ZXIgWGVuIGFuZCBtb3JlKQ0KPiB0byB0aGUgdGVtcG9yYXJ5IGFyZWEuIFRo
aXMgd2lsbCBhdm9pZCB0byBhbGxvY2F0ZSBhbiBleHRyYSBwYWdlLXRhYmxlDQo+IGZvciB0aGUg
c2Vjb25kLWxldmVsIGFuZCB3aWxsIGhlbHBmdWwgZm9yIGZvbGxvdy11cCBwYXRjaGVzICh3ZSB3
aWxsDQo+IHdhbnQgdG8gdXNlIHRoZSBmaXhtYXAgd2hpbHN0IGluIHRoZSB0ZW1wb3JhcnkgbWFw
cGluZykuDQo+IA0KPiBMYXN0bHksIHNvbWUgcGFydCBvZiB0aGUgY29kZSBub3cgbmVlZHMgdG8g
a25vdyB3aGV0aGVyIHRoZSB0ZW1wb3JhcnkNCj4gbWFwcGluZyB3YXMgY3JlYXRlZC4gU28gcmVz
ZXJ2ZSByMTIgdG8gc3RvcmUgdGhpcyBpbmZvcm1hdGlvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+IC0tLS0NCj4gDQo+ICAgIENoYW5n
ZXMgaW4gdjI6DQo+ICAgICAgICAtIFBhdGNoIGFkZGVkDQo+IC0tLQ0KDQpIaSBKdWxpZW4sDQoN
CknigJltIGhpdHRpbmcgYW4gYXNzZXJ0IHdpdGggdGhpcyBvbmUsIHRlc3RlZCBvbiBxZW11IGFu
ZCBmdnA6DQoNClhlbiA0LjE3LXJjDQooWEVOKSBYZW4gdmVyc2lvbiA0LjE3LXJjICh1c2VyQGhv
c3RuYW1lKSAoYXJtLXBva3ktbGludXgtZ251ZWFiaS1nY2MgKEdDQykgMTEuMy4wKSBkZWJ1Zz15
IFR1ZSBPY3QgMjUgMTA6NTE6MDYgVVRDIDIwMjINCihYRU4pIExhdGVzdCBDaGFuZ2VTZXQ6DQoo
WEVOKSBidWlsZC1pZDogYWIxNDNiMTNmNDM5NGNlZDUzMzFkNmZmMWNlZGViZGIyZmZhZGMwNw0K
KFhFTikgUHJvY2Vzc29yOiA0MTJmYzBmMTogIkFSTSBMaW1pdGVkIiwgdmFyaWFudDogMHgyLCBw
YXJ0IDB4YzBmLHJldiAweDENCihYRU4pIDMyLWJpdCBFeGVjdXRpb246DQooWEVOKSAgIFByb2Nl
c3NvciBGZWF0dXJlczogMDAwMDExMzE6MDAwMTEwMDENCihYRU4pICAgICBJbnN0cnVjdGlvbiBT
ZXRzOiBBQXJjaDMyIEEzMiBUaHVtYiBUaHVtYi0yIFRodW1iRUUgSmF6ZWxsZQ0KKFhFTikgICAg
IEV4dGVuc2lvbnM6IEdlbmVyaWNUaW1lcg0KKFhFTikgICBEZWJ1ZyBGZWF0dXJlczogMDIwMTA1
NTUNCihYRU4pICAgQXV4aWxpYXJ5IEZlYXR1cmVzOiAwMDAwMDAwMA0KKFhFTikgICBNZW1vcnkg
TW9kZWwgRmVhdHVyZXM6IDEwMjAxMTA1IDIwMDAwMDAwDQooWEVOKSAgICAgICAgICAgICAgICAg
ICAgICAgICAgMDEyNDAwMDAgMDIxMDIyMTENCihYRU4pICAgSVNBIEZlYXR1cmVzOiAwMjEwMTEx
MCAxMzExMjExMSAyMTIzMjA0MQ0KKFhFTikgICAgICAgICAgICAgICAgIDExMTEyMTMxIDEwMDEx
MTQyIDAwMDAwMDAwDQooWEVOKSBVc2luZyBTTUMgQ2FsbGluZyBDb252ZW50aW9uIHYxLjANCihY
RU4pIFVzaW5nIFBTQ0kgdjAuMg0KKFhFTikgU01QOiBBbGxvd2luZyA0IENQVXMNCihYRU4pIEdl
bmVyaWMgVGltZXIgSVJROiBwaHlzPTMwIGh5cD0yNiB2aXJ0PTI3IEZyZXE6IDYyNTAwIEtIeg0K
KFhFTikgR0lDdjJtIGV4dGVuc2lvbiByZWdpc3RlciBmcmFtZToNCihYRU4pICAgICAgICAgZ2lj
X3YybV9hZGRyPTAwMDAwMDAwMDgwMjAwMDANCihYRU4pICAgICAgICAgZ2ljX3YybV9zaXplPTAw
MDAwMDAwMDAwMDEwMDANCihYRU4pICAgICAgICAgZ2ljX3YybV9zcGlfYmFzZT04MA0KKFhFTikg
ICAgICAgICBnaWNfdjJtX251bV9zcGlzPTY0DQooWEVOKSBHSUN2MiBpbml0aWFsaXphdGlvbjoN
CihYRU4pICAgICAgICAgZ2ljX2Rpc3RfYWRkcj0wMDAwMDAwMDA4MDAwMDAwDQooWEVOKSAgICAg
ICAgIGdpY19jcHVfYWRkcj0wMDAwMDAwMDA4MDEwMDAwDQooWEVOKSAgICAgICAgIGdpY19oeXBf
YWRkcj0wMDAwMDAwMDA4MDMwMDAwDQooWEVOKSAgICAgICAgIGdpY192Y3B1X2FkZHI9MDAwMDAw
MDAwODA0MDAwMA0KKFhFTikgICAgICAgICBnaWNfbWFpbnRlbmFuY2VfaXJxPTI1DQooWEVOKSBH
SUN2MjogMjg4IGxpbmVzLCA0IGNwdXMgKElJRCAwMDAwMDAwMCkuDQooWEVOKSBYU00gRnJhbWV3
b3JrIHYxLjAuMSBpbml0aWFsaXplZA0KKFhFTikgSW5pdGlhbGlzaW5nIFhTTSBTSUxPIG1vZGUN
CihYRU4pIFVzaW5nIHNjaGVkdWxlcjogU01QIENyZWRpdCBTY2hlZHVsZXIgcmV2MiAoY3JlZGl0
MikNCihYRU4pIEluaXRpYWxpemluZyBDcmVkaXQyIHNjaGVkdWxlcg0KKFhFTikgIGxvYWRfcHJl
Y2lzaW9uX3NoaWZ0OiAxOA0KKFhFTikgIGxvYWRfd2luZG93X3NoaWZ0OiAzMA0KKFhFTikgIHVu
ZGVybG9hZF9iYWxhbmNlX3RvbGVyYW5jZTogMA0KKFhFTikgIG92ZXJsb2FkX2JhbGFuY2VfdG9s
ZXJhbmNlOiAtMw0KKFhFTikgIHJ1bnF1ZXVlcyBhcnJhbmdlbWVudDogc29ja2V0DQooWEVOKSAg
Y2FwIGVuZm9yY2VtZW50IGdyYW51bGFyaXR5OiAxMG1zDQooWEVOKSBsb2FkIHRyYWNraW5nIHdp
bmRvdyBsZW5ndGggMTA3Mzc0MTgyNCBucw0KKFhFTikgQWxsb2NhdGVkIGNvbnNvbGUgcmluZyBv
ZiAzMiBLaUIuDQooWEVOKSBWRlAgaW1wbGVtZW50ZXIgMHg0MSBhcmNoaXRlY3R1cmUgNCBwYXJ0
IDB4MzAgdmFyaWFudCAweGYgcmV2IDB4MA0KKFhFTikgQ1BVMDogR3Vlc3QgYXRvbWljcyB3aWxs
IHRyeSAxIHRpbWVzIGJlZm9yZSBwYXVzaW5nIHRoZSBkb21haW4NCihYRU4pIEJyaW5naW5nIHVw
IENQVTENCihYRU4pIEFzc2VydGlvbiAnIWxwYWVfaXNfdmFsaWQoKmVudHJ5KScgZmFpbGVkIGF0
IGFyY2gvYXJtL2RvbWFpbl9wYWdlLmM6NjkNCihYRU4pIC0tLS1bIFhlbi00LjE3LXJjICBhcm0z
MiAgZGVidWc9eSAgTm90IHRhaW50ZWQgXS0tLS0NCihYRU4pIENQVTogICAgMA0KKFhFTikgUEM6
ICAgICAwMDI2OWFmNCBpbml0X2RvbWhlYXBfbWFwcGluZ3MrMHgxNzgvMHgxN2MNCihYRU4pIENQ
U1I6ICAgMjAwMDAwNWEgTU9ERTpIeXBlcnZpc29yDQooWEVOKSAgICAgIFIwOiAwMDJmZmU0OCBS
MTogMDAwMDAwN2YgUjI6IGJmZmY4ZjdkIFIzOiAwMDQwMDAwMA0KKFhFTikgICAgICBSNDogMDAw
YmZmZjggUjU6IDQzZmZhMDEwIFI2OiAwMDAwMDAwMSBSNzogNDNmZmEwMDANCihYRU4pICAgICAg
Ujg6IDQzZmY4MDAwIFI5OiAwMDAwMDAwMCBSMTA6MDAwMDAwMDAgUjExOjAwMmZmZTZjIFIxMjow
MDBiZmZmOA0KKFhFTikgSFlQOiBTUDogMDAyZmZlNDQgTFI6IDAwMjY5YTJjDQooWEVOKQ0KKFhF
TikgICBWVENSX0VMMjogMDAwMDAwMDANCihYRU4pICBWVFRCUl9FTDI6IDAwMDAwMDAwMDAwMDAw
MDANCihYRU4pDQooWEVOKSAgU0NUTFJfRUwyOiAzMGNkMTg3Zg0KKFhFTikgICAgSENSX0VMMjog
MDAwMDAwMzgNCihYRU4pICBUVEJSMF9FTDI6IDAwMDAwMDAwNDAxNGEwMDANCihYRU4pDQooWEVO
KSAgICBFU1JfRUwyOiAwMDAwMDAwMA0KKFhFTikgIEhQRkFSX0VMMjogMDAwMDAwMDANCihYRU4p
ICAgICAgSERGQVI6IDAwMDAwMDAwDQooWEVOKSAgICAgIEhJRkFSOiAwMDAwMDAwMA0KKFhFTikN
CihYRU4pIFhlbiBzdGFjayB0cmFjZSBmcm9tIHNwPTAwMmZmZTQ0Og0KKFhFTikgICAgMDAwMDAw
MDAgYmZmZjhmN2QgMDA0MDAwMDAgMDAyZmZlNmMgNDNmZmEwMDAgMDAwMDAwMDEgMDAyYTYwMDAg
MDAzM2IyMjQNCihYRU4pICAgIDAwMmEyZWM4IDAwMmZmZTg0IDAwMjcwMGNjIDAwMDAwMDAxIDAw
MDAwMDAwIDAwMmE2MDAwIDAwMzNiMjI0IDAwMmZmZWI0DQooWEVOKSAgICAwMDI3NjMzOCAwMDAw
MDAwMSAwMDJhNjAwMCAwMDMzYjIyNCAwMDAwMDAwMSAwMDAwMDAwMCAwMDJhNjAwMCAwMDMzYjIy
NA0KKFhFTikgICAgMDAyYTJlYzggMDAwMDAwMDAgMDAwMDAwMDAgMDAyZmZlY2MgMDAyMDE4NWMg
MDAyZmZlY2MgMDAyYWQ5NzggMDAwMDAwMDENCihYRU4pICAgIDAwMDAwMDAxIDAwMmZmZjU0IDAw
MmM3ZDgwIDExMTEyMTMxIDEwMDExMTQyIDAwMDAwMDAwIDAwMmE0NzQ0IDAwMDAwMDAwDQooWEVO
KSAgICAwMDAwMDAwMCAwMDAwOGYyMCAwMDAwNDAwMCA0ODAwMDAwMCAwMDJlMDFmMCAwMDAwMDAw
MCBjMDAwMDAwMCAwMDAwMDAwMA0KKFhFTikgICAgNDAwMDAwMDAgMDAwMDAwMDEgMDAyZTAyMDgg
MDAyYTZlODQgMDAyYTZlODAgMDAyYWZhYTAgMDAyZTMxZjAgMDAwMDAwMDANCihYRU4pICAgIGMw
MDAwMDAwIDAwMDAwMDAzIGZmZmZmZmZmIDAwMDAwMDAwIDAwMmE5MDAwIDAwMjAwMDVjIDAwMDAw
MDAwIDAwMDAwMDAwDQooWEVOKSAgICA0ODAwMDAwMCA0MDAxMDAwMCAzZmUxMDAwMCAwMDAwMDAw
MCAwMDIwMDA2NCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMA0KKFhFTikgICAgMDAwMDAwMDAg
MDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAw
MDAwMDANCihYRU4pICAgIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAw
MDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwDQooWEVOKSAgICAwMDAwMDAwMCAwMDAwMDAw
MCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMA0K
KFhFTikgICAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAw
MDAwMDAgMDAwMDAwMDAgMDAwMDAwMDANCihYRU4pICAgIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAw
MDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwDQooWEVOKSBYZW4gY2FsbCB0
cmFjZToNCihYRU4pICAgIFs8MDAyNjlhZjQ+XSBpbml0X2RvbWhlYXBfbWFwcGluZ3MrMHgxNzgv
MHgxN2MgKFBDKQ0KKFhFTikgICAgWzwwMDI2OWEyYz5dIGluaXRfZG9taGVhcF9tYXBwaW5ncysw
eGIwLzB4MTdjIChMUikNCihYRU4pICAgIFs8MDAyNzAwY2M+XSBpbml0X3NlY29uZGFyeV9wYWdl
dGFibGVzKzB4NjAvMHgxNjgNCihYRU4pICAgIFs8MDAyNzYzMzg+XSBfX2NwdV91cCsweDM4LzB4
MWQ4DQooWEVOKSAgICBbPDAwMjAxODVjPl0gY3B1X3VwKzB4ZTAvMHgxMTQNCihYRU4pICAgIFs8
MDAyYzdkODA+XSBzdGFydF94ZW4rMHhkNDAvMHgxMTM4DQooWEVOKSAgICBbPDAwMjAwMDY0Pl0g
aGVhZC5vI3ByaW1hcnlfc3dpdGNoZWQrMHg4LzB4MTgNCihYRU4pDQooWEVOKQ0KKFhFTikgKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKg0KKFhFTikgUGFuaWMgb24gQ1BV
IDA6DQooWEVOKSBBc3NlcnRpb24gJyFscGFlX2lzX3ZhbGlkKCplbnRyeSknIGZhaWxlZCBhdCBh
cmNoL2FybS9kb21haW5fcGFnZS5jOjY5DQooWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqDQooWEVOKQ0KKFhFTikgUmVib290IGluIGZpdmUgc2Vjb25kcy4uLg0K
DQo=

