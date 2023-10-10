Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C35A7BF76B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 11:33:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614640.955848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq96s-0004pd-36; Tue, 10 Oct 2023 09:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614640.955848; Tue, 10 Oct 2023 09:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq96r-0004nT-WE; Tue, 10 Oct 2023 09:33:02 +0000
Received: by outflank-mailman (input) for mailman id 614640;
 Tue, 10 Oct 2023 09:33:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sc7t=FY=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qq96q-0004nK-TO
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 09:33:01 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe16::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0018cbba-6750-11ee-98d3-6d05b1d4d9a1;
 Tue, 10 Oct 2023 11:32:59 +0200 (CEST)
Received: from DU2PR04CA0278.eurprd04.prod.outlook.com (2603:10a6:10:28c::13)
 by PAVPR08MB9016.eurprd08.prod.outlook.com (2603:10a6:102:325::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Tue, 10 Oct
 2023 09:32:56 +0000
Received: from DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::74) by DU2PR04CA0278.outlook.office365.com
 (2603:10a6:10:28c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38 via Frontend
 Transport; Tue, 10 Oct 2023 09:32:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT030.mail.protection.outlook.com (100.127.142.197) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.23 via Frontend Transport; Tue, 10 Oct 2023 09:32:56 +0000
Received: ("Tessian outbound fb5c0777b309:v211");
 Tue, 10 Oct 2023 09:32:55 +0000
Received: from ac952a9434a5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7B219985-12EF-47E5-99B8-36867AE9A5C4.1; 
 Tue, 10 Oct 2023 09:32:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ac952a9434a5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Oct 2023 09:32:49 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB6096.eurprd08.prod.outlook.com (2603:10a6:102:eb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 09:32:47 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 09:32:47 +0000
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
X-Inumbo-ID: 0018cbba-6750-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9FqmO8JDEMz5l7i+lD1yhEBBOjVFEtJ0dJkgajDxak=;
 b=Dn7Z/Mc1kXd+xN6D3xkqn8N9KKIxXDTkaPbADiegNci3l0hRGwjIMqF/scfcPHfFy/+ndUBMrnklN5zatVnghWXcy1VdXV8CuO2PvTTgqHmJCxaWU8PVDVpCk6ezb8eoN4RaMHxUv6or2ZPxOavt7zAI8ypQmbR5G8x6wQ7NPoA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a309f32c249cfb48
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTIxqvubhBbH2m5OqvoODrYZOkb1ujaYNJK1RdVUBTzPKZ7gQe+4T6A9V2irp5ELDDxIessCo0Dc1XAkaiRlWlznB8D+flVdTwg7l/H+l1sWyKZsg15SAq+HvibXLOBDLd9Q0o44HPA8mNtzgrr/fLhGdgFXKT48JQQs+EAnwejhoGkEsMyfKmcKx3+D/fEruCWj55eQTysftyZE9SYE5bjoz+EGb73SrEf3txn2EuxYIF3vxYEom/DQvSqpMzUu4I3Rd5TX4wFSv2JLnT/3Jt66GvdxBG5XaDIrVUPxvqAZxbCIyW7zAyJmeXZUOeTL+6yhodvqcAXGpq/ppe4cTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9FqmO8JDEMz5l7i+lD1yhEBBOjVFEtJ0dJkgajDxak=;
 b=iLLqO6I2NUU0tQHC7WGaTw8ddNfVJeP9xehBiVQozi8Gf+0RvWHJ7J4DtwyOVzWMgmW/Obk3QmoWhqYYHW4VWyEUONw5ByCNcuwae8lU1kay9QFIO+fqQ1/scZxUsohCgn6v0FcwdiXg44oSkWUJbOG+kRaxOKUjlP8b54V9pZS9kUDXWJL1Na8WJG9MohsF3gcPSMipZDggsVYu0k57MS3qF7xLifaXA8ZOeREUYHh3wLtckF/r3SKokNkTJLpQhdkth0Cr+mvYfr1Od/0qgL2U/u7DJQsr3MRtyf7s49z0trAv10VW7DDPno22J2KaY09/8rGpcoWBnJ5+9XiFtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9FqmO8JDEMz5l7i+lD1yhEBBOjVFEtJ0dJkgajDxak=;
 b=Dn7Z/Mc1kXd+xN6D3xkqn8N9KKIxXDTkaPbADiegNci3l0hRGwjIMqF/scfcPHfFy/+ndUBMrnklN5zatVnghWXcy1VdXV8CuO2PvTTgqHmJCxaWU8PVDVpCk6ezb8eoN4RaMHxUv6or2ZPxOavt7zAI8ypQmbR5G8x6wQ7NPoA=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v8 0/4] Prevent attempting updates known to fail
Thread-Topic: [PATCH v8 0/4] Prevent attempting updates known to fail
Thread-Index: AQHZ21ouU/78f5pdKkage6VapGXyvrBC/wSAgAADrwA=
Date: Tue, 10 Oct 2023 09:32:47 +0000
Message-ID: <EEF64BC9-90D6-4130-B18B-DC2AA8926745@arm.com>
References: <20230830155326.10199-1-alejandro.vallejo@cloud.com>
 <dabb48f2-5a7b-46f6-bc0c-deaa1c6ef861@citrix.com>
In-Reply-To: <dabb48f2-5a7b-46f6-bc0c-deaa1c6ef861@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA4PR08MB6096:EE_|DBAEUR03FT030:EE_|PAVPR08MB9016:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d61d34-5753-404e-9dfa-08dbc973e275
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8LfUKxAEtQ+8fQMywLMgp3BFwMiVZRuCoDL2Crh8sdiYQZ6/J08KHxsZ8BzaLaro2Z1Rl3pZH1hFtw7xUzkQe52zyfI9vCyXKlfYAvY1n49AhpDEi/NPuoYGP/jWIQqiE+jARRq4l868+GXMJdmimdCd1e6l1yTfvBnkF0g8wzn/xRea4tb7zsn0Q9wQs9x8SnJKYpArIJkRpfXvYEx4W8U4d7BJ9XsZTRLSkTLddRr5bSioerj+k9yHpj7zz6fdoqgqWYW57IL+PsKY0OtOp7L4BKrOS9b4v97n+ZiTFxiqlXUc3D42OvLmh6XAnDvFM0XGVhzqQb8G7OlU8ebv6LOrh0waKAiqGOX8OM3YjNZ7L5vqQPka/sj64jGnrX0eJXOZEU+9BePV54B1t0DEXWgQ4klRSmx9duTcYIBTmOn454BuBhl9Y8sM9hARWjcz/F75sNc4YKG3XMK8tdJP1G2mxS8kQEZUhJztHfTzRHzzFOvWkmoMO5XrIPKFiMf380ya46Awf0aFQ2nUuMpXKhRwbA0oPM9784fWzYZEuau83GD6kba8PV6o+g5AdE/h+cGALWKNORg3D+VOVS7u016xYRvf1i1TK5nqPouRijzBrLEW1jTS3Q2EgoGT/cUOf2WxFBZ5llAGMbzYndJ44Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(396003)(136003)(346002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(86362001)(4744005)(2906002)(38070700005)(122000001)(38100700002)(66446008)(33656002)(66476007)(6512007)(316002)(66556008)(66946007)(76116006)(6916009)(54906003)(64756008)(91956017)(6506007)(53546011)(26005)(2616005)(478600001)(6486002)(71200400001)(36756003)(41300700001)(8936002)(5660300002)(8676002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <25C0E795379B9942AAEA46D4650587EF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6096
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2d28a6a3-4480-4ab5-bca4-08dbc973dd48
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WiCrplKlnbstABO79iHR5XfzLaARMf21OrIH/PqJqhgrntURD8WZSKy5pITbFo9vyOSOAdRuh4/08C3XicTIUVLE2+8E/X14RBdSdt+suFuffbXCEA2RGMnciGoYrOdewt5zUycqhYGzWdK0L/gTrSrfKR3WbsmpP0dJh9Gzgqs8WhJaySfLzndXEP4cTIEto5Pxp+hVkEkZgmycMOxUSr5pEp+kzsYtFmso3TU8wbzZD22V2eWxm0DKwRJZVFvsMCWW4h9r8/OJGIfjsPdPSjR1J2UnH6Jm4TOqbrnPEpQUlS117P+Ajbk1X41IwiV8ZlC8NivqKbByTvB94g79g+4W60R/IMRERtNfLCPZQTijAC4iQ/p3+6gnTi+UPkwFLQAr+/XGmagkgCNG32p7WB8OfAjRhWnLyIfxV/AzU0SvmK3ZY5GTOKDd6T816zGvI4vdxv0EMjBlFgBbABGEF58OLq0qBMGJaZZd4fQW/DjnWfjm6SfJravzr2yqI5tFJA1QoLQ8CuBTIDOsJGcZa7P4W9WPRSvyGqZvf7CzI6kP2CvRWOXkUUNs3eGtI4ma50R7aLhHnFdlZ2BY/rDBDZIv4aKNqurnJQ17jmpnV6MHizZh+ucnFMxv+yuh8ud/l2Y4E/OS7uoTztWWnquxSAxVafOgl5G7K5dITQ2l0nBVB02DP12VZszMXq207xpJJJO2KCbxsYIH7NxZZ3K5LwaVH8L6GGW/QREkBwNDW5MP57mcz7wbyUb9FiuZR56+
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(396003)(376002)(230922051799003)(82310400011)(186009)(64100799003)(1800799009)(451199024)(36840700001)(46966006)(40470700004)(26005)(2616005)(336012)(53546011)(8676002)(6512007)(47076005)(36860700001)(4744005)(6862004)(2906002)(478600001)(6506007)(4326008)(54906003)(70586007)(70206006)(6486002)(5660300002)(8936002)(316002)(41300700001)(81166007)(40460700003)(356005)(86362001)(40480700001)(36756003)(82740400003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 09:32:56.0525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d61d34-5753-404e-9dfa-08dbc973e275
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9016

Hi Andrew,

> On Oct 10, 2023, at 17:19, Andrew Cooper <andrew.cooper3@citrix.com> wrot=
e:
>=20
> On 30/08/2023 11:53 pm, Alejandro Vallejo wrote:
>> Now that XENLOG_INFO is the default logging level...
>>=20
>> v8:
>>  * Fixed last bits mentioned by Jan in v7/patch1 (v8/patch2)
>>  * Rolled back to having new printk as INFO
>>  * Added v8/patch1 to ensure the existing early exit from
>>    early_cpu_init() has INFO severity as well.
>=20
> This was posted before we got into RCs.  Any view to a release ack?

I am ok with that, given the status of this series, but you do need to prov=
ide
a R-b or A-b to the first patch, with that (can be handled on commit):

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

>=20
> It seems to be in a good state, but I need to double check on affected
> systems first.

Please do and if possible make sure it will not blow up the CI :)

Kind regards,
Henry

>=20
> Thanks,
>=20
> ~Andrew


