Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14775214C6
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 14:04:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325548.548165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noOb5-0000BG-Md; Tue, 10 May 2022 12:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325548.548165; Tue, 10 May 2022 12:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noOb5-00008u-I8; Tue, 10 May 2022 12:04:11 +0000
Received: by outflank-mailman (input) for mailman id 325548;
 Tue, 10 May 2022 12:04:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYXr=VS=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1noOb4-00008e-2K
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 12:04:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c3074e1-d059-11ec-a406-831a346695d4;
 Tue, 10 May 2022 14:04:09 +0200 (CEST)
Received: from AM6P195CA0084.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::25)
 by DBBPR08MB4903.eurprd08.prod.outlook.com (2603:10a6:10:df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Tue, 10 May
 2022 12:04:03 +0000
Received: from AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::77) by AM6P195CA0084.outlook.office365.com
 (2603:10a6:209:86::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18 via Frontend
 Transport; Tue, 10 May 2022 12:04:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT049.mail.protection.outlook.com (10.152.17.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Tue, 10 May 2022 12:04:02 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Tue, 10 May 2022 12:04:02 +0000
Received: from 4c4182ad7005.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6F851DFA-308D-42F8-8E79-377E59BFB180.1; 
 Tue, 10 May 2022 12:03:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4c4182ad7005.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 May 2022 12:03:56 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB6PR0802MB2520.eurprd08.prod.outlook.com (2603:10a6:4:96::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Tue, 10 May
 2022 12:03:55 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 12:03:55 +0000
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
X-Inumbo-ID: 4c3074e1-d059-11ec-a406-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=YYkZkeMvLGSK6mQI3bDihkj8VnbJTOBv4tiCzp4kerTEBd/xuz502ZONv8CAyeB8Bay5NSE0+6etHwD8ZQ2YsAF7G9PeCbG9TLvKIevkNIJiYGhr4BSezd1u4Wf22f6K+I2NL83uckdrmskmKLmJp/9gDOB6HnlsIVIdl0bQkC4Nd3Z/LZRUvkMqzF4SwDfw1nzYqmov/jZqIXvAR+nMCBn+WIFBYzROAPggyY9R5/fuVTAh/gQaQJlxkWDHCE7OSY5qkLo7mz8cWm3JVJSzF06RG43FaFMi9+9SU2xqZYkfJzZHRMGtiE+Pf0ZAh6KGor2clD3y9o6sdthlUrUB+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/mCpW3FKt1Sl1r6ofgLzStfyndj2h/i9tchyQMN0Ao=;
 b=eusfpq44U5YnZCqODwBDyw4rFi5swH+taKd9SnAkZhPEwkoMDq9cLajGeARo99yqs5qBDDui07KNAnkVNjnISFUmSc+zJX/KBRhA58RTfHi1c2PdNEDu198ZX/xOb1Sb2sUTNYra+IcaQazBvzc4+HXBIEeYrQotJAKRHuGO/cDIZXFxNFio/s/O7fK3vGpGU+iK+ZwSLa/w5t5K7yewkMnRK3437XvdG0XAqO3DGG4Br2x47XIsV7KYMg07AMLjQFdru8OY8roJBcNv9CLPOzqfnlhlxQb/VvL/g3ITTyy8K28t/qiWiD9mfV5e8fVopxd+j/d/JrAYVOQyOfmj5g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/mCpW3FKt1Sl1r6ofgLzStfyndj2h/i9tchyQMN0Ao=;
 b=reviudpqOpkjlEKZ/p/W7b8UbT0Z7bs3jBNu5fS3noAA1VPXOdmYvDDzQFcUZYN4HfHiLi7tw+jIWqkO0IdYIbykitWfDuDSiFJgdZ0DuCFEWWkd+vSYtz9cHozJhxrSpcVT/S/xMoP0UP1/O6W/W4Pl4lHhOPU9ZwOP9l3C6b0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 965403c85fc9ca0a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzBOTw2Dj3QEWw+S7CtNKZsSFZzpffvYDSZ6PBMtdWCl+Lw7ZtQIRh6TAkJLqzv1kq0HHosDJ2z8/XmpQZ3kcOAzYjqwYQoEcs8oNj64di1QZcJilLdXbDG5kHd2QHXNbh0NBzHaQT8VHXUaEoyHjx6T5/M1XbClehHR0xTUBkcEjoYiVMzJyRbxD8QE2ATdDKGNrS/jnLrFuOKM8hsxQ+ep0ACLLG9fDNwUIOqQ7eWm9P0sT8MK1D1n9vJsfK9Q5vOupzfvjN6qViqdslJuMNfi7vAHqLVdAMPvqvmXm+qZL/yn1Nt3Z6eNRZkDmPq/gufOm/ecm4RVLC+55nuxHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/mCpW3FKt1Sl1r6ofgLzStfyndj2h/i9tchyQMN0Ao=;
 b=aVYIj5IDpJnPYQDAUYNdbMCLE8WgdHzZ5GovFIhKeLRsu5DVhveDKetA5GcZ8C8zXc6EtW9aHDNh4dMgjVNg5mTjAzKdJOCk1DyeEWwAhRF3p+Mh2vnvSArk6M2oEdlFElS225o1QzfnXVITx0/bhSthVfDkfdydNkbtiejhyhGA+rOmINcYPh0a6haYJsjhSStlmORrj5cSfljPeNWTeckzXgm/V1dLr+so1zx8MBPFZYBD3a6Aev8bS5Xz7gGzYU4BeCMSQcaf6mO+ZJLyfdkddzqrL4MOBTIDs/qB7rM0CU7zogHP8gHZse/qP0TBwAK89VQ7jBK3IY7hvhdubQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/mCpW3FKt1Sl1r6ofgLzStfyndj2h/i9tchyQMN0Ao=;
 b=reviudpqOpkjlEKZ/p/W7b8UbT0Z7bs3jBNu5fS3noAA1VPXOdmYvDDzQFcUZYN4HfHiLi7tw+jIWqkO0IdYIbykitWfDuDSiFJgdZ0DuCFEWWkd+vSYtz9cHozJhxrSpcVT/S/xMoP0UP1/O6W/W4Pl4lHhOPU9ZwOP9l3C6b0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] xen/evtchn: Add design for static event channel
 signaling
Thread-Topic: [PATCH v2] xen/evtchn: Add design for static event channel
 signaling
Thread-Index: AQHYX91LyQUbnRX4102lMt+LkaTZwq0XDS2AgAD/IgA=
Date: Tue, 10 May 2022 12:03:54 +0000
Message-ID: <079FF3B4-79B1-457F-AF45-ADB704E7FF7D@arm.com>
References:
 <10d83478f116c923271a6c2f7d413f6ec117598d.1651685393.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2205091347470.43560@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2205091347470.43560@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0bd90788-b4b5-4f29-c3c1-08da327d2cb2
x-ms-traffictypediagnostic:
	DB6PR0802MB2520:EE_|AM5EUR03FT049:EE_|DBBPR08MB4903:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB4903B6EE91BC8D9D007838F99DC99@DBBPR08MB4903.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pYWq6iDkf6Xpgl9QOEuayvcphIi5W/O2AZyJYDggx6ReAUFe55hnA5LgVSQzgq+0rc/5tr7ItmpYAsY5xW1o91uh+Hu4Z6jdZBSv6hgKKyNeYKRVBZ12KMCZkugLyxqzYcKIqdAt0BkpS3ICsfe/s/hPOg9pJPEV0GPF9SWCNF3ebyNMWNGoPr9ZVd5YmiDH/2RNALhJmo02eP5ubBxb7mWlBklVEumpKnM/RDKDPz6A+1LJdKgLiID4Q0gxrxKoVpGaV0VNtOYvfEXBktgEwzjZltgokOHvaXryrhJMLNaINvjBmSCtX0cz1Pdr5E9YuzznzlEo+ldE7mEDV5UXW2tj1KeCFBBzBCvDhCcSlAZRGEvtA9LgOpRvHvOTCL7auWsYnekC7mZuoWNUD1xgjz0rvU1Vpajczq3Ohi7KOr+RKmOAww4M5CUQzoEO6mqLLUM+a6Ywu8QKZBMTl5k5h9mRamVo2dcDzNuJiKkEm9ez2FTbxUgLhzuHZRsCZxBjCcRfYqMUQwpwajBx8Hian+FrseZS+xUgquNxSSC61jeDSx4McN48dh7KGqJITuZdVgOyzE7hO5y78OKb6VJd/vBia5RUgXYd1SKTbA8fQu27VHsTi1sYwZi0ZMT9d8GOWr97T5DG75reLo6E1CmvoQOmgGotZZW8Rt549T66ERZbGcqRW5ZvfRqV557s3mGiC5sXlr0fciaAAE+PE1jQpdGbFM9TVWpaMZeGW7GCnPr7N3nweVrQg/o4Zb5hI1Qp
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(2616005)(36756003)(122000001)(8936002)(53546011)(33656002)(6916009)(76116006)(66476007)(8676002)(66446008)(64756008)(66946007)(4326008)(66556008)(54906003)(38070700005)(38100700002)(316002)(71200400001)(6512007)(558084003)(6486002)(508600001)(26005)(2906002)(5660300002)(186003)(6506007)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <151819EC70C86441B2F55C7D2771F8A0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2520
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c00981b7-588b-4df1-76f5-08da327d27ff
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+xKDsXBq746OsZDOdofZPpzHjCpt7Kx0Pf8rkLHkHXLZ0tPz5iJREJtRh5jYi/trmbFMisfZexRW2NUlfCD8gLAN7g1lwKjukBtMru264SzZ6NQBkglC3owNh76RE5CSa3dtgCu6DZmazzPovpKrxDio8SL8xEyCybm1VB3pp4ETd6hnyI5xsvccbU10eyiRrdx0T+E84FXsra5W92Dn67qE1ZintNCeE+54Xm+rAV0GTIzo6w+ZmZSz06UGdQgayfOIymK5Y1tbcYORIb+jkwPWTBq7xZBeoT1Aa1Vm6OFs100b63LoCDvCEwF9lLzfwgZVO5YajmJNrgr5KK464Xiob/VBQpBNGkbT74o9gKn5kmdu1fV8Q0uO1BUxjqY4sdMtLIofATQ6PwnbCp8w8awK4C2YQoUYVHDthz83LBHwWToSZrgpD2uAY70VcDBzdRDyo7ZZyxODef8oc1Rs782YvO4h+gh0Tmq/fjRAefkejjs+PZWDft8+BK3rjY1n5BIY2xbLZqqh0sLVViiZAFdZsSLHm1tNyXdqdgIk/Ox0kKYUlIIYziT8jTph98tDrtC5lkUgtwTc7ip9g8DvKJ2GUPrWLFSAOzQieAjZC3DUi9pbuFBigXqRMlW8YVikIvTqGI9p6zB7C5MRb5A8VSt2ghrdmpYkDpTiYwTBsvPZpL4ovlr8X2i/8CEBk5J0
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(5660300002)(356005)(508600001)(8936002)(86362001)(6486002)(53546011)(316002)(6506007)(70586007)(70206006)(54906003)(81166007)(4326008)(8676002)(6862004)(36860700001)(33656002)(186003)(36756003)(47076005)(82310400005)(40460700003)(336012)(2616005)(2906002)(6512007)(26005)(4744005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 12:04:02.7935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd90788-b4b5-4f29-c3c1-08da327d2cb2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4903

Hi,

> On 9 May 2022, at 21:50, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Wed, 4 May 2022, Rahul Singh wrote:
>> This patch introduces a new feature to support the signaling between
>> two domains in dom0less system.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


