Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55675415CBE
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 13:22:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193766.345172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMnv-0004Mh-Go; Thu, 23 Sep 2021 11:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193766.345172; Thu, 23 Sep 2021 11:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMnv-0004Jq-Dc; Thu, 23 Sep 2021 11:22:15 +0000
Received: by outflank-mailman (input) for mailman id 193766;
 Thu, 23 Sep 2021 11:22:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y7SS=ON=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mTMnt-0004Jk-Vc
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 11:22:14 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::618])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5fbd94c6-a732-4048-a695-8cec5a3abce0;
 Thu, 23 Sep 2021 11:22:12 +0000 (UTC)
Received: from AM7PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:20b:110::11)
 by DU2PR08MB7270.eurprd08.prod.outlook.com (2603:10a6:10:2d5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 11:22:08 +0000
Received: from AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::f8) by AM7PR04CA0001.outlook.office365.com
 (2603:10a6:20b:110::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Thu, 23 Sep 2021 11:22:08 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM5EUR03FT042.mail.protection.outlook.com (10.152.17.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 11:22:07 +0000
Received: ("Tessian outbound 3c48586a377f:v103");
 Thu, 23 Sep 2021 11:22:06 +0000
Received: from 59b5cb761934.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D1354835-735E-46F1-9A2A-82A382476037.1; 
 Thu, 23 Sep 2021 11:21:57 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 59b5cb761934.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 11:21:57 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM5PR0802MB2499.eurprd08.prod.outlook.com (2603:10a6:203:a1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 11:21:53 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%7]) with mapi id 15.20.4544.014; Thu, 23 Sep 2021
 11:21:53 +0000
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
X-Inumbo-ID: 5fbd94c6-a732-4048-a695-8cec5a3abce0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIZt/hsSKmEAvOlJm6ihDHlyDQUvKbLmTARD9HJTuiA=;
 b=d9dAoqKe++gO/YfN3fT/gwWBRvXf2EIZ9fKFsFjMXP07YV2m7x/lTAt4R817C1ux61f4kJLi1w2BbAqYSP0H8X8B5rXa93INVlxQsyDxLCicLe8ijk/Aey3ldIbdBWqUvyg3z8mtssURr8OPNqUitUQGdf6MGLL9BIdTgQ7oliI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: af0e7891f03c5b7f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vz6CjvnGrpG/7KjQ1L9vYOgiEUSEecRncedvbIJ3AP7WPJQ34pZaNNv3nUgwChxe/iuAnaMFBRf8NCZCXh12MDvADUs/q9zHTSPGAAjNCjFGJw5x2ySt5HDdhIk3Jjwp/XImHwoXSqAPJYz4WtWHbJ56lE7pqmPKrHJyefnSb1nTnVlN9DtiYX26XvUSqNUMzg3hGi+5dj58yyzbnBzW57n4r2TPGJjHd7LFMnC3U3ROHIGEep67EESyiY6llCkinyGp88rNHUW+EuECIqUJwQA65KtjAasBUhdDAHtIJz0jP3TlJz/goreT/5eREDOe6kPlxQG0bgSU9HBPhT5ZwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=JIZt/hsSKmEAvOlJm6ihDHlyDQUvKbLmTARD9HJTuiA=;
 b=C6A34WR7FMuemcr/iSZhA65RRPyU1IMi6/T8mRG0KZowpCssA1W8sUfSD/5WHcaEIdWHFsBuPjyo5zkAsHN2+K1Ckldnmm6uOpMB3W7f9rdTp+SCDtAzcZzvxX9aUWvFsnJxHfwOi1pAZvW4zAlMTjppC2Lfw6ie7m/xmjJ62KxJm9neWUTvjsuaUGVC3kdL34mhK+3f8zf0DGOhSP/V4HeGLSD6r50YtzzhbTrNC1jzTxax5UOpTwV8jvOLeYUDEKZX4B79heevsU1Cz3zQDb263j2lhl66fXO1AdmeNg+BfjZ41yjS4NKvIjQG2D5tWrdHp/nyVpM/DKZvU2X0NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIZt/hsSKmEAvOlJm6ihDHlyDQUvKbLmTARD9HJTuiA=;
 b=d9dAoqKe++gO/YfN3fT/gwWBRvXf2EIZ9fKFsFjMXP07YV2m7x/lTAt4R817C1ux61f4kJLi1w2BbAqYSP0H8X8B5rXa93INVlxQsyDxLCicLe8ijk/Aey3ldIbdBWqUvyg3z8mtssURr8OPNqUitUQGdf6MGLL9BIdTgQ7oliI=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, Julien
 Grall <julien@xen.org>
Subject: Re: [PATCH v2 06/17] xen/device-tree: Add
 dt_property_read_variable_u32_array helper
Thread-Topic: [PATCH v2 06/17] xen/device-tree: Add
 dt_property_read_variable_u32_array helper
Thread-Index: AQHXr6ZA9+m8mQY/6E2BJMEbqtI5eKuwrbKAgADNawA=
Date: Thu, 23 Sep 2021 11:21:53 +0000
Message-ID: <8448D6A9-2152-40B8-8159-65C1AA3D781D@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
 <35eb7ec429da3a9e1af626af4521c13c9683f8fd.1632307952.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109221601240.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109221601240.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 22645990-f420-4796-c788-08d97e846101
x-ms-traffictypediagnostic: AM5PR0802MB2499:|DU2PR08MB7270:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DU2PR08MB7270FDA10590F813C50788ABFCA39@DU2PR08MB7270.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2733;OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 a2L3B3NoUyPIAXD60atMSft9WU5+v+edLoIQ+38DCCt9WVI7gL/BKlV97XFo3hexjuh6d0O40UfjKzewL3Ns28YHes3yzeU4n+tDU5EKnKLGEDtEz1UyacpIpaJQRLxpYF4Er2rOL26tdVb+nCJdLJ7Tg+yussjydVYlzYYBoJ7MvIPtXI9JT0LKWQfNf5De/Of4PZaN8UHjOPyK0N/VJdP5fHA+XqrITw0VF7aQuGJ+vwIMzKDdR4eQPcnjmHcEf3DInrz5VxVlrCHYhju2hREUtP7jBEFdQXSHyAby5nPHg/icjKsUestf2v6mBUwZB/qQKf7KAjc/DnWDIbfeVO8qaQXQHY4mbwIKkan3O8btNe7xUC/IilQwt3i42pcORvZ2TUjzp+z4PCxA+EjOZGjB7CshDNQxm/8cpom7WNdkWX1HJMPX/0GnsUnK0OgbaKtsP15C6/eoljBhAlaGp32z3SHCYJgReV1uU8OalbOtEnr3whq/S5EjyhNuLlvZXPmeIxJGljWDTknn3E8gRp0D5kU6EMUavfNjp49jZ1XVRr/lnTY4PAIDOO8p8WPyinby2KM24aBhLmZJQXECuA0sI/pHdGfgOhg5kUc4VnSUbjSIRqzI/9ge9wzKI7ud3GmEWt4KqFYiJ3WVF2JPy0GDgSKWgWZ3xbtA7SLtqEFSjR888vSxmnUW9UKbtAwR6p25Fg4xRTd/Qfwfx/tgv7E51faR1ygwadhheYLPXuYFjRBX1e9liswedQP/r+cS
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(2616005)(508600001)(86362001)(186003)(71200400001)(38100700002)(122000001)(38070700005)(33656002)(26005)(83380400001)(66476007)(66946007)(6512007)(8676002)(4326008)(66556008)(66446008)(6916009)(76116006)(6486002)(316002)(91956017)(5660300002)(54906003)(2906002)(53546011)(8936002)(6506007)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <410ACCC7E89BC94EA4817D171A56BBB3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2499
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	749a7ea9-cce1-41d0-c234-08d97e84585c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XX8Q+SeOH6WNHAxLd4LwYfF/c600+448YYVN0DFWHg2IZwDoX0P5JnpStxoapXp+XxmDN/MRXlSxEZmNMSnC5c2OCFBosGil+QChA5lUgGhVybdrOXqIOxc5ODZs2r78dqTWRIwEPAbjFtOnKul3jiK7PS7Uaenl1ZyL44DQMu5GL62dINrMJvO6socatZiDq18t+IniyoMbsa8AJaqx5QiGz7AImPXMgJ/eSD/xP4tWUeOAIP1Ds379J+GtVKHZ4hW7EJoihhwSLpsKv3GVX3BvVN8apU5n+uiloy907KkRmvYWv5XWEaWM2Fto4ehsSDalFqxYTkuffw+Mk50J9TxS3XhC+/qr0R0IgEYYx+ZixiimmGP7Sz5usH75OSNUnCACbfYkBBed1cYUNAhhxQYqE5joeebahCYVadSZkg3fzZCHnUrF69g1KRAfDfoSgA4zVF/pRG0+qrZqErxZdXG34iMcZRyz9e7GBfu0l/DvzGmszr9ykU8FF0kVGm6bSNRI69/L0f9bTSEtM2yiOVZBQfbxYzO/51RyC0KkliWxvCmapr5J8HHmanS4xAM9fDq+J/jxG1TDVrmlhEGS6H56i9il89VRnmKnZjRQ7yWAapq2HAZkOg+rvrqDCGDZ2tEVJbKkf7pdEDdcZOeMo6VJOW2y9LH/NmOuyl7HZbVqeGj2GA2pElb9Zv459A5jYDiW+px8PTueTrL/Oodrkg==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2906002)(356005)(82310400003)(2616005)(83380400001)(54906003)(47076005)(33656002)(36860700001)(53546011)(186003)(8936002)(70586007)(70206006)(6862004)(26005)(81166007)(508600001)(4326008)(86362001)(316002)(6506007)(5660300002)(6512007)(8676002)(36756003)(336012)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 11:22:07.7355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22645990-f420-4796-c788-08d97e846101
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7270

