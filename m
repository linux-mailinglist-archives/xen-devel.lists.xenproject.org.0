Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7203C585108
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 15:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377548.610791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHQFU-00028W-O2; Fri, 29 Jul 2022 13:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377548.610791; Fri, 29 Jul 2022 13:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHQFU-00025U-JS; Fri, 29 Jul 2022 13:41:52 +0000
Received: by outflank-mailman (input) for mailman id 377548;
 Fri, 29 Jul 2022 13:41:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JEh0=YC=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oHQFS-00025O-OT
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 13:41:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31f494f3-0f44-11ed-bd2d-47488cf2e6aa;
 Fri, 29 Jul 2022 15:41:49 +0200 (CEST)
Received: from AS9PR06CA0294.eurprd06.prod.outlook.com (2603:10a6:20b:45a::22)
 by DB9PR08MB7116.eurprd08.prod.outlook.com (2603:10a6:10:2c9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10; Fri, 29 Jul
 2022 13:41:47 +0000
Received: from AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45a:cafe::eb) by AS9PR06CA0294.outlook.office365.com
 (2603:10a6:20b:45a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.7 via Frontend
 Transport; Fri, 29 Jul 2022 13:41:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT040.mail.protection.outlook.com (10.152.17.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Fri, 29 Jul 2022 13:41:41 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Fri, 29 Jul 2022 13:41:41 +0000
Received: from b1b73cf850ba.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 994084DF-A122-4FE3-9BCC-5C56D15F2DD8.1; 
 Fri, 29 Jul 2022 13:41:35 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b1b73cf850ba.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 Jul 2022 13:41:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB4801.eurprd08.prod.outlook.com (2603:10a6:20b:c1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Fri, 29 Jul
 2022 13:41:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5482.010; Fri, 29 Jul 2022
 13:41:31 +0000
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
X-Inumbo-ID: 31f494f3-0f44-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MECUbBZs6OsPZTg/+QBNv5+oGY/5BO2gf8Ku9tgGMgMgJuQaFMnb9QCfo33RY5DtfSNW3IG3e++20tuNVt3U2asMrbPr1MNzGjQYrinwQEPBbfL6XWE0adHvSs9IyU0Pjc9fvEVD0+FxWvtaluoHsnfswGj2y6vUmjM4ms4TfYE251ZGxRP272gv4B6MMSlFHcVz/Ykk9mcTPNKw+lLAouvza4+G7frUJAG10iLZlfm7metx8jiABvZt5SdPKr94KooTBmEPQenDRY1GD2VasbXjkdJoEyPVkOGaEYtgsUmvlIh4PclIrEBXl7Y9wgppkIQBbig1Q8lC44amRNciPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stvcMF83vcZQt51gnH9t9FsnHibwpgZKyttr3IFmHrs=;
 b=f1Md6qp7JWF1EEJNeq9wgC+Y5/dlcUUQj/9imgl+ZDMOEL1U1M8viS0DfuHQf3lE/tpOplxtsQ1/AikiaVho2kIBVaP28p+Sm0O6Wp1ujkq/VDF2KaLoOB7R5kYuqdwR8c3UX7cUPm5fcGBHD0qr+woX61AvnzKxv587FGBp2T2FTf3uXA7+0JVLkLeoBi2eEvSpn5T/i69uquDauGwceBh32nO+4Wz6wc0zne69XyIomlmioWpCF7Ltah8hZiGf9v8o1TAXjKUj7GTXsK4roKSkaJfhzxrgKV4SIvTAUmc/qNn6BKvCXxFA1jqM8TN7Fs4/ycclFM75kIP4JMgBpg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stvcMF83vcZQt51gnH9t9FsnHibwpgZKyttr3IFmHrs=;
 b=5J0ap1YqIyIM3ZCltOzJqe+MbFYsTyTMveUQBnvt0+3ZGnAgbYotDwBQF44FWL8pEHYggXt0MY5/FqSBkO2tFu50JSEjKBsmy80sAq0eC4RHhFXdA8TB6qP/LNQRqz0QNfaoNZbhi5RuFSm1mi4AT8IA9WoC2mr5ekHTpbHXoy4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 05cbabe1912763ba
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjHwB7epAr9Qlq/0OOxfdCOWDTHydIzWHS6yA+zveU0EpPHrENBKaDrheQuGZoLAcHtdhr0ACr0t4e/KcNIonUtJv65AahSDt6qD8OpbQ0mZF2adTRsM4RWn2b0xQaXZJr2+qsMGxzJ1MFofa8CkEe5bZh/VetX5HHdwTjIyb0cFK+OhmOmTcDZNrWn5ClaqjJ2KThrkfxY186HjVyrkwdkpA1JmRhQldjhijf6pHHSCKkS6/4G0M/zIJoDqEYJgJad9iyU0aZgqF5VcccLMt6GjNuKl+ZfjSb0mUoORk5RXwPqI38Qyf46VpnGLzD/TA6VePo4g6IQfwCYLfZrF/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stvcMF83vcZQt51gnH9t9FsnHibwpgZKyttr3IFmHrs=;
 b=ACmHZ0aauEX75Ako8wgbViqegEoODFirqZrwdkJL6yu1FDFrGIP8SPdc386Of2mVIGkKTLgEk1k66Loi4H9v6nD1FgPWZ/+PHGJNwFIzLR9CYagynD2HoFFJyWyEBrkiejmSMvd1Ehbrxi133qSmnGRzWqnsYZw0UFRLFkrAjogUbXf1SEO+GCrmRpVUtrjFn3VtqWypYNUkkzXdq1CXrcmJweUaySE5egzOjydEdyGamxDWDMxHNgTb1kMpFaiK7tfaVOKMf7CT8Ve5KTgl8nYDI1IBrEfnuaw1zEIQEfRQahd2ouO4NprwMTN7i7JV8jfoR4MX2bjYNUxCc0+2gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stvcMF83vcZQt51gnH9t9FsnHibwpgZKyttr3IFmHrs=;
 b=5J0ap1YqIyIM3ZCltOzJqe+MbFYsTyTMveUQBnvt0+3ZGnAgbYotDwBQF44FWL8pEHYggXt0MY5/FqSBkO2tFu50JSEjKBsmy80sAq0eC4RHhFXdA8TB6qP/LNQRqz0QNfaoNZbhi5RuFSm1mi4AT8IA9WoC2mr5ekHTpbHXoy4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
CC: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Thread-Topic: [PATCH v3] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Thread-Index: AQHYop4zbGg59w4f8UOqc93PZGjmt62U4voAgAABWICAAHhDgA==
Date: Fri, 29 Jul 2022 13:41:31 +0000
Message-ID: <4327CBBD-315D-44C0-A429-25F3CA5BE25D@arm.com>
References: <20220728162151.1228747-1-burzalodowa@gmail.com>
 <65adc941-78a9-2e2d-fa43-6189ea95773d@suse.com>
 <b9f3bbc1-e6ec-35c3-6ff6-35e051c86953@gmail.com>
In-Reply-To: <b9f3bbc1-e6ec-35c3-6ff6-35e051c86953@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 23cc294e-37f0-4710-c891-08da716811d8
x-ms-traffictypediagnostic:
	AM6PR08MB4801:EE_|AM5EUR03FT040:EE_|DB9PR08MB7116:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BcD39+5EwFATNFocURQCwSr1EAg17uVoBtqFBrM+VzzbkCWn1s+crCFryeAuGQQrmMUq30M/83SuK+yZZnICuSAl2UdNJ1BNK4YVeCPRCPo+O3E7roSgnNqzkWevacbq92QBNgNEaaGKtizLEfu24HSXkzHXsnJMDPe/QYAAVQePNneBU8C7ZJqr+/lN+gkNNU8UO9WH0/Bd3maMjbeIvlYE6vEtau87zPHa6N/zpPnJdN5H2ga6aMKzJ9yOvsC7hmJ9ca40B3FrppG2KdImsGSRrBJb8OoGcZ/aAVZa8ifh4kE+XWZ5LCxVIcosRrbfoSQhPQXEa8uZGHaPTuvNKlG9kzowHtcDOq0vKinWSNN8/WuQ1WIbqU0K3OBJSHSqUAqRmw1PXPwpG2Ht+LgcI0rR/XvcFnP9kOFgooY38fWwWSH0XalzczmGpYHNlWEOfFrEKAMs1torEnUiUBYQVhjlGqb+PyztZciVXO42j4HAu8c4ANzpkF4gcO9Hl00zZechuJpzfXSeaQ0ssiab3WC9HrLSkZ9Xiev6xTO64XA6Qj/RvDmL3ympNUNxfbc5waFyispxFJHLTf2h/n/iULp01i0bf9T6CQNirqi88d5I5RDvY7e6yhRm+ZCAoXCWAnfLNoqDvMdoMEA0ivToVGI1b8KQcJlmTI4ngT46o9sbIiyJSzCQ9i4ZUmRgpmQSfb0OjqKfzkjwliuRkqx0Ar2yIZLkf1CgolQX1eyB+kQUyfizQD/edTiU+ZZ6CLalOmX8+MRDHmGZiO28b8X7UrHyk8DO3h4AIFa/ypnaEQ/fmjIZ12rwcFrQhJumZH+5cbh1OmKaHeBmjAC1Fa5Fiw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(41300700001)(6506007)(86362001)(53546011)(6512007)(26005)(38070700005)(122000001)(2616005)(186003)(8936002)(38100700002)(76116006)(33656002)(4744005)(66946007)(5660300002)(66556008)(66476007)(64756008)(4326008)(36756003)(66446008)(6916009)(2906002)(8676002)(91956017)(6486002)(54906003)(478600001)(71200400001)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F88133C92840B94DA63654EFEB12B432@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4801
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3d6b6ffd-e2ec-47aa-7299-08da71680be2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tFy7xJ8brEdPPzn03L2xUhUfKT75LGyYTFZ/wMxy5YaHbCkVgIymVYfFF7N3PHp03KOxKGRZ3cu0ocjoKFxoNWtx5+3YyJ1vLE3PtmEbhIfdc0gjpWGEh6z9cnfI3NeiOn32FjIAof9DnR4E3p/mKRTQvS7GAIqRfLYD56ba53bKoIC10/aOJwzweBuCPMEz8KBRtixhUOmFZ3YrAHoo3PY7fDE4MMX3+hd2SynelM5qF4mkrlIQ/CE5l1XoijB5B65Oe1vg6xIKka4Nc0f0VAY8B7KMhrsDqU14uOwOW4nH8G0dJ5LezLKh27rmdXFzbHFfRFiKX21CTwJuoVLeWX6Wm4yFy4csMTwT7NfnEPZq+/nPzH7xYd8onUE9ugfbBNOA0jDMT8fT/3pFu705jn0T4L0kg7xz5pv9XgM2b8DGenes+ug/8KE1xIcMBdiG2YhiTNjOS7ds2BNbSjRSgqVlHUHQkSBykYdYLsRvG2e7AJo/Xm8INhvV5jacNKOsmDb8dJnr2+AUA9yebKjAJi+YeWJJChV9R4d/FoP3TovO5jK2Z2cf3QgMlCRjFzFoGipgp6NjWaXhxV8/O1CwB0lV7+8KWxXxv/6YbYTcAtQ+U9mlYNLkn6iOp3epF3CQrhOUfM0FSiC6CUm3F7sfGrv2vdkC3WC76XL2Y8aFDedWQWbI2LO2OQ61Py4CU58k51hPXINh340gxk8rXrbl6124XdugVCpPQ440uu+jZgtbzIJfjzESULyFefYUEz9D+NuPp1QTzZsRSb3UaXldvyyTBE90Ia26YIdHCD+miR6eyqdZON83grhx7ZowNeK9
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(396003)(39860400002)(346002)(36840700001)(46966006)(40470700004)(83380400001)(336012)(186003)(8676002)(70586007)(70206006)(2906002)(47076005)(316002)(4326008)(53546011)(36756003)(2616005)(54906003)(6512007)(6506007)(26005)(41300700001)(356005)(86362001)(40460700003)(33656002)(36860700001)(40480700001)(82310400005)(6862004)(5660300002)(8936002)(4744005)(81166007)(82740400003)(6486002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 13:41:41.5678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23cc294e-37f0-4710-c891-08da716811d8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7116

Hi Xenia,

> On 29 Jul 2022, at 07:31, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>=20
> Hi Jan,
>=20
> On 7/29/22 09:26, Jan Beulich wrote:
>> On 28.07.2022 18:21, Xenia Ragiadakou wrote:
>>> --- a/xen/arch/arm/domain.c
>>> +++ b/xen/arch/arm/domain.c
>>> @@ -63,7 +63,7 @@ static void do_idle(void)
>>>      rcu_idle_exit(cpu);
>>>  }
>>>  -void idle_loop(void)
>>> +static void idle_loop(void)
>> While you're adding "noreturn" below, shouldn't this one be marked so
>> as well? Preferably with the addition:
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
> Yes, but I was not sure if this should go in this patch or in a separate =
one.

As you modify the function to make it static, I think it is ok to also add =
the noreturn in the same patch.

With that done, you can add my:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand
>=20
> --=20
> Xenia


