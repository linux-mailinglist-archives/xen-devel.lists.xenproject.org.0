Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0682D412E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 12:34:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48155.85149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmxk0-0005aF-If; Wed, 09 Dec 2020 11:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48155.85149; Wed, 09 Dec 2020 11:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmxk0-0005Zq-EF; Wed, 09 Dec 2020 11:34:40 +0000
Received: by outflank-mailman (input) for mailman id 48155;
 Wed, 09 Dec 2020 11:34:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiOm=FN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kmxjy-0005Yz-5U
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 11:34:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.42]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5c7f4ce-e73e-4392-adce-96e34b14a115;
 Wed, 09 Dec 2020 11:34:37 +0000 (UTC)
Received: from AM5PR1001CA0026.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::39)
 by AM9PR08MB6308.eurprd08.prod.outlook.com (2603:10a6:20b:287::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Wed, 9 Dec
 2020 11:34:35 +0000
Received: from AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::9) by AM5PR1001CA0026.outlook.office365.com
 (2603:10a6:206:2::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 9 Dec 2020 11:34:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT053.mail.protection.outlook.com (10.152.16.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 11:34:34 +0000
Received: ("Tessian outbound 6af064f543d4:v71");
 Wed, 09 Dec 2020 11:34:34 +0000
Received: from 42170922e995.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F1B8FA4A-1F39-49D7-A19B-47EBAA7172F1.1; 
 Wed, 09 Dec 2020 11:34:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 42170922e995.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Dec 2020 11:34:19 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB6075.eurprd08.prod.outlook.com (2603:10a6:10:207::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Wed, 9 Dec
 2020 11:34:17 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 11:34:17 +0000
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
X-Inumbo-ID: e5c7f4ce-e73e-4392-adce-96e34b14a115
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCsIW8HwRg6tCtIHiltBiyAFuFodchcZeoGi09AQt48=;
 b=hxp2ZWsG+PmVq3rsDcNNnjcKJk1oHIQuBZYgaoakSRZOIVpwoIyBFE9gMfP16WqqqmldpDIUpaTV7kIVnVqoHwpd36+KbX8Q31e/6RidSOZ4b+kxA3ahaxaGun0w1MswCSt8mhaZZoTJvUAMreXhKWHFZ7qDi5Y5WEXfbr8tcc0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 85614dc067c1c540
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDh7hxQfl/xiJ8iH9rVbvQ2HHWC4PjNSzoSRJO2JyAjip2asYg9QDyFl6D+siZ6revU0FSRAWvm2ACMNNhUP+GgCNL852vzvUUWQbhvsXdWBsT3CkLa1mvBzZTnD4l/8VBdRLYGwo77e/90mCkpWQukf5e9nS7Xzm1rM4ks/cL3m24cs48hpSTrrig9HUaXCapl7KAFu3y+iMpelRkNc2wB+dpk2ZvZPi/UAXpC6jFM54+oHAGHC2D//4KI2i2mNuH1QdFy2C40NvwF0iLd6VO5WrpTmzJxsMgpC9HUSYVb4WwS5Cs6gY/lAOpUqpXOvjlY0O74miC4YcMbOYQYSeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCsIW8HwRg6tCtIHiltBiyAFuFodchcZeoGi09AQt48=;
 b=Qeuczp/PGWCrp2eioY46nBT+Bo5u0fDjPZ1gxsQMS5Bbn7FLy/kdiOmZMNTNnIoh4BM2kzd0my+h9UDMc3JaJyMuDlVWj7fwAQSl+Q2W5XwT6q14cbzVG7MrP2y8X9avcKOE1iJfdPl6a68XESsclWIqnMfJfEg6TOyY5CoDLHncv8nWwyVaEfHbWDizuj0+QTfzuz00J9dBh1JN0Owu1WSbxuA14qv5f7AZpjYirtWg5E4NUYA5cgahtvtAHi57fsV/OF51lPDl2t7EKluBskKI4gE7A3Q0XmQdxHbAiqZj0oXeAIga/puAQElqpgLhfPcN6lPsGXqXm4VRHisYrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCsIW8HwRg6tCtIHiltBiyAFuFodchcZeoGi09AQt48=;
 b=hxp2ZWsG+PmVq3rsDcNNnjcKJk1oHIQuBZYgaoakSRZOIVpwoIyBFE9gMfP16WqqqmldpDIUpaTV7kIVnVqoHwpd36+KbX8Q31e/6RidSOZ4b+kxA3ahaxaGun0w1MswCSt8mhaZZoTJvUAMreXhKWHFZ7qDi5Y5WEXfbr8tcc0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 1/8] xen: fix build when $(obj-y) consists of just
 blanks
Thread-Topic: [PATCH v3 1/8] xen: fix build when $(obj-y) consists of just
 blanks
Thread-Index: AQHWwaxOoKHklwCvRUixoNq5gGL6M6nuuxuA
Date: Wed, 9 Dec 2020 11:34:17 +0000
Message-ID: <371B84F7-C2E7-48BA-8591-DC6F95D4412F@arm.com>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
 <511be84d-9a13-17ae-f3d9-d6daf9c02711@suse.com>
In-Reply-To: <511be84d-9a13-17ae-f3d9-d6daf9c02711@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 804ea879-5555-415b-978e-08d89c36676d
x-ms-traffictypediagnostic: DBBPR08MB6075:|AM9PR08MB6308:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6308DA7366C772C6457778079DCC0@AM9PR08MB6308.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IkQ6W+Ww6vyygOkPBuTz/D4Thi4wt5HnWM1QKSZtCepBcK31w5Nf1Qdfc/i5aD3RyOpZ33+Mp/8To7guCc3jx7/h0INJzNMH3rgzU7blKwcKTrgAE3oRLny+oKAQgi6mje8YIOAoH596VKivl0tcO6eT7Y8Fllwkfwory5VV9MkV52As/C9oWQ/XyzmX5PJm7CB2tw4VKjJ8afxkuONRCBVvDkBfN8LrPOxcZLqAKaJJaFbTufaELVMDo/6RMbu1SST8uRNDGIIDB4GjNJeNWLdc3pYwzkQbEQ5RnP+ebSOkqLjdhJ0pFEnOLzRe24xh61YqLZKmAMcLpn088ivwKj61wM5NMbR45Px6y7nL7/EXKe8uItpBzKjYlGCj/xsJ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(6512007)(5660300002)(6486002)(8936002)(53546011)(66446008)(66556008)(71200400001)(36756003)(66476007)(26005)(6506007)(186003)(4326008)(91956017)(478600001)(8676002)(6916009)(66946007)(2616005)(76116006)(33656002)(64756008)(83380400001)(316002)(2906002)(86362001)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?en+4R7BIoAuG185h/FOT3FmCiY8vdhCd+ZKiuBeivAadysYU+QfVXXpWVbQF?=
 =?us-ascii?Q?iT7MtDHJ5qBKmfvM2U6X8pAO+JPk78Gatqcx5cB0/mfE8AZVF5YMchLZDSH2?=
 =?us-ascii?Q?fmf7gAPqvOHd+wgd+NB+HFDSM4DGoDh1WJgy21NtKXcjeH35SYlqAQBVGInB?=
 =?us-ascii?Q?HrKKcaxL6i7pO4OQ1McIHHTtwA0II6nY+UorbcmEEAZQBaB8tRDyDc9Pevpa?=
 =?us-ascii?Q?+9yU3mZKcy6Fm5PJlWp1g43SNEv+xOTIYOBa0qmiNJ0NIWn5mD9opnZjUayf?=
 =?us-ascii?Q?ClzCTBNer0FXXKF79U/4KdIAtJiEBkN6qz+g7ktyTasMCaAhW90dcE8Adme9?=
 =?us-ascii?Q?ZGWWtUp8WCjLXXnet9CqFr8PsmuqFHPUxFhpZtnwOGhimOHrUEye9RycEjp3?=
 =?us-ascii?Q?I3n0hnpF65MM+dEmblRt7fnF1tSo/6ZO6mpJFYpsl9MzSIx9kIAMYLibw3Dd?=
 =?us-ascii?Q?mcXOCpytXt8q30U73sXnI2v0/83t2A+0tGOlgp3m1wpUh2A+MnwbuFPkAg9S?=
 =?us-ascii?Q?UliuYJv5F+qlu+IZ/G/x+KvgrWxZRDBGOmUUvL/S/NEofWlqzbXKHxv6aBiB?=
 =?us-ascii?Q?D+cXxl4osiDnCDwJ6UP0zc1XIGIyWNbXgYKNSjSAqmMu/D6Spg9+iJ6WaxII?=
 =?us-ascii?Q?Ie2eKrOkOsy6Ta47Fm0WAVTJjrK/W9PE0+Ny6EMJlEsm7MLqkAAgLIKdJ1mF?=
 =?us-ascii?Q?5IeAK0hBcectuItmAr8T2bX7sKWdD6NO36S4w+ABPQ/sfvZRraGEYITqB7eX?=
 =?us-ascii?Q?bxVBr3WX/snh/VFS8niYjGsjFx9UQx6jvlrh7dAF7f9GkvkB2+0RF8dQUlzg?=
 =?us-ascii?Q?7nHFZ5MtM5VUK/t3Ml+b6wOJXC++DkUDO9RPLVflTg/XdLH5C9P3KxyKcMqP?=
 =?us-ascii?Q?hWOcrsnC5wKMvMsleqmdOW71vOT3hWCX2ErpCRsH87jmzuG7Pu+NVI3bPZm6?=
 =?us-ascii?Q?UlxHEJ4JWKWmudJ0SXl6CUJClcB20y2qfxIUlfXZMNg4EmAboUmJ+vxdtcHZ?=
 =?us-ascii?Q?mT3K?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <01C5B200E868D84E96A147794A8900E6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6075
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	511bba7c-3ef8-49d4-d534-08d89c365d04
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4gvoS3ID4mhT0nwyfnZR1tW7zQTvIjS7o+oXAkxvtzyRXTWBtthPxCLU2f6uoHP3Ip/0ykDHwbAry9tc+xYGk4NOHKFoUQdrtW+QAvOujTSvZ7H/R7oe3q4yT/5+BmjDRbay5CLJqA/wnRGabwoLsga6vcwKAtC7QNCaxCYCR8QbHG7S0wQAixDuitJM3N/Lhj4R0GH4Tn9WQljZujJCogw5xKaZN5NzUAa9VN5xdIsYzkbUt1kQDBEV6+bdUbn+AinB/AWzlFDUt1lTd8/STHHwYvdhwyIso+YFBLGKlYAv1eZEkbJxSap6ruwK2n4m5xaNDewFRShm42NSe8VwPSCzPBLxj8Dc033avjugS5jOc0dYow/WjPgqhQiGQ0SvGI+sW+ghOwitXrysIA4YSA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(46966005)(36756003)(26005)(2906002)(70206006)(2616005)(70586007)(33656002)(356005)(6512007)(336012)(81166007)(83380400001)(5660300002)(8936002)(86362001)(107886003)(53546011)(6486002)(8676002)(4326008)(6506007)(47076004)(82310400003)(508600001)(36906005)(186003)(6862004)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 11:34:34.9607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 804ea879-5555-415b-978e-08d89c36676d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6308

Hi Jan,

> On 23 Nov 2020, at 15:20, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> This case can occur when combining empty lists
>=20
> obj-y :=3D
> ...
> obj-y +=3D $(empty)
>=20
> or
>=20
> obj-y :=3D $(empty) $(empty)
>=20
> where (only) blanks would accumulate. This was only a latent issue until
> now, but would become an active issue for Arm once lib/ gets populated
> with all respective objects going into the to be introduced lib.a.
>=20
> Also address a related issue at this occasion: When an empty built_in.o
> gets created, .built_in.o.d will have its dependencies recorded. If, on
> a subsequent incremental build, an actual constituent of built_in.o
> appeared, the $(filter-out ) would leave these recorded dependencies in
> place. But of course the linker won't know what to do with C header
> files. (The apparent alternative of avoiding to pass $(c_flags) or
> $(a_flags) would not be reliable afaict, as among these flags there may
> be some affecting information conveyed via the object file to the
> linker. The linker, finding inconsistent flags across object files, may
> then error out.) Using just $(obj-y) won't work either: It breaks when
> the same object file is listed more than once.
>=20
> Reported-by: Julien Grall <julien@xen.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/Rules.mk | 10 +++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/Rules.mk b/xen/Rules.mk
> index 333e19bec343..d5e5eb33de39 100644
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -130,13 +130,13 @@ c_flags +=3D $(CFLAGS-y)
> a_flags +=3D $(CFLAGS-y) $(AFLAGS-y)
>=20
> built_in.o: $(obj-y) $(extra-y)
> -ifeq ($(obj-y),)
> +ifeq ($(strip $(obj-y)),)
> 	$(CC) $(c_flags) -c -x c /dev/null -o $@
> else
> ifeq ($(CONFIG_LTO),y)
> -	$(LD_LTO) -r -o $@ $(filter-out $(extra-y),$^)
> +	$(LD_LTO) -r -o $@ $(filter $(obj-y),$^)
> else
> -	$(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out $(extra-y),$^)
> +	$(LD) $(XEN_LDFLAGS) -r -o $@ $(filter $(obj-y),$^)
> endif
> endif
>=20
> @@ -145,10 +145,10 @@ targets +=3D $(filter-out $(subdir-obj-y), $(obj-y)=
) $(extra-y)
> targets +=3D $(MAKECMDGOALS)
>=20
> built_in_bin.o: $(obj-bin-y) $(extra-y)
> -ifeq ($(obj-bin-y),)
> +ifeq ($(strip $(obj-bin-y)),)
> 	$(CC) $(a_flags) -c -x assembler /dev/null -o $@
> else
> -	$(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out $(extra-y),$^)
> +	$(LD) $(XEN_LDFLAGS) -r -o $@ $(filter $(obj-bin-y),$^)
> endif
>=20
> # Force execution of pattern rules (for which PHONY cannot be directly us=
ed).
> --=20
> 2.22.0
>=20
>=20
>=20