Hi Stefano,

> On 23 Sep 2021, at 12:06 am, Stefano Stabellini <sstabellini@kernel.org> =
wrote:
>=20
> On Wed, 22 Sep 2021, Rahul Singh wrote:
>> Based on tag Linux v5.14.2 commit bbdd3de144fc142f2f4b9834c9241cc4e7f3d3=
fc
>=20
> I'd prefer the upstream commit id if possible, not one based on the
> stable trees (the commit id doesn't resolve at all on Linus's tree).
> Aside from that, the patch is fine.
>=20

Ok. I will change the stable commit id to  upstream commit id.

Regards,
Rahul
>=20
>> Import the Linux helper of_property_read_variable_u32_array. This
>> function find and read an array of 32 bit integers from a property,
>> with bounds on the minimum and maximum array size.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Change in v2: Patch introduced in v2
>> ---
>> xen/common/device_tree.c      | 61 +++++++++++++++++++++++++++++++++++
>> xen/include/xen/device_tree.h | 26 +++++++++++++++
>> 2 files changed, 87 insertions(+)
>>=20
>> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
>> index 03d25a81ce..53160d61f8 100644
>> --- a/xen/common/device_tree.c
>> +++ b/xen/common/device_tree.c
>> @@ -208,6 +208,67 @@ int dt_property_read_string(const struct dt_device_=
node *np,
>>     return 0;
>> }
>>=20
>> +/**
>> + * dt_find_property_value_of_size
>> + *
>> + * @np:     device node from which the property value is to be read.
>> + * @propname:   name of the property to be searched.
>> + * @min:    minimum allowed length of property value
>> + * @max:    maximum allowed length of property value (0 means unlimited=
)
>> + * @len:    if !=3DNULL, actual length is written to here
>> + *
>> + * Search for a property in a device node and valid the requested size.
>> + *
>> + * Return: The property value on success, -EINVAL if the property does =
not
>> + * exist, -ENODATA if property does not have a value, and -EOVERFLOW if=
 the
>> + * property data is too small or too large.
>> + */
>> +static void *dt_find_property_value_of_size(const struct dt_device_node=
 *np,
>> +                                            const char *propname, u32 m=
in,
>> +                                            u32 max, size_t *len)
>> +{
>> +    const struct dt_property *prop =3D dt_find_property(np, propname, N=
ULL);
>> +
>> +    if ( !prop )
>> +        return ERR_PTR(-EINVAL);
>> +    if ( !prop->value )
>> +        return ERR_PTR(-ENODATA);
>> +    if ( prop->length < min )
>> +        return ERR_PTR(-EOVERFLOW);
>> +    if ( max && prop->length > max )
>> +        return ERR_PTR(-EOVERFLOW);
>> +
>> +    if ( len )
>> +        *len =3D prop->length;
>> +
>> +    return prop->value;
>> +}
>> +
>> +int dt_property_read_variable_u32_array(const struct dt_device_node *np=
,
>> +                                        const char *propname, u32 *out_=
values,
>> +                                        size_t sz_min, size_t sz_max)
>> +{
>> +    size_t sz, count;
>> +    const __be32 *val =3D dt_find_property_value_of_size(np, propname,
>> +                        (sz_min * sizeof(*out_values)),
>> +                        (sz_max * sizeof(*out_values)),
>> +                        &sz);
>> +
>> +    if ( IS_ERR(val) )
>> +        return PTR_ERR(val);
>> +
>> +    if ( !sz_max )
>> +        sz =3D sz_min;
>> +    else
>> +        sz /=3D sizeof(*out_values);
>> +
>> +    count =3D sz;
>> +    while ( count-- )
>> +        *out_values++ =3D be32_to_cpup(val++);
>> +
>> +    return sz;
>> +}
>> +
>> int dt_property_match_string(const struct dt_device_node *np,
>>                              const char *propname, const char *string)
>> {
>> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree=
.h
>> index b02696be94..1693fb8e8c 100644
>> --- a/xen/include/xen/device_tree.h
>> +++ b/xen/include/xen/device_tree.h
>> @@ -366,6 +366,32 @@ bool_t dt_property_read_u32(const struct dt_device_=
node *np,
>> bool_t dt_property_read_u64(const struct dt_device_node *np,
>>                             const char *name, u64 *out_value);
>>=20
>> +
>> +/**
>> + * dt_property_read_variable_u32_array - Find and read an array of 32 b=
it
>> + * integers from a property, with bounds on the minimum and maximum arr=
ay size.
>> + *
>> + * @np:     device node from which the property value is to be read.
>> + * @propname:   name of the property to be searched.
>> + * @out_values: pointer to return found values.
>> + * @sz_min: minimum number of array elements to read
>> + * @sz_max: maximum number of array elements to read, if zero there is =
no
>> + *      upper limit on the number of elements in the dts entry but only
>> + *      sz_min will be read.
>> + *
>> + * Search for a property in a device node and read 32-bit value(s) from
>> + * it.
>> + *
>> + * Return: The number of elements read on success, -EINVAL if the prope=
rty
>> + * does not exist, -ENODATA if property does not have a value, and -EOV=
ERFLOW
>> + * if the property data is smaller than sz_min or longer than sz_max.
>> + *
>> + * The out_values is modified only if a valid u32 value can be decoded.
>> + */
>> +int dt_property_read_variable_u32_array(const struct dt_device_node *np=
,
>> +                                        const char *propname, u32 *out_=
values,
>> +                                        size_t sz_min, size_t sz_max);
>> +
>> /**
>>  * dt_property_read_bool - Check if a property exists
>>  * @np: node to get the value
>> --=20
>> 2.17.1
>>=20


