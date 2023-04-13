Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A746E0BD6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 12:51:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520619.808398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmuXj-0001FA-MN; Thu, 13 Apr 2023 10:51:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520619.808398; Thu, 13 Apr 2023 10:51:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmuXj-0001Bk-Im; Thu, 13 Apr 2023 10:51:07 +0000
Received: by outflank-mailman (input) for mailman id 520619;
 Thu, 13 Apr 2023 10:51:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vvgu=AE=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pmuXi-0001Be-4q
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 10:51:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 156e8975-d9e9-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 12:51:03 +0200 (CEST)
Received: from AS4P190CA0036.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::7)
 by VI1PR08MB5358.eurprd08.prod.outlook.com (2603:10a6:803:13c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 10:50:55 +0000
Received: from AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5d1:cafe::c) by AS4P190CA0036.outlook.office365.com
 (2603:10a6:20b:5d1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30 via Frontend
 Transport; Thu, 13 Apr 2023 10:50:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT036.mail.protection.outlook.com (100.127.140.93) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.29 via Frontend Transport; Thu, 13 Apr 2023 10:50:54 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Thu, 13 Apr 2023 10:50:54 +0000
Received: from f5188b42cb7d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 82771DA4-E170-425C-B69C-2443DD83CFF8.1; 
 Thu, 13 Apr 2023 10:50:53 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f5188b42cb7d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 10:50:53 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB6684.eurprd08.prod.outlook.com (2603:10a6:10:26d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 10:50:46 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 10:50:45 +0000
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
X-Inumbo-ID: 156e8975-d9e9-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnanJ/Xo/U/t2aXUs2oKoot5SwX5CsZYxI13BH5G38U=;
 b=RY0/SdiOhCAgGL5bYS3RbRcOx+ETNGk6cWGsPbCWOPQzIuvYq0Hwt5CqPhop31cU32JinjiQ+/vtyx7thVctF17w+psqnk0Wzm8D88iiSHYIi9kMSpJ92kbbKgpN0CzrccjDIEN35S+DSBft0roGWeASqxZnnFL4+l8RO9NWiP4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpyXA0tFxl01egftUCULgvupUKuORwiN3XlYQSxR3tvhO4d5cBZ+6jY9epiMd2uXkgqgkn1LrFjH4SSF4n7GxXoUBBkiIpqC7KBYpXhuVwCL15gkxP+GXKIX6cQOMwQkrOSIBkfpWwQMfC9jkZlQ8QjzP2ibf3AhX4ldJqLuJc3M9lkhQJv0WWfTXaj/KiB7Jw4IaqxCVDTxkwbM3r4iHd9Qga/Aikdyq0DHI9PMqBAU+MVPY/OUeClWh2NT4BOjvZD5nwo28TlHPq8UbyrWgB+//YU1Qsyn+6Uq0B0AVJLsScSDQgg/7ua+D5RhRJk3fMN1UaJME4F7ys+ZgXRNqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnanJ/Xo/U/t2aXUs2oKoot5SwX5CsZYxI13BH5G38U=;
 b=ishhqhc4c6V/WDdk+F+/QgklHVBUQmc08CaQSoBhRyXtMJjsNGMDvo23aGCmSNA1hR5nvX+u8T0ljS/xZPTMCDk2MniArNtUe8c+CLnYH4BiMzUE46z1uxQEU1jN4hzcPzCl1uBEYhcGm8IhC92j0dchMOek3R1EPyGg05duqmgGHfgoHTHaG9DDtQWdEfxiHmGFxr5KjY06iXnlEvhypgxT5HlDi2OaTjD2RaAvHRgbFI8k/X6vF7n+ZZbucrclLaw7HDc41k6kNCXKVVnYCbGOqqtNwtq/fD9EOq3rPI5ShRza7oy7ytSw6ZFdYKMCcURLq+5h/TzSDDXOC+QbNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnanJ/Xo/U/t2aXUs2oKoot5SwX5CsZYxI13BH5G38U=;
 b=RY0/SdiOhCAgGL5bYS3RbRcOx+ETNGk6cWGsPbCWOPQzIuvYq0Hwt5CqPhop31cU32JinjiQ+/vtyx7thVctF17w+psqnk0Wzm8D88iiSHYIi9kMSpJ92kbbKgpN0CzrccjDIEN35S+DSBft0roGWeASqxZnnFL4+l8RO9NWiP4=
From: Henry Wang <Henry.Wang@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN PATCH v8 06/22] xen/arm: ffa: add defines for framework
 direct request/response messages
Thread-Topic: [XEN PATCH v8 06/22] xen/arm: ffa: add defines for framework
 direct request/response messages
Thread-Index: AQHZbdfR/bDbMlylSUmzQmA1LCqNwK8pDjBA
Date: Thu, 13 Apr 2023 10:50:45 +0000
Message-ID:
 <AS8PR08MB79916CDCB5DB7CA86E8077A592989@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-7-jens.wiklander@linaro.org>
In-Reply-To: <20230413071424.3273490-7-jens.wiklander@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4B458A3ED24A7E44A1401B89678F16FD.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB6684:EE_|AM7EUR03FT036:EE_|VI1PR08MB5358:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d253a80-8989-4ac3-7ba4-08db3c0cf4ba
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6LchsenPIN+ocvX2timcV7g7PyjsyfY/29Cum5GMgVABkeKOkWjS5PvdeF62I22HBNnPRHLXoAYwUuBwLVdW9IZXls9rc6E3e6HEMLxdYx2TWWulrlYfsg6558K8rQxvz3mavfA2JE2arfwrQJ8zof51oJebzu1ZH3BZLnUvBy1l6d78Eb12AWsRPpR+l1neAClftTOIENpX3xAM1EZUkSv+ZWRlPZCurFRrZ39WZ3BPBRRgHO2YFIROD5y2bX96PN7Xn40bW734nL4hKokOEJGN1W8DLSr3OxFrqDXrbgywodc/mD9iStA9Zy4+evwvCTRBuzwWfJnlwnDCHGSaKcwSTZtduvS/sAmtZIKrJU5DgJ0sEfwnCBhHAUxGG7sPeuzqO9H3MaRjZLp4W40IZRa5To2cQVy0wZ/LC1+KqY41n7a9CEHzXZ3w9olTXqQ/OHnIyMWA+LPqocFlsolU/70lQNSJin0pMF3rt7gCBFBrdp+SegbvvyH4oAqbuSOO2JQIo8dlfLD4eexqW+hG90oEiO5P5OTK8j+S623BBjr9AtGyfx/Y9vn1mf2vEBqNG7yLSp3u5Q+K+/vtJwMFtf7oq9uMD0uC+RKAD35BC1zD4AXSiHgX29Imc+5F0POt
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199021)(33656002)(55016003)(478600001)(54906003)(110136005)(7696005)(71200400001)(122000001)(41300700001)(8676002)(8936002)(38100700002)(66556008)(66946007)(76116006)(66476007)(316002)(64756008)(66446008)(4326008)(83380400001)(6506007)(9686003)(26005)(186003)(86362001)(52536014)(15650500001)(4744005)(2906002)(38070700005)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6684
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6ae4e6c8-d752-4162-e99e-08db3c0cef78
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XNZFXGgvdJqJonSRI9w1IQf47RO1OWYcV4KM7TTPj4CIY8k4YxLXNqcWmdcF9rx1Vsvc6f4JBLsHwBG5ZQsTOcenirCPQbuiHEtTkzwalVM471NsRssRGwuQyCLz9D2Pbt95/Q/bTDIp7TOJo3TlC6XtIPYdT7AnhpMSgTiw73xCM9DydPsgl9GLXuMTLAgLuwoWNo/W9seaT7MHV/VO0Dpuj7s4UfN5CyMsVDzQPm3C35getl2uhXR6Melh1kpNkjJFscW16c99rjPHg+F4wdC2+F4PE8ss+5261SUNBjCI/vP7K+O2zBRf9m2qTadqpncW9MVYfGeFIREgISuw594s9SPjTNTmB05ChEuF/2FpKcKI1oBjmAh+7X8kJrYP7VOu9B9dzs94oiQSjNgfkODvnnRbmuZpLBOK3z4Smw1mMvSsUhz+nyMT+HzJ1rss4g0n2PmlNzpCBFwJHc37+dfJaOiaSbtATGrDv0Jz01SoBRi9wNO97BTqht0KWudMPPGWiYzA+fgTyqYGAmtFh4VCrkZQKadpuQwOpMg9MrBCNcBhzTD9cSUjKNY53ZXuTbVAQzH8S/J+ZtvXdRi3dCWeSnZP6954PoZmw7IwvalZUZnqQHx/vD+vn0pYyh5TC695kgHFhLyE1hmQ8hENzE6jAi+Tifa6nGBQHSJlRDzvrXOX6hYF3rw0q3NMEEn7QpbMW1mqkduwZJVJu77P+w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39850400004)(451199021)(36840700001)(46966006)(40470700004)(2906002)(4744005)(8676002)(70586007)(70206006)(8936002)(5660300002)(52536014)(15650500001)(478600001)(41300700001)(33656002)(40460700003)(316002)(40480700001)(83380400001)(82740400003)(336012)(55016003)(54906003)(110136005)(4326008)(7696005)(186003)(86362001)(6506007)(26005)(9686003)(81166007)(36860700001)(82310400005)(356005)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 10:50:54.5568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d253a80-8989-4ac3-7ba4-08db3c0cf4ba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5358

Hi Jens,

> -----Original Message-----
> Subject: [XEN PATCH v8 06/22] xen/arm: ffa: add defines for framework dir=
ect
> request/response messages
>=20
> Adds defines for framework direct request/response messages.

Same here, it actually took me a while to find the related chapters
about this patch, so I would suggest that we can add more details
about where the values are from.

From the spec that I referred to (DEN0077A version 1.1 REL0), they are
in section 18.3, Table 18.{21, 25, 26, 27,28}.

>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

I confirm the values introduced by this patch are consistent with the
above spec, hence:

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

