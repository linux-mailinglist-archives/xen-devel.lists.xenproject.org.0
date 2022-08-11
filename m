Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 042415902C8
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:16:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384751.620204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMAr6-000700-1F; Thu, 11 Aug 2022 16:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384751.620204; Thu, 11 Aug 2022 16:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMAr5-0006x5-Ui; Thu, 11 Aug 2022 16:16:19 +0000
Received: by outflank-mailman (input) for mailman id 384751;
 Thu, 11 Aug 2022 16:16:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aO9K=YP=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oMAr3-0006oY-Tb
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:16:18 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed7d74a8-1990-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 18:16:17 +0200 (CEST)
Received: from DB6PR0202CA0017.eurprd02.prod.outlook.com (2603:10a6:4:29::27)
 by AM4PR08MB2865.eurprd08.prod.outlook.com (2603:10a6:205:d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 11 Aug
 2022 16:16:15 +0000
Received: from DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::a4) by DB6PR0202CA0017.outlook.office365.com
 (2603:10a6:4:29::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.12 via Frontend
 Transport; Thu, 11 Aug 2022 16:16:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT053.mail.protection.outlook.com (100.127.142.121) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Thu, 11 Aug 2022 16:16:14 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Thu, 11 Aug 2022 16:16:14 +0000
Received: from ea36de2fb856.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CB975C7F-8EBB-4231-B111-E85E5AFC1201.1; 
 Thu, 11 Aug 2022 16:16:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ea36de2fb856.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Aug 2022 16:16:07 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AM0PR08MB3634.eurprd08.prod.outlook.com (2603:10a6:208:d6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Thu, 11 Aug
 2022 16:16:06 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%4]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 16:16:06 +0000
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
X-Inumbo-ID: ed7d74a8-1990-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=HZVg+vC0AHRTk71qSjGpBBK77YNBJlZ7mCAwtCKUawdyIE+67ob2JCQPuWJe2PCNJw/EjyvkXOaadzB8bkH1sYrbltc6EBXe/3WHbW78c0kQf5i5xd7bkyK3PSVTdsieamZYMfLrM0lMib8aFMcOLHH3a53JJpTqiu34cuGXrubmtK65wOyxiBHbUuZxN88WtL6cuQmNLIYULlUNB3iM5c64WahCjedyG8Ch3dD/T3/W6GFqDAkKcK1165s3BP9MWepKIqGy1NgPy9KVhInzbTt2WgKFX8vq9/138w9vvjMQpX8BPAWUnFjC5naJdR4dk+gbhl1M90kRXW+YXtD5hw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D28FbbdvwfWTnb+AeMDo4M24qd+NAha8qe6OLpKIkNE=;
 b=S/ZBaEv2tPyxd7lNYpOZHjjS5ISSGfP1/YvowaJ6jMCVkqeyxWKyRFQL4WBAevQEAtaTdc2v3uxRS3JCjsJ2PoRkHAw4lVdswjDgDjqeUPJLzYxt6h+NXdAcRqdV3xmCMg87c4B9yVJU3yiQTSirOOUmMn68kVB89HQ7kjwBcKu5dPz/q/A+PuUqtgupyPd/0qjq6zGkFGFLauRrdLHCbhTsnCOFejsiqUh8h5BDS+6WMvJwBm28SxYo7p+/5OorK1ZS0sYRb0Iu02yaLfQ0jaB9AXbLMLWTIzWtGSkXsakwPoTZ/TtoaGrJMm5kRNde0ov5GQXUgBf0hJqdCirv0w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D28FbbdvwfWTnb+AeMDo4M24qd+NAha8qe6OLpKIkNE=;
 b=fvu9/F3Gq4G9mlMflFhjiA1ytLDOVPgdjnEzUfGTMadZCxGAPM2mi6RUgYs5fJPZlxdFOm6Vg3RbRmVPaqkAaMeM1L4XdD0zDtwNvVsXo3jRXaQ3eHMB9FO+PugLL6GRInoRc+Eg79Vh2L3Hwe0ZrB9JoRTu1dgv3RGrrgFoVbI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b4931b43444cb742
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akvU4l54peZT4ktQYoUTVl/qwZhio49xC4ZQkGX65+pH8WDLffXOesrxcONfB8QFqtQq7XFQN+sinwaZSTn4vqEmo9yDewcea9k20Oeebq/Osz+yaSYCMD0JHJIigfIv1viXrp2oHOrxJ14V/9NDGp4M5/h46bbF+II0FuSuRMZNvZ8Li3AK4gN86WRcKbZgTES/ZAw5vpT7IzLQp+FO4pgxNMLSrxQ9OpbgX6b4//PgzdLo0D88t+7UyJhzLiF3ulEU8MPoIKJ9b5iqSCAQnymZWebY75A7rrdmf+8CnPmcwz8HWHv/6WX4W2gdBAIy9j/veYZ7pXKTPz7edlJbKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D28FbbdvwfWTnb+AeMDo4M24qd+NAha8qe6OLpKIkNE=;
 b=YcvFce+2DXh0dEs5lUCkR5FDx5b+vvXl//vNH4Rxy22f3pWmUfuNiojALT0gVn3Wjp76aKLeRLj5bKKXoVfAmcMYZxbxQuCUOftsb5S0TCBuG54BtyLB6x9ylB0RV98qvFqZ/EhRPjh7NxlYAcTZdKKALs8MqntRcYrBD49QXarpHYFqam2Dca3ub1EKFLFwZ3E4SP6GLXaENzX6S/NnXKZuooud3QQ8835pTZ/319WUvtNsq+nE+4Mo2SEyZ5w50hKuvB34RiJ6BmbWSmAqfyqBHuXregsaZQ+3xdLaQreTOwJad3MMtuvvTlZ5XXitrF4kBAYPX4baUDf78D+jag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D28FbbdvwfWTnb+AeMDo4M24qd+NAha8qe6OLpKIkNE=;
 b=fvu9/F3Gq4G9mlMflFhjiA1ytLDOVPgdjnEzUfGTMadZCxGAPM2mi6RUgYs5fJPZlxdFOm6Vg3RbRmVPaqkAaMeM1L4XdD0zDtwNvVsXo3jRXaQ3eHMB9FO+PugLL6GRInoRc+Eg79Vh2L3Hwe0ZrB9JoRTu1dgv3RGrrgFoVbI=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <paul@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/3] PCI: bring pci_get_real_pdev() in line with
 pci_get_pdev()
