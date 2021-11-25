Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED00245DE9E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 17:30:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231657.401006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqHcQ-0000e5-HA; Thu, 25 Nov 2021 16:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231657.401006; Thu, 25 Nov 2021 16:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqHcQ-0000ap-D8; Thu, 25 Nov 2021 16:29:06 +0000
Received: by outflank-mailman (input) for mailman id 231657;
 Thu, 25 Nov 2021 16:29:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a/TS=QM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mqHcO-0000aj-51
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 16:29:04 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe08::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc99a31f-4e0c-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 17:29:02 +0100 (CET)
Received: from AM5PR0701CA0024.eurprd07.prod.outlook.com
 (2603:10a6:203:51::34) by PAXPR08MB6970.eurprd08.prod.outlook.com
 (2603:10a6:102:1d9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Thu, 25 Nov
 2021 16:28:59 +0000
Received: from AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::1d) by AM5PR0701CA0024.outlook.office365.com
 (2603:10a6:203:51::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.7 via Frontend
 Transport; Thu, 25 Nov 2021 16:28:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT027.mail.protection.outlook.com (10.152.16.138) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 25 Nov 2021 16:28:58 +0000
Received: ("Tessian outbound 9a8c656e7c94:v110");
 Thu, 25 Nov 2021 16:28:58 +0000
Received: from 4d35c3c40389.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 33D2B551-49DF-465D-A786-3F0270E5E3FD.1; 
 Thu, 25 Nov 2021 16:28:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4d35c3c40389.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 25 Nov 2021 16:28:47 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM5PR0802MB2436.eurprd08.prod.outlook.com (2603:10a6:203:a1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19; Thu, 25 Nov
 2021 16:28:44 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4713.026; Thu, 25 Nov 2021
 16:28:44 +0000
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
X-Inumbo-ID: cc99a31f-4e0c-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ed4sNcmqP40QxRsYxE30T76p4TxdiBhR93CLAm+6rM8=;
 b=FC1mE13iDbX6w8zIYZd04YjI8n9c40JMUAYyKAlV2YBq89l8IlSKQP54/NJmfzkkojMGu3wnakGS84xJAtxS9NhAD8r0o4FlI6Wd0Q9LQmfG7paPzYrr0+rYi6mUQXMKz3nSCzR34DefFwxonyZS/u8FRQeGc//XsLEoyH4p+r0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 48ce32448fd3d68d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeCZee/VFj0KjHoWkx6a2u7rKR6bJu4n3tcc7qf3z7JzhGq5NzUW+y3SO5i2bMQbhr9HDz/maro/fqwbODVsw+Au7OF1nIT9+T2JqXIvS0bzUPN+AVaBHzYmK7gYmOIIGWU87aDsG63v7w2wYM7BjzIR/zIMZMPVTVNcu52puoP2HMyDKU07emVhSThxu0Y+JdEz18SWnYwaHnN/NHU8DGtmFv6SE76jlpHwur1NTvsgnvKWP7aliFAx5A2oIX0IMZ54UaMeZlkuW7FXEIJhpIO0Ca25UHa0cOcVznYUFzkaHe5UdF7LRkrfDkL9UBKxpJcJaBwxTsoX9yyrKTJMRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ed4sNcmqP40QxRsYxE30T76p4TxdiBhR93CLAm+6rM8=;
 b=gR0KbZOzslYjhrEpUFEdvv9KDzhOMR4ceJQV4UjnJ7RHWxFqZoFB0tiTNyMErJ9/NMMUe25dnf15mLvSbfkqpJb9S3fcW+0NdcZuElmK4UNLGnO+5CJE+w/hHGsPqv1PrnvJj1T66ysJnxt/Y9TDPP1v0HMC2ZkluMxFJo3lCt+DMN29Ok9C3t//snlSY2K0Y4mig1LbkCVgzftVFf25rqeMN1HtxQwLNwrarGZHB+1NphFL90yqbVOgvecQdMYzbgP6lDRMibIW8Mb9YbwHHFMaf2Okt5zR/zzJz9IUrr7PgGdfYeyKQaynyuIfonpvUhiZjcRTwprPBxYvYvyzIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ed4sNcmqP40QxRsYxE30T76p4TxdiBhR93CLAm+6rM8=;
 b=FC1mE13iDbX6w8zIYZd04YjI8n9c40JMUAYyKAlV2YBq89l8IlSKQP54/NJmfzkkojMGu3wnakGS84xJAtxS9NhAD8r0o4FlI6Wd0Q9LQmfG7paPzYrr0+rYi6mUQXMKz3nSCzR34DefFwxonyZS/u8FRQeGc//XsLEoyH4p+r0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
	"volodymyr_babchuk@epam.com" <volodymyr_babchuk@epam.com>,
	"Artem_Mygaiev@epam.com" <Artem_Mygaiev@epam.com>, "roger.pau@citrix.com"
	<roger.pau@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Rahul Singh <Rahul.Singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Index: AQHX4ewf3kblZEQ5zUuMTx5k5jz7jqwUbywA
Date: Thu, 25 Nov 2021 16:28:44 +0000
Message-ID: <34FC3FE6-EBA8-4A5C-A1F3-1E9F98C0337F@arm.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com>
In-Reply-To: <20211125110251.2877218-7-andr2000@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d8a335b0-2af9-42fb-45de-08d9b030aef8
x-ms-traffictypediagnostic: AM5PR0802MB2436:|PAXPR08MB6970:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6970FD1DFCD7E3F80E0877369D629@PAXPR08MB6970.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:291;OLM:291;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8NHRCoc2imcteLSDfdd2/kGJe/nKkB8TnFuRTXE09Dt8cVAgrXHKNXAEYv9iPKD61/++ennj1jvGtWSv6vMSKVjlGS4qKYCiElaOxBVE48d4bsV2oJLFyGH2eKEMymmi+s1o88i7h9YMKUxMzt2m7YOsuTiDLAYaPLAEXAV4amokOIXkkp98fH+LofS6HbEkaNbsIKeVhWKnyT1QnzOsYbWI7LIJ/Q4214U5FIt0OuMHiDeG5q3rUV1s+vklu4T/sFsmNp82CjwcKOJKieJ7arbvdutqus+wktP1Z/hhGVDRavX4S3pABS2CzBFecLwxG9opxmMUKc9DLZMuIuI1pW0O0XWj4LMUPWQ47graWlw47dhXs2M2FHAgutIGINeOZ7C4frSsqEqM5pdGtCGdlOETaG62NCxDisdAoIeDltg8pd6FcOaV6QGRdeIqwL/5FcynzMt7/pF0/JVKErYc/1OsYo7qvOraBpyM+Q8YF58WAwzOegfA4bzAIEKkZf6y4ebSPUuXLzNynk7GUwwSHVQ2tlrHe0mBCOjyLzDMfLBdwz/h65XRYGdiMyGLE0lg3hrQN02vfzEr5K0i2TSZ+dllRPypE1aQxTVqHwezoOmq9WpPIKWFL1wzVd0MoZtgvvPFmND4kWPx+65RQQDRywTIHRq7qouHZhDik2qIFNbjDx/RdgmQ7L11lEfk4m4XGSyBEujFZz7qCZWdnYupJGY4z5xWZOv00FW2/7YRj+f0HqyL3IzYfAeUEveVegYX
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(64756008)(71200400001)(86362001)(6506007)(33656002)(66556008)(6486002)(83380400001)(6916009)(8676002)(316002)(38100700002)(7416002)(66446008)(6512007)(5660300002)(66946007)(186003)(91956017)(76116006)(53546011)(508600001)(66476007)(26005)(2906002)(36756003)(38070700005)(4326008)(8936002)(122000001)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EAE40928C2632640BADCB67DD0D92C6C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2436
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1416b25c-aa0e-4de2-fe02-08d9b030a626
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RTzjHZuF7oDc2OVha21Wo07FH6VOT4T5KPYWGB15qdWfQknWJJ0XmCydzjDRTfO1VkmOo/0uqREqVLXFQ6np0pS4BKEO12weCorYQCqFknuzutLpo8i11CYptwkWuKgReACaFGMh1drJhiHeth6bYpIq5/Z9O/D2Ht/ELTtviXducTzYDUxZsO54LnArcH3tNhPbs3/S6MaO7PMtW+uWI6UsPADXf8v76504kTRbSMDVJbHv8mnUEEREJG03LN5ovWZHE2KwAyTaQtcow8OVoFjIhDPG4wt9r0MP4gAoPieSznegM1IC7K7tMS1RMDcQ5nSeICkAql9t2GeYa7doPJXlUxkvkrACmYlurdUmMSzmjSz5fhhmZg294xqUrEX+uJ4DnDEQWmgs8SqIOCDb6uuMNeLesI+eAs1NfqxKwGe91onAzesx7Z+Fr4waiXgvArJctDJrWfrvMF/YC5OuQlLW9wypLuO7aZk7vLKLjpRZcgeyrytzImHsvnDN3AKlhn6qkEpomBpSmjLsY4BdTxgYwLu6CdiIXXl5Aem75Bj8qZetIomfLUcokZr/QiF7w0erHxWQhw6h61wloZdIjgMragoQkXF/kLi3ODfEAnqDQ1EbOkxJSUc4igAX05JI+2mTOUeLXBb6LBPrqI2ecgHwejPPs4X6eAYfqbhA5nO9iqjNDyyOoABgu18hqM22/FoSeOJ8fhUJyOznB3797w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2616005)(5660300002)(508600001)(6512007)(2906002)(336012)(8676002)(82310400004)(8936002)(36860700001)(54906003)(316002)(186003)(356005)(81166007)(47076005)(36756003)(33656002)(6486002)(70206006)(70586007)(4326008)(26005)(53546011)(6862004)(6506007)(86362001)(107886003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 16:28:58.9271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a335b0-2af9-42fb-45de-08d9b030aef8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6970

Hi Oleksandr,

> On 25 Nov 2021, at 11:02, Oleksandr Andrushchenko <andr2000@gmail.com> wr=
ote:
>=20
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> Add relevant vpci register handlers when assigning PCI device to a domain
> and remove those when de-assigning. This allows having different
> handlers for different domains, e.g. hwdom and other guests.
>=20
> Emulate guest BAR register values: this allows creating a guest view
> of the registers and emulates size and properties probe as it is done
> during PCI device enumeration by the guest.
>=20
> ROM BAR is only handled for the hardware domain and for guest domains
> there is a stub: at the moment PCI expansion ROM handling is supported
> for x86 only and it might not be used by other architectures without
> emulating x86. Other use-cases may include using that expansion ROM befor=
e
> Xen boots, hence no emulation is needed in Xen itself. Or when a guest
> wants to use the ROM code which seems to be rare.

In the generic code, bars for ioports are actually skipped (check code befo=
re
in header.c, in case of ioports there is a continue) and no handler is regi=
stered for them.
The consequence will be that a guest will access hardware when reading thos=
e BARs.

I think we should instead make sure that we intercept all accesses to BARs =
and return
something empty for IOPORTS BARs.

Regards
Bertrand

>=20
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v4:
> - updated commit message
> - s/guest_addr/guest_reg
> Since v3:
> - squashed two patches: dynamic add/remove handlers and guest BAR
>  handler implementation
> - fix guest BAR read of the high part of a 64bit BAR (Roger)
> - add error handling to vpci_assign_device
> - s/dom%pd/%pd
> - blank line before return
> Since v2:
> - remove unneeded ifdefs for CONFIG_HAS_VPCI_GUEST_SUPPORT as more code
>  has been eliminated from being built on x86
> Since v1:
> - constify struct pci_dev where possible
> - do not open code is_system_domain()
> - simplify some code3. simplify
> - use gdprintk + error code instead of gprintk
> - gate vpci_bar_{add|remove}_handlers with CONFIG_HAS_VPCI_GUEST_SUPPORT,
>   so these do not get compiled for x86
> - removed unneeded is_system_domain check
> - re-work guest read/write to be much simpler and do more work on write
>   than read which is expected to be called more frequently
> - removed one too obvious comment
> ---
> xen/drivers/vpci/header.c | 72 +++++++++++++++++++++++++++++++++++----
> xen/include/xen/vpci.h    |  3 ++
> 2 files changed, 69 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index ba333fb2f9b0..8880d34ebf8e 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -433,6 +433,48 @@ static void bar_write(const struct pci_dev *pdev, un=
signed int reg,
>     pci_conf_write32(pdev->sbdf, reg, val);
> }
>=20
> +static void guest_bar_write(const struct pci_dev *pdev, unsigned int reg=
,
> +                            uint32_t val, void *data)
> +{
> +    struct vpci_bar *bar =3D data;
> +    bool hi =3D false;
> +
> +    if ( bar->type =3D=3D VPCI_BAR_MEM64_HI )
> +    {
> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> +        bar--;
> +        hi =3D true;
> +    }
> +    else
> +    {
> +        val &=3D PCI_BASE_ADDRESS_MEM_MASK;
> +        val |=3D bar->type =3D=3D VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_=
TYPE_32
> +                                           : PCI_BASE_ADDRESS_MEM_TYPE_6=
4;
> +        val |=3D bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
> +    }
> +
> +    bar->guest_reg &=3D ~(0xffffffffull << (hi ? 32 : 0));
> +    bar->guest_reg |=3D (uint64_t)val << (hi ? 32 : 0);
> +
> +    bar->guest_reg &=3D ~(bar->size - 1) | ~PCI_BASE_ADDRESS_MEM_MASK;
> +}
> +
> +static uint32_t guest_bar_read(const struct pci_dev *pdev, unsigned int =
reg,
> +                               void *data)
> +{
> +    const struct vpci_bar *bar =3D data;
> +    bool hi =3D false;
> +
> +    if ( bar->type =3D=3D VPCI_BAR_MEM64_HI )
> +    {
> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> +        bar--;
> +        hi =3D true;
> +    }
> +
> +    return bar->guest_reg >> (hi ? 32 : 0);
> +}
> +
> static void rom_write(const struct pci_dev *pdev, unsigned int reg,
>                       uint32_t val, void *data)
> {
> @@ -481,6 +523,17 @@ static void rom_write(const struct pci_dev *pdev, un=
signed int reg,
>         rom->addr =3D val & PCI_ROM_ADDRESS_MASK;
> }
>=20
> +static void guest_rom_write(const struct pci_dev *pdev, unsigned int reg=
,
> +                            uint32_t val, void *data)
> +{
> +}
> +
> +static uint32_t guest_rom_read(const struct pci_dev *pdev, unsigned int =
reg,
> +                               void *data)
> +{
> +    return 0xffffffff;
> +}
> +
> static int init_bars(struct pci_dev *pdev)
> {
>     uint16_t cmd;
> @@ -489,6 +542,7 @@ static int init_bars(struct pci_dev *pdev)
>     struct vpci_header *header =3D &pdev->vpci->header;
>     struct vpci_bar *bars =3D header->bars;
>     int rc;
> +    bool is_hwdom =3D is_hardware_domain(pdev->domain);
>=20
>     switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
>     {
> @@ -528,8 +582,10 @@ static int init_bars(struct pci_dev *pdev)
>         if ( i && bars[i - 1].type =3D=3D VPCI_BAR_MEM64_LO )
>         {
>             bars[i].type =3D VPCI_BAR_MEM64_HI;
> -            rc =3D vpci_add_register(pdev->vpci, vpci_hw_read32, bar_wri=
te, reg,
> -                                   4, &bars[i]);
> +            rc =3D vpci_add_register(pdev->vpci,
> +                                   is_hwdom ? vpci_hw_read32 : guest_bar=
_read,
> +                                   is_hwdom ? bar_write : guest_bar_writ=
e,
> +                                   reg, 4, &bars[i]);
>             if ( rc )
>             {
>                 pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> @@ -569,8 +625,10 @@ static int init_bars(struct pci_dev *pdev)
>         bars[i].size =3D size;
>         bars[i].prefetchable =3D val & PCI_BASE_ADDRESS_MEM_PREFETCH;
>=20
> -        rc =3D vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, =
reg, 4,
> -                               &bars[i]);
> +        rc =3D vpci_add_register(pdev->vpci,
> +                               is_hwdom ? vpci_hw_read32 : guest_bar_rea=
d,
> +                               is_hwdom ? bar_write : guest_bar_write,
> +                               reg, 4, &bars[i]);
>         if ( rc )
>         {
>             pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> @@ -590,8 +648,10 @@ static int init_bars(struct pci_dev *pdev)
>         header->rom_enabled =3D pci_conf_read32(pdev->sbdf, rom_reg) &
>                               PCI_ROM_ADDRESS_ENABLE;
>=20
> -        rc =3D vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write, =
rom_reg,
> -                               4, rom);
> +        rc =3D vpci_add_register(pdev->vpci,
> +                               is_hwdom ? vpci_hw_read32 : guest_rom_rea=
d,
> +                               is_hwdom ? rom_write : guest_rom_write,
> +                               rom_reg, 4, rom);
>         if ( rc )
>             rom->type =3D VPCI_BAR_EMPTY;
>     }
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index ed127a08a953..0a73b14a92dc 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -68,7 +68,10 @@ struct vpci {
>     struct vpci_header {
>         /* Information about the PCI BARs of this device. */
>         struct vpci_bar {
> +            /* Physical view of the BAR. */
>             uint64_t addr;
> +            /* Guest view of the BAR: address and lower bits. */
> +            uint64_t guest_reg;
>             uint64_t size;
>             enum {
>                 VPCI_BAR_EMPTY,
> --=20
> 2.25.1
>=20


