Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 570857CECC9
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 02:30:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618839.963023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtGvP-00015u-Nn; Thu, 19 Oct 2023 00:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618839.963023; Thu, 19 Oct 2023 00:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtGvP-00013m-Kl; Thu, 19 Oct 2023 00:30:07 +0000
Received: by outflank-mailman (input) for mailman id 618839;
 Thu, 19 Oct 2023 00:30:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AWKy=GB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qtGvN-0000yj-Mo
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 00:30:05 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe16::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a542a929-6e16-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 02:30:04 +0200 (CEST)
Received: from DUZPR01CA0142.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::22) by DB4PR08MB8104.eurprd08.prod.outlook.com
 (2603:10a6:10:384::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Thu, 19 Oct
 2023 00:30:00 +0000
Received: from DB1PEPF00039232.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::34) by DUZPR01CA0142.outlook.office365.com
 (2603:10a6:10:4bd::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24 via Frontend
 Transport; Thu, 19 Oct 2023 00:30:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039232.mail.protection.outlook.com (10.167.8.105) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Thu, 19 Oct 2023 00:29:59 +0000
Received: ("Tessian outbound 9e011a9ddd13:v215");
 Thu, 19 Oct 2023 00:29:59 +0000
Received: from 30d863eedbea.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E402F1F1-28C1-4010-BC1D-A18FC982573A.1; 
 Thu, 19 Oct 2023 00:29:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 30d863eedbea.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Oct 2023 00:29:53 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB9709.eurprd08.prod.outlook.com (2603:10a6:102:2e6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.22; Thu, 19 Oct
 2023 00:29:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 00:29:50 +0000
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
X-Inumbo-ID: a542a929-6e16-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0bf0QTvTtO6awHU7/y5a8Ctj8jO9o+LX9Dh4nPoEXY=;
 b=N+EIclXd9mvzwZtbN1SdOAni+sZ3DvQM5JKdHgKbYTnL0W152/grAtrXVQ8ROiTSYppzlSFBsk4gk7ST4ROqlzh4i3xhYDqM7RlG72SM6Q7wV/uZ40wqfwux8v29ee2tOEcY7BcfAv2d23mlh80az+tsS2UODga1NS+PxapI+HY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fcc4d0545151bcfa
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCxFfYOZgcZ7yppukoUGezJaZCCj2ZCeTQn0zzsrUfxNw/rhuGek8cUBoGP9SKNmU58Emr7SmDztfDIfylO+xYejfDvG7WEwB+JpR1yX5fdM3lJkqFLJz7fxyqB4847PCOkNsD0yWPAPiICR7ON5vQ3Jf8QPkwEqAX+6SaaVEroFiyNvITUT+X1X7W0g4kqkL9Y4QNWNqMSoqp71Jkhs0aIYjRDhjoqhyk4TNAgy1fIkG6BXOmsNiqjx20QdBCIjIVE383KK5p/Fzj72NbpGwI6bmlShgEFoPnvzyJAekV/OKW04R4UU/hTNUfnrGtsaQFaVG5hl8lMkJIk9IcStlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0bf0QTvTtO6awHU7/y5a8Ctj8jO9o+LX9Dh4nPoEXY=;
 b=ns0PvaPeAmHuLlHJ3iZ/nl6fG7CMmvaDSjuJyKh3i7oqaP+IxiERLcy4JJWgwUJewD8PIzmOLi0LtpVr4QiAphDD+zKErAb8m1jA8i2nIhmdKUGnC+Yhoq7rUHf1wSFRcuQm9BvCbj8zYSUYm9HVzRPpGD0/0o2992yAPcJZGTXHAIC4iLYxTTovnvWHO+fnrWJ1+nZka/M393eZPA40rU7WSQ+EVGnKOPmr+uzHuQTSOAa2rtrAT+Ql+Wv839Y7/jSrHT5w8/5YiGyXbBBk+b7gbURSKh8JOTP6KgQh+s9iSRA13MRTkbJ6IFUmo2RbIAkTxuej50RrWYDl5GbqBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0bf0QTvTtO6awHU7/y5a8Ctj8jO9o+LX9Dh4nPoEXY=;
 b=N+EIclXd9mvzwZtbN1SdOAni+sZ3DvQM5JKdHgKbYTnL0W152/grAtrXVQ8ROiTSYppzlSFBsk4gk7ST4ROqlzh4i3xhYDqM7RlG72SM6Q7wV/uZ40wqfwux8v29ee2tOEcY7BcfAv2d23mlh80az+tsS2UODga1NS+PxapI+HY=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Manuel Bouyer <bouyer@antioche.eu.org>
Subject: Re: [PATCH] console: make input work again for pv-shim
Thread-Topic: [PATCH] console: make input work again for pv-shim
Thread-Index: AQHaAdOTgwKy6u3JYkmo1XFC1IQNE7BP1l0AgABsrIA=
Date: Thu, 19 Oct 2023 00:29:50 +0000
Message-ID: <26553B5A-8DB2-42D0-81E8-1D3F5C1351EA@arm.com>
References: <ed275abf-351f-5237-7e19-a3856f6d4272@suse.com>
 <f2b51b47-fdeb-45a6-92c7-5b21da1855fe@xen.org>
In-Reply-To: <f2b51b47-fdeb-45a6-92c7-5b21da1855fe@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAWPR08MB9709:EE_|DB1PEPF00039232:EE_|DB4PR08MB8104:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f45685e-3424-4e06-d6ab-08dbd03a8738
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Adb1sx2ciaD8y6mZLTmQQ0cBS8NiiAd1vW7xpiPvSrpCsEQDW0vYAiG/dqLxVZM2CxucvshZmAs4St1U5QKZzGgSiFIobWJMNW2oGQP/zBR4ihZOcjAHhEe54DH4gGdkm7GecWCd+XrSnjsGcd7uKVOiLgKauPESq6XrnAwgzxH/nTW0/oPqDDdLXhmT47/3FIaRsUwEJE+MGdZtdcC2rbLkO0VMZTCr5+79jcQ4wX6tgxMME3ox+v7DUVNYVTiOSVfymdGCVvFCYrXjuCmfJ9zq9/lokVabH4p4/DEWXXGDMRotRwOMI3E+zz6jQhMqZNdfyJaMZx9pTwM420GnrITYd3mP0KJ49O0+tdp/+2swPFH5ePAmRi+XEJWtTWrj9qmfGAtEA0z6y1hLBE6WCFlYPUf7UDSn5aH2IZ9Vwqahp12tt5o+D0kDRc5zT0ILNNo89AaMukoqSqygIkg5OY+cE104O64Mue4skF9Gz2cBbYTM0N66azi3zrlxYTb77h5mXznOrwvoGIs393uhEaLjcHYXmN1W/c6drznUqbhDtswRjUmGxQhxKST7AXCEcnRNN0JpUVko0FGDdpT63EEQf8du5uJegTmBWq7xDDuKFa3ljtu0YCSfScI8rHr/38Off3ZvLWakZFqTS0AwyQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(39860400002)(396003)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(83380400001)(41300700001)(38100700002)(64756008)(91956017)(36756003)(38070700005)(2616005)(122000001)(6512007)(2906002)(478600001)(6486002)(66476007)(66556008)(66446008)(86362001)(4326008)(54906003)(66946007)(8936002)(6506007)(5660300002)(8676002)(53546011)(76116006)(316002)(33656002)(71200400001)(110136005)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E3353DCC3427C44A9A1E78E8C2F65245@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9709
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eff6a75d-0094-48d2-cb83-08dbd03a81b9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RcuhnprNFhx/9e76cl94LH6w68Hw46EPIx4pJGSBX93U8GIq/B9isYgUrCIz8XeCZX1fCA+ygeJGHfHm9sx3hihAEeHDG1xYPLDIi21w2R69b/BtbIC0G0Fklz6ntPjonBsSfDNfi3yqn9U9paPullW6Ga0MxfOGqomTQWuKPGxUnI0l75X4g9zTrnwP1kouzFZyMilERE1yIn3XCaSDwAzumAGsrGmvPJ8QSjk5wiroUrobws/Rw6lzscCKlvwwDLAq1yT8b3RbKLYBgIkWcDrbWpaRUe3eY4ItwlSUfKnL9wq1BnUu/sIyn+JJUVNA34nXZ1EcyC53JeFa2OkeJD6SQQtJLB63T6CXMW2dw2FmQ63Us1xss76mjmcTauYgUbOwmBhxQx/FdL62dmruhtZJ3NNMZXJDbHCvTRrYjlk3ax5ApJn/sqrvxQaR245QQlJanOamnIZtb6lo97akjJ+/sErnN88+TdJ7Zea+MFSBnSCV3J3Thp5SpJDNib9HuI1KZMwGGWfLMn7kMZMiahjN6Zb9WqLQcjN04Pz5+C6Xg85z6QMF9wwEgpWIz4y/b675eNKZvFegXcOoSM/Kh4rQ8b3ATeGkFXW1hw0O178r5DdNJH8MDudzs/Wu4Wmqx86/TAlsQiwbrwX10jg7Cxd9eRWWPDMd0Mm+o4gnUzjibPIYZjGr44Uxl5O3LY0GtPGHWsPPfw8AnxrHfieNOS/HF5yD2kRhBSw2kMpxnm8cxQ0ICRyPve71Ma3nxazz
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(346002)(136003)(376002)(396003)(230922051799003)(451199024)(1800799009)(82310400011)(64100799003)(186009)(36840700001)(40470700004)(46966006)(40460700003)(2616005)(336012)(26005)(6506007)(6512007)(53546011)(36860700001)(83380400001)(47076005)(478600001)(5660300002)(2906002)(6486002)(8676002)(70206006)(4326008)(8936002)(70586007)(110136005)(316002)(54906003)(41300700001)(82740400003)(86362001)(356005)(81166007)(40480700001)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 00:29:59.7918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f45685e-3424-4e06-d6ab-08dbd03a8738
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8104

Hi,

> On Oct 19, 2023, at 02:00, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Jan,
>=20
> On 18/10/2023 15:58, Jan Beulich wrote:
>> From: Manuel Bouyer <bouyer@antioche.eu.org>
>> The use of rcu_lock_domain_by_id() right in switch_serial_input() makes
>> assumptions about domain IDs which don't hold when in shim mode: The
>> sole (initial) domain there has a non-zero ID. Obtain the real domain ID
>> in that case (generalized as get_initial_domain_id() returns zero when
>> not in shim mode).
>> Note that console_input_domain() isn't altered, for not being used when
>> in shim mode (or more generally on x86).
>=20
> I think it would be worth to either add a comment in console_input_domain=
() and/or #ifdef the code. In any case...
>=20
>> Fixes: c2581c58bec9 ("xen/console: skip switching serial input to non ex=
isting domains")
>> Signed-off-by: Manuel Bouyer <bouyer@antioche.eu.org>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> ...
>=20
> Reviewed-by: Julien Grall <jgrall@amazon.com>
>=20
>=20
> Also, should we consider it for xen 4.18? (I notice there is no for-4.18 =
tag).

Yes, so:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


>=20
> Cheers,
>=20
> --=20
> Julien Grall


