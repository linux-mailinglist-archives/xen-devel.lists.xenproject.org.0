Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3CE2D7656
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 14:14:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50574.89272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kniF2-0000tK-S9; Fri, 11 Dec 2020 13:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50574.89272; Fri, 11 Dec 2020 13:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kniF2-0000sv-Oj; Fri, 11 Dec 2020 13:13:48 +0000
Received: by outflank-mailman (input) for mailman id 50574;
 Fri, 11 Dec 2020 13:13:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Df1x=FP=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kniF1-0000sq-8U
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 13:13:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.84]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d2d8a22-51ea-4fd3-beb6-b3b513ae50a0;
 Fri, 11 Dec 2020 13:13:45 +0000 (UTC)
Received: from DB6PR0802CA0029.eurprd08.prod.outlook.com (2603:10a6:4:a3::15)
 by HE1PR0801MB1642.eurprd08.prod.outlook.com (2603:10a6:3:86::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Fri, 11 Dec
 2020 13:13:44 +0000
Received: from DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::f8) by DB6PR0802CA0029.outlook.office365.com
 (2603:10a6:4:a3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Fri, 11 Dec 2020 13:13:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT039.mail.protection.outlook.com (10.152.21.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 13:13:44 +0000
Received: ("Tessian outbound eeda57fffe7b:v71");
 Fri, 11 Dec 2020 13:13:44 +0000
Received: from 054d58e0a843.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 767BE7D0-F9D8-4FC5-A055-1A9E61E4A57B.1; 
 Fri, 11 Dec 2020 13:13:38 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 054d58e0a843.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Dec 2020 13:13:38 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR08MB2693.eurprd08.prod.outlook.com (2603:10a6:6:1c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Fri, 11 Dec
 2020 13:13:37 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3654.018; Fri, 11 Dec 2020
 13:13:37 +0000
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
X-Inumbo-ID: 1d2d8a22-51ea-4fd3-beb6-b3b513ae50a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8bRTrq8AuDd9McH6n7Uzv/fwPtioBVwO1NcmUkYkFk=;
 b=LJbKvV5hxoCuES5+wPU5HdmBOvl6QvoeO/9SYynROlDAqE5AcEkggZrHiAjB5BgMMDNXqSlhmN4c+FTNJp+Wk+rfBPhukquRV4p9mvDwbDcaOejIdFUia7SrXJokvlGc7q7Htq2RXcHceBMpZ5KS+Is6ybH0oV1Y8FP0sSGhdxI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f582eef5c0fd22b1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/nabH7RjnskT27z5U/0mjFJ85ROMa3Xi9wZrcOwEJsclByOJnDseCnt9KrxNyCwOtpPtwsamZ5kffN2NNY3I2bcIc7Kup8yYqnO8SEn8cYXV7b6WxI/XTsOHGdagWJXwaG/H2FU7e9F0iuSvpRaPLagB2qJXBbKg6F3Q9FUJlcN1B4hKow7dX2a6oD2j3vLv+EAlGT6d6/VeeBXyIWAbqrQcnyymqPXqHA/0pS0ebhAtv8ElXAoVAeo5cE1u6268UGgr1MFUND+5GlyDatdTbzL2DKiIrGnjI85GdTnVHCIUWgezu6PLbDx10nawvww56hXF/La67A3oUvIIsLXow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8bRTrq8AuDd9McH6n7Uzv/fwPtioBVwO1NcmUkYkFk=;
 b=IJCp7UhDeebNBTxdrji37lnuXVhy6n/T8AJ25uiV1HdezXEpsujwjWFuExFBX8tFB3fl4acA3bBANuvifg8I+7nUmfzzwUeW+leL8xblQtAik+Q+vTfkd6hmVxks1QDkJQBXUbclQvzpMhByclRMONVAQjSIINNyJARw1Ney6Ac5mDeTbtIBF438JP3ce9W2Sa6xtG/qK/RJf0AxtohF3jk6MBocG1YqV2WrlZexHl96dsL/ztchpcEQBVUidAQ2SuuQIOqN7Bw/RM9J18e7d8d5XchN2gwnht3MysodNtisl5a1C+oesvyYZxNmdiuPwKnc0AURRjMYgQ4cXDiH/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8bRTrq8AuDd9McH6n7Uzv/fwPtioBVwO1NcmUkYkFk=;
 b=LJbKvV5hxoCuES5+wPU5HdmBOvl6QvoeO/9SYynROlDAqE5AcEkggZrHiAjB5BgMMDNXqSlhmN4c+FTNJp+Wk+rfBPhukquRV4p9mvDwbDcaOejIdFUia7SrXJokvlGc7q7Htq2RXcHceBMpZ5KS+Is6ybH0oV1Y8FP0sSGhdxI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 5/8] xen/device-tree: Add dt_property_match_string
 helper
Thread-Topic: [PATCH v3 5/8] xen/device-tree: Add dt_property_match_string
 helper
Thread-Index: AQHWzxXuqdpi5XA8kUmigr++gHdisqnx4LEA
Date: Fri, 11 Dec 2020 13:13:37 +0000
Message-ID: <04BD75B6-D4C7-425C-93CF-0C1572260F47@arm.com>
References: <cover.1607617848.git.rahul.singh@arm.com>
 <2cf4c10d0ce81290af96e29ee364df87c06ef849.1607617848.git.rahul.singh@arm.com>
In-Reply-To:
 <2cf4c10d0ce81290af96e29ee364df87c06ef849.1607617848.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 66b45cb5-4694-4b70-6860-08d89dd6962b
x-ms-traffictypediagnostic: DB6PR08MB2693:|HE1PR0801MB1642:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB1642AC1993DFB2610A33BEB29DCA0@HE1PR0801MB1642.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uIBtH3UA+3umMp3/Xn0vPktNOv2xXalhyk4O1IYiEfUlAguFdXCH5OP7XK6qobxxB67eLqImxe7khU61yV72+iurR/J6RuGVswFvLpSxGELQLr0LfvVrvZaJ0oPSgHXMcdmhAVKvSelxDRfAPF+VL+Yqp0BxZyepYL5Zssh+WYouVBD6iHogkeSXrP7JbW6mQKA2UYaLN7KZDr39J0NBC1ZL+ZoRIvLzQtMryxdjXhrCepPFgivwTA63dkL/tr9gWtYBKI1ftuJFSYewh2g8PJg3QL8AtxTn7CIINeUaU6ixgDGdLEez8WFayKaB440LPbEWHd7bbjDn0vmcItGKALrKfGCfRPABthkOT0SKZ+Gu9uMTbMC7Bzv/oiExCjJt
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(33656002)(66556008)(316002)(66476007)(64756008)(76116006)(91956017)(66946007)(5660300002)(71200400001)(26005)(6506007)(186003)(53546011)(2616005)(86362001)(66446008)(37006003)(54906003)(6486002)(6512007)(8676002)(4326008)(6862004)(2906002)(36756003)(478600001)(6636002)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?LhvYvyILzd+H5G2+RTWPs3tU+ij76PInMFjDhcCF6HGyebmUZA5p03meVA5d?=
 =?us-ascii?Q?NX7lk328aBAQoQ1Glyn9LtxMqMDxKqDhEqO2vHkALP0FsR09B4yfNuIVg2S4?=
 =?us-ascii?Q?TiwtAQR2TAuYyPIo8SMz7JaYy2JHCYwitDNxed/fMxbE7/8qpy1JsJzj4gD2?=
 =?us-ascii?Q?s4X3dFhzMP/QC2yQvmLpSiWm12Ygtg4YJrAKI5IWkDE1iVZ6LRdRw17tg460?=
 =?us-ascii?Q?Kl9IfX6+XoithnKI1Ds5WdpnwnbfZL4Nu+vea96oiOCxUo3fWlbV+cz4ac1A?=
 =?us-ascii?Q?Bh6NieeXIFi6qbkESKaFS7E6V+dKNenXL99N9OgKUJo5Ew/H3ReEHCjiXJDK?=
 =?us-ascii?Q?HAwGQ3vNY47kCJnJtgCQ2wQGzOll67XFrXWbFG6Y2UGFeCndYiEE9ZtBnMBe?=
 =?us-ascii?Q?kTrv7nKBJbdINcpIOQkklq0bX6JbW2gYIyTrhHCm4JuyFplK/LT2pFahNr5E?=
 =?us-ascii?Q?EBK05JGmEP6Ixh+JWAwGhHmwuH4nbDLNydGXMqqTRBNKfnxN4AsS+z3/qbSs?=
 =?us-ascii?Q?0LGpht5WgBnkX4JuSlf6T5SBFHJeO5FHpiEjDKvzfVQRT66K1cPiiIZoRBQt?=
 =?us-ascii?Q?f6Av1qK+85na4U200QmcN9N5X9WP3K9m6Uhp4B11N8bQY1AWqAfUH24h37qv?=
 =?us-ascii?Q?x7IQ0zEHQOYVfbATxO96Cv/XbijbVQvjx4OQnV4IRZIwLImLqtAbUv19nju5?=
 =?us-ascii?Q?DQBqenBnIivNXsBMS96HzDHBtkm0u3MjOJ7og1O0+2KsRnq7F4DMddMZ2VIY?=
 =?us-ascii?Q?HszqeapWRQx00SAnystIxF9UubEKe+bLbmM8AtYSpwt363VlWtyvioJNe2mm?=
 =?us-ascii?Q?/YM9a5v48n8kFdgik0wyw0o04C1P3TD9NUDUSlSuPOi/iJm6/ntiFrmo0MEq?=
 =?us-ascii?Q?Bq2snQTmN8rnUjO9hFtK5lBfRisR4Jw8eUEFqjEXy0V6zZd3d1PMVCzu4/io?=
 =?us-ascii?Q?jG9z3aozTBmN+6zehvSMeQt8OIcwK7Y18FJdLTnQDGCmoILqcuBQhzWvRvaX?=
 =?us-ascii?Q?yus5?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FD1C6A93FECA2342A5E25928D6561FCA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2693
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bd429ec4-b7ae-47b6-f7f0-08d89dd6920b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o2g/I09F5HFeFDN8GMIhq2YwJd9fDDzx/12uu3Y/pIoJHAnwSuJt8ptkzt0yftCF6nZJOCJdq7ZWlHsDZe9zWC4DfF8Af/pOKNuD98k7plR2IZAHbYfohjv0BSM96Wk7QlUJsFris9fBsuXC8Qljh9yhMKRTD/OuuOyZlaZ4jEuEFS+icDTvsI7gD5KOFOl089aszkFQhdi2YF7l7S9sGVm7SyFd2v/BeltpQjt7XPemfwM8x4Tzu/KcKJLGC2etDF50MFkjIQ6hxU8mh+Ld4xHTN0hNPxKmaEk3ByOWWVeC3azctTKCD6nWitneCwaN1o6pvasug9kfvzwGH2/inBtgaEWzm0JFKsl7I6t93I/8XOu9btkvK4OXWmkmXyJaoXt0rQ/QGT5y0rgur5X25Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(46966005)(81166007)(186003)(356005)(478600001)(316002)(37006003)(47076004)(86362001)(54906003)(8676002)(82740400003)(70206006)(2616005)(6636002)(70586007)(8936002)(33656002)(6486002)(4326008)(6512007)(82310400003)(6862004)(26005)(2906002)(336012)(36756003)(6506007)(5660300002)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 13:13:44.0849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b45cb5-4694-4b70-6860-08d89dd6962b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1642

Hi,

> On 10 Dec 2020, at 16:57, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> Import the Linux helper of_property_match_string. This function searches
> a string list property and returns the index of a specific string value.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks
Bertrand

> ---
> Changes in v3:
> - This patch is introduce in this verison.
>=20
> ---
> xen/common/device_tree.c      | 27 +++++++++++++++++++++++++++
> xen/include/xen/device_tree.h | 12 ++++++++++++
> 2 files changed, 39 insertions(+)
>=20
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index e107c6f89f..18825e333e 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -208,6 +208,33 @@ int dt_property_read_string(const struct dt_device_n=
ode *np,
>     return 0;
> }
>=20
> +int dt_property_match_string(const struct dt_device_node *np,
> +                             const char *propname, const char *string)
> +{
> +    const struct dt_property *dtprop =3D dt_find_property(np, propname, =
NULL);
> +    size_t l;
> +    int i;
> +    const char *p, *end;
> +
> +    if ( !dtprop )
> +        return -EINVAL;
> +    if ( !dtprop->value )
> +        return -ENODATA;
> +
> +    p =3D dtprop->value;
> +    end =3D p + dtprop->length;
> +
> +    for ( i =3D 0; p < end; i++, p +=3D l )
> +    {
> +        l =3D strnlen(p, end - p) + 1;
> +        if ( p + l > end )
> +            return -EILSEQ;
> +        if ( strcmp(string, p) =3D=3D 0 )
> +            return i; /* Found it; return index */
> +    }
> +    return -ENODATA;
> +}
> +
> bool_t dt_device_is_compatible(const struct dt_device_node *device,
>                                const char *compat)
> {
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.=
h
> index f2ad22b79c..b02696be94 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -400,6 +400,18 @@ static inline bool_t dt_property_read_bool(const str=
uct dt_device_node *np,
> int dt_property_read_string(const struct dt_device_node *np,
>                             const char *propname, const char **out_string=
);
>=20
> +/**
> + * dt_property_match_string() - Find string in a list and return index
> + * @np: pointer to node containing string list property
> + * @propname: string list property name
> + * @string: pointer to string to search for in string list
> + *
> + * This function searches a string list property and returns the index
> + * of a specific string value.
> + */
> +int dt_property_match_string(const struct dt_device_node *np,
> +                             const char *propname, const char *string);
> +
> /**
>  * Checks if the given "compat" string matches one of the strings in
>  * the device's "compatible" property
> --=20
> 2.17.1
>=20