Thread-Topic: [PATCH v2 3/3] PCI: bring pci_get_real_pdev() in line with
 pci_get_pdev()
Thread-Index: AQHYrXB66CmheAjzHUSd7fcqZzV+dK2p4HAA
Date: Thu, 11 Aug 2022 16:16:06 +0000
Message-ID: <5645FC36-92B9-48A4-B6C5-3BD23EABECED@arm.com>
References: <5379b4bb-76c9-d7be-4bd7-2f75dde470a8@suse.com>
 <b8a5294a-6869-121b-cd67-0740e6330769@suse.com>
In-Reply-To: <b8a5294a-6869-121b-cd67-0740e6330769@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e763c859-af92-4fdc-14e6-08da7bb4d055
x-ms-traffictypediagnostic:
	AM0PR08MB3634:EE_|DBAEUR03FT053:EE_|AM4PR08MB2865:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 B6Ma/EVxZNNt0Zccyk2tFOI2bYf0N1BO9OZUTzzplbaz+D+mkANF3IZls4eMTwebRMH0+521EZMJP4YZnPEbDwn/8PS1ItrjWe8WQ0NQ2DBNOhWYn7dF6TaZPybxrvvcMEZ+YsaJ+fLiUdd+08G22ZokWRKdQaGKb+3DhoAkDFCNn13hzhzzOTrkxz8mdg/OZOjgvznoyFgDoub+RKw2PgZ6AEk8AUfshILFVvHX4AKfYpd8jRuo23PGWdsHD6IyK46b7MnhZEeUWy8dAuwJrLIG6WVT9rz2HPldXQkuRNnXcmjwmaTst/7pgy0jC89FSB/tllHoBVymvZeVhKTkmgJdRjUX538qBlVAls7Mvj+Or15vBCcXd0uRBtORY87AMeEQwBI3gk97l5/k0dWddhuPWusZ34iZtltpy/0fLuY64eF3eax9rMVaTeyhR6tdDD2Q+SRNFs50ouig5Wn8iL3QG/Wn8q/ER6JBuvXYE1FAfmEQPwy6T6Qm/E6uNjb3bxRF2bpSY6f+bXFUGgXYiX1OBOE+1vPuwlNHn4hJNsn4SUjbVXrx32TWL3eWlCp04OGGjEluGthd5eIq8prIimAs/4j4vQPwEiF0mmxeVsB1KHVdsSQvMxWnDWqezDee7uNERwx+M7/7eTwmcI3AUc92TJV1p7sDWHglFFK+7eLuUwxsx/V4jCfCmvzgVUy6/zOP4vfWtTul1XMTiQRQe2u1IUOiFSufh3ez3/zJ9D2UZC/6JYL24R8ODo3yR3leTlQdimJjP/h3++LFB98Z9qT2VeFTDGHiCe+QbNF/Q+4gAAX0B2f6eRtQjkEOBo5MQMpKW+Oaa002vVxQGS7rsQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(2616005)(2906002)(478600001)(33656002)(4744005)(6916009)(122000001)(86362001)(64756008)(36756003)(54906003)(8936002)(5660300002)(66946007)(8676002)(26005)(6512007)(41300700001)(76116006)(38100700002)(53546011)(38070700005)(66446008)(4326008)(316002)(71200400001)(91956017)(66556008)(66476007)(186003)(6506007)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CA83BCA9374BC9439EA6FF7C8E22AD96@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3634
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	10bfceb6-ab55-41b3-98f5-08da7bb4cb61
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S4L+CF91v2Gw7qG2vSsETQ/TW/M/qT6yxLwT7we9BwQUG4v/lgLxaOZiL30SEAQHLj+TUdx8UEaosTVdLVCllXFAdsaBQy8ABQiYH3neph73RvVo25lEuEGzofBCAH19DgrYzH4r+puxNo065zdJLZ8GQ8oIGGCj1sHBtY+XBhGT8W4CjKG56T2BKOHo0h4poL4gtiwt7bDh0C7S9vMoROesnaysWVYbbuJlCk5qka657dR4zDM+Qt6gD0d5ubHBOD20ZPFQLqnPLxEz5uYi/NQH08671Taz22uvVS4pFRlzsrA+gKjIYvNm3fqZhU3qMUaAYX6eYkEQwUqVDg8d3G/8Ez5VeyFFeUteL91CfjSzjlQj/buUHCjwwWW794YLNVlbD87ZbtvMe9L5DBAG+w65orCZlQb5vYWSKrGsblvJr29ZVCaZmVoouQwq1XncSlvMPxqcSu5atsj4j6dpW0ts2K37/dgBK2kt8wUmTxQ3EDcmshfm23QRPfhjXapGm90lEvbjp73XtvkmSUKmI+LBu8SZJtQXJ40JHwwZbaZdOCsccHNLE204g9YMZlqhSOi27HYvWij1PoGAQbmMeyn5lXYJJIGrz5ppje5e5MrCoQTC+8HgNQVmERobSUgomeAXEKa1jIA+0F2HFtzAk8wW9lLF1tupiQGW3dUJFkECQkpKxvylrDq1LkzwOcI8+qER4Qmb2IHngRqiKOlIkB6lyUZtJjagXv0m1Wi6I65AbXkHp5c4TDQ2O+7LbMVDhDwjXcc1JZSf2rg8Ioka+XhcQS3tVvrTrSrS0MBk2ixPlq/KkHVzJMfnEVIheq2P
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(396003)(346002)(46966006)(40470700004)(36840700001)(356005)(316002)(81166007)(82740400003)(82310400005)(40460700003)(6486002)(5660300002)(86362001)(8936002)(6862004)(53546011)(33656002)(478600001)(6512007)(26005)(41300700001)(70206006)(4326008)(8676002)(2906002)(70586007)(4744005)(54906003)(40480700001)(2616005)(36756003)(336012)(107886003)(6506007)(36860700001)(186003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 16:16:14.5913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e763c859-af92-4fdc-14e6-08da7bb4d055
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2865

Hi Jan,

> On 11 Aug 2022, at 11:52 am, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> Fold the three parameters into a single pci_sbdf_t one.
>=20
> No functional change intended, despite the "(8 - stride)" ->
> "stride" replacement (not really sure why it was written the more
> complicated way originally).
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>=20


Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul


