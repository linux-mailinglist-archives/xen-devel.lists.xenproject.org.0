Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0324415D1A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 13:54:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193790.345216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNHg-0001gi-O4; Thu, 23 Sep 2021 11:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193790.345216; Thu, 23 Sep 2021 11:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNHg-0001ev-Kw; Thu, 23 Sep 2021 11:53:00 +0000
Received: by outflank-mailman (input) for mailman id 193790;
 Thu, 23 Sep 2021 11:53:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y7SS=ON=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mTNHf-0001ep-U1
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 11:53:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.68]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb149d78-1c64-11ec-ba2d-12813bfff9fa;
 Thu, 23 Sep 2021 11:52:57 +0000 (UTC)
Received: from AM7PR03CA0018.eurprd03.prod.outlook.com (2603:10a6:20b:130::28)
 by AM0PR08MB3796.eurprd08.prod.outlook.com (2603:10a6:208:100::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Thu, 23 Sep
 2021 11:52:55 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::2c) by AM7PR03CA0018.outlook.office365.com
 (2603:10a6:20b:130::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 11:52:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 11:52:54 +0000
Received: ("Tessian outbound 71ebfb754289:v103");
 Thu, 23 Sep 2021 11:52:53 +0000
Received: from b09edc9b00eb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 265B9692-005D-48EE-B4E5-E5CC12B9C452.1; 
 Thu, 23 Sep 2021 11:52:41 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b09edc9b00eb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 11:52:41 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6181.eurprd08.prod.outlook.com (2603:10a6:20b:29a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 11:52:40 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%7]) with mapi id 15.20.4544.014; Thu, 23 Sep 2021
 11:52:39 +0000
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
X-Inumbo-ID: cb149d78-1c64-11ec-ba2d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrA1IBMBSCWmY0iQLpEx6FUR9pt03y1bOEHFTxWBqag=;
 b=hU8LjnCHevcWDYTRTDkWyBqd7m18DZW/dznWXNoqRBELAV38AxXsHNK+7EamYVvkB0k9py0LDvvgBXDKjCT0Wwcc6g1L5KYwKHNBGspJDr1JYu+Frunk+N3Ymg3ZWq6yakAu49g2DAu4PEdn8dKbTfVzqdZkbhNQ5pBosQqgzOQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 65e5f4c983969980
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZELO0Fsh22IzcAWmmIFrMhJ1x8ZxEtk5H7aqubMWalBn0qUM9KDFECcLd2QW4D9xT1QyaBYlrKXyC8noENBBmBrFI1iAn511vVUhJXaGYB3vzx3RkVAST+CgqQ73Qxd/RUhyeZ/5WPlxeolNEUXT9FzGfCcNYlE18lqtUzT2fbKMIuMEx3MfozQjmXoNjD+9IdJ1U6j9d7K6nbpfB+4dRTHs8LdeEWB1qOwcTTqMXNTZwjA1FuaKwko93T2BnZiBzhZdduCKqDp5fe+NUHOuncfPkn/+NBF1o879echsqKOZ0q1Rd9hcwxaMKh/Y1GNWClXtmgD5JU8r5lTLeFr82Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=XrA1IBMBSCWmY0iQLpEx6FUR9pt03y1bOEHFTxWBqag=;
 b=nJbdv3lNm4RNnxpjBfPtcrs0PiIJ4FFN5tcea/nzWrE5++Rq62kznKmTQCa2lZ17F6ZVjmVvjn45ODQIYWohpgyHAaD8gM/pOTXuHEs83HT9IhvsYPIVKjkxcuXU9ftBrEW0Xyxmku5UIRlhnhaz9zSS6D3szXvg/4byapm+rfvxe59L+g7Bpkg3+6F9Dlr5t7pPpfTpqLaOePaFi8hb77h5Up976eXz6RHuw0TwQYO+GhK2RfKxhbb82Pewy9rsbO73HnpQaJSoc3bW2DOTOa5UFDoqcMKKBW9bylRAE297g5Dbt69iUT0fgLJK/Xp5f0/yakAyiI6h6zd/kZQGow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrA1IBMBSCWmY0iQLpEx6FUR9pt03y1bOEHFTxWBqag=;
 b=hU8LjnCHevcWDYTRTDkWyBqd7m18DZW/dznWXNoqRBELAV38AxXsHNK+7EamYVvkB0k9py0LDvvgBXDKjCT0Wwcc6g1L5KYwKHNBGspJDr1JYu+Frunk+N3Ymg3ZWq6yakAu49g2DAu4PEdn8dKbTfVzqdZkbhNQ5pBosQqgzOQ=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, Julien
 Grall <julien@xen.org>
Subject: Re: [PATCH v2 08/17] xen/device-tree: Add dt_get_pci_domain_nr helper
Thread-Topic: [PATCH v2 08/17] xen/device-tree: Add dt_get_pci_domain_nr
 helper
Thread-Index: AQHXr6ZY75EobBA4I0aERqDKzahV06uwueAAgADJ1gA=
Date: Thu, 23 Sep 2021 11:52:39 +0000
Message-ID: <8D1C3683-3AB7-4A83-B6A9-2442102164BB@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
 <b649f9f978ed38f05927573381e23f9b3c6c24b8.1632307952.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109221649260.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109221649260.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 646f6651-849a-43ed-6bb3-08d97e88adf2
x-ms-traffictypediagnostic: AS8PR08MB6181:|AM0PR08MB3796:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB379654793133762D96D80974FCA39@AM0PR08MB3796.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2276;OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MJIdFoNZW7Xjxu4JjbNdecMFysP0Bj1VVRUh71qr3lrirHmUo6WqYeXUW/m8+b9hT7o1MZSRtG2UriFyJIAGN/hJ95jCCP2KK97dAoQbKa3OsiEMz26OTMbsdx3vmMNcrwcIkEIaeYpi5lPs8zb4pnWfvYeE6fjszRkZXQvJs6bDaHP0KPoWzIPgI5wRLIDy52H8iipvb7MhUuOLtTAXYdQyjSbHLoVK0l/QQ5fCPGq7QDyDLyrCUrzwIcI9cgYV/sIGwS0L0nr1764ZdTKNiW6sbamyf3XX/7tco6j2GAxvqYX4wUho+xWtNt4LcwytSRusbrhpyVFq/fINpvfiPu3wO0b+nplMhKAyA6HkxkI6+3fRdkgyVlMQRAWazuNLOfTVVFLJcgOHB9qg/xbVAb41tm++eUyLNFHbWUWwvyy5mYRun7EswE9Pdxwlc8/HSsSVJt74zJW58H1EKTbhx7TbQLYrw9xMACG2tkuesj7ejGVVA+rM3sgIS3nolUDwdC0toa4Ya9JRgd5O6/Vfl8f0hJhvC+4mCvLAT4jyjnW9pWhAO0tTcJxlLffwARqIjwwCVo4bZVZyDMmpBgw1FR0PVzORQ7pcrY3QdYhY/O5YZf7+3sL41CxXfwC49JzM+S4o05THjRlvgWQRL7zTbsAaLLe8WaT/Nk+INwEP4iRtP9TDBP2b+RGfpwynepiKEA6IqAEQgW1zsEdk/A1zY7NEUfbvw0NcwYNy7GyAui7bRfI6EaGQrjjr1bLV4eF0
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(6916009)(8676002)(33656002)(316002)(5660300002)(6512007)(8936002)(86362001)(54906003)(2616005)(71200400001)(4326008)(91956017)(76116006)(122000001)(66556008)(64756008)(38100700002)(2906002)(186003)(66446008)(53546011)(66946007)(66476007)(26005)(6506007)(36756003)(6486002)(508600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <130275A2D43EA44FAF1B6487D441B0A2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6181
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6203eaac-dd74-4fd8-0894-08d97e88a508
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cSthg0DYVTCS38toibG77W5tJhJpd6BsDsXhCdVqvI542nvy5V1QNs6lKfEiBk3YNA1PjGMnCxxUGK15J1gGMrwnKum0ps/WzMKAG0BaMBWrrZDdaVQq93gLKwjZiXhqhui2pl+T4okGUBG8ho88NRHa5Ck6hwiIIOq7K+Xs+J4Agk2nyD/3Arv2AwjDYLWCBEiUI4H4yqxhWW+yBzMRd/nXNWETqWtME0CdhtKU3FXQ1Bw1X223YqmmxASrQWE6uTKliIP+bFLgBTEwxPLfa+XyTOWsrafn3TgLdZSmfv3fGn9VzCJQdQJteZpLV5G+ZP3/cCagK6sZbf29zh4B9dm4qVUGy7IMY1xISBzur//2loPv9e0wlwbeFJHukncY385f6zJQE32q/r2YNsu89YFVZvGKiTjl+zaKZEj0R/xF7EM3FhxAXhtDYWc/41o8eg1gr8XkXHL0REYjaVT6ZGoOQeGfYJzqQsConpvqTMy/tP96Y9SGRKSpI6a89kZuxt5UzhErO9sejMMylPZXSgzVJsxr4kMBuJmhrZ4PK2Fa8UgnRUlOrBRP0gY0q/uYukdxt07dt7Tzg03MnoG+Wro6jG/kB5Wn6BBv3vq84McNPhZwFvcFNLSgf8pL7CWxZgmt1mOy+274kTYfHz9oh4jKJ/8Z/NyhogESGTWHawO6PAqVd1AzLAXaVFlIs0LtmbeoD50o7WGtoTH4g/w9Cw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(54906003)(70586007)(70206006)(4326008)(47076005)(316002)(36860700001)(86362001)(186003)(53546011)(26005)(508600001)(33656002)(36756003)(2906002)(6506007)(6486002)(8936002)(6512007)(2616005)(8676002)(336012)(6862004)(356005)(5660300002)(81166007)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 11:52:54.8053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 646f6651-849a-43ed-6bb3-08d97e88adf2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3796

Hi Stefano,

> On 23 Sep 2021, at 12:50 am, Stefano Stabellini <sstabellini@kernel.org> =
wrote:
>=20
> On Wed, 22 Sep 2021, Rahul Singh wrote:
>> Based on tag Linux v5.14.2 commit bbdd3de144fc142f2f4b9834c9241cc4e7f3d3=
fc
>=20
> Please use an upstream commit id
Ack.
>=20
>=20
>> Import the Linux helper of_get_pci_domain_nr. This function will try to
>> obtain the host bridge domain number by finding a property called
>> "linux,pci-domain" of the given device node.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Change in v2: Patch introduced in v2
>> ---
>> xen/common/device_tree.c      | 12 ++++++++++++
>> xen/include/xen/device_tree.h | 19 +++++++++++++++++++
>> 2 files changed, 31 insertions(+)
>>=20
>> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
>> index 53160d61f8..ea93da1725 100644
>> --- a/xen/common/device_tree.c
>> +++ b/xen/common/device_tree.c
>> @@ -2183,6 +2183,18 @@ void __init dt_unflatten_host_device_tree(void)
>>     dt_alias_scan();
>> }
>>=20
>> +int dt_get_pci_domain_nr(struct dt_device_node *node)
>> +{
>> +    u32 domain;
>> +    int error;
>> +
>> +    error =3D dt_property_read_u32(node, "linux,pci-domain", &domain);
>> +    if ( !error )
>> +        return -EINVAL;
>> +
>> +    return (u16)domain;
>> +}
>> +
>> /*
>>  * Local variables:
>>  * mode: C
>> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree=
.h
>> index 497144b8a7..9069040ef7 100644
>> --- a/xen/include/xen/device_tree.h
>> +++ b/xen/include/xen/device_tree.h
>> @@ -831,6 +831,25 @@ int dt_count_phandle_with_args(const struct dt_devi=
ce_node *np,
>>                                const char *list_name,
>>                                const char *cells_name);
>>=20
>> +/**
>> + * dt_get_pci_domain_nr - Find the host bridge domain number
>> + *            of the given device node.
>> + * @node: Device tree node with the domain information.
>> + *
>> + * This function will try to obtain the host bridge domain number by fi=
nding
>> + * a property called "linux,pci-domain" of the given device node.
>> + *
>> + * Return:
>> + * * > 0    - On success, an associated domain number.
>> + * * -EINVAL    - The property "linux,pci-domain" does not exist.
>> + * * -ENODATA   - The linux,pci-domain" property does not have value.
>> + * * -EOVERFLOW - Invalid "linux,pci-domain" property value.
>=20
> This doesn't match reality for us because it can only return EINVAL

I will remove in next version.

Regards,
Rahul
>=20
>> + * Returns the associated domain number from DT in the range [0-0xffff]=
, or
>> + * a negative value if the required property is not found.
>> + */
>> +int dt_get_pci_domain_nr(struct dt_device_node *node);
>> +
>> #ifdef CONFIG_DEVICE_TREE_DEBUG
>> #define dt_dprintk(fmt, args...)  \
>>     printk(XENLOG_DEBUG fmt, ## args)
>> --=20
>> 2.17.1


