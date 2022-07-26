Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1047581473
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 15:49:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375322.607632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGKv6-0008UZ-H8; Tue, 26 Jul 2022 13:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375322.607632; Tue, 26 Jul 2022 13:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGKv6-0008SE-Db; Tue, 26 Jul 2022 13:48:20 +0000
Received: by outflank-mailman (input) for mailman id 375322;
 Tue, 26 Jul 2022 13:48:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jxi=X7=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oGKv4-0008S7-FK
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 13:48:18 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150083.outbound.protection.outlook.com [40.107.15.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99212e31-0ce9-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 15:48:16 +0200 (CEST)
Received: from AM5PR0701CA0007.eurprd07.prod.outlook.com
 (2603:10a6:203:51::17) by AM8PR08MB6562.eurprd08.prod.outlook.com
 (2603:10a6:20b:355::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Tue, 26 Jul
 2022 13:48:13 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::e2) by AM5PR0701CA0007.outlook.office365.com
 (2603:10a6:203:51::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.7 via Frontend
 Transport; Tue, 26 Jul 2022 13:48:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Tue, 26 Jul 2022 13:48:12 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Tue, 26 Jul 2022 13:48:12 +0000
Received: from 9c946de4f959.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BA9FF737-4F53-4E54-B764-0F8D578D6792.1; 
 Tue, 26 Jul 2022 13:48:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9c946de4f959.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Jul 2022 13:48:02 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by VI1PR0801MB1790.eurprd08.prod.outlook.com (2603:10a6:800:5b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Tue, 26 Jul
 2022 13:47:59 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7%9]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 13:47:59 +0000
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
X-Inumbo-ID: 99212e31-0ce9-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WQBrUClr+yrLufGStHl8H1dEzohRpvKA41y5m/eSSrazKJHKxZa2ELR8J6rKYoAES6WDGF1ha5xnQkP+CSU9nZfNLwxUeNAS+xOU3Wy8ejb37RBBKgUL8rHE8WPbgLwOEthlxWRnM5hmAlvWwGAOjwe/ypn8lCnro3Z+2esFTWp1kiR3fEzk1lw31KK9lHfAl4vENuVv6iAdJCJ1tA8pUxqXuSAsbMBkDZ/pyA8ooFGYvCWDMsgWl++XoAWkTL6/FmMBx7LvNSIeQRpO6dYy71Kg7Kg3a4G5crUpvofMTiXoCvgP7EUmt/mgyoqPu2aILFElt2S6pP+elZlK+66wow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7B+pFb/N8Nt0CI6ybQ2DgiaZzn+77nUb4TRCrU8TpKU=;
 b=FSiUOjed09GOaEuI1MyrrYjYqkbb7oftWIvr7yqr+FqhF+FjeILvF0jLStlHrcxFr8taZB4JlVcziGCC+2DDcHB7cjYP+WJqHqXxOct/Wl4DgizecKq6LI97sMhyQ2/2+948W2RdM+o8cAyy+KH6XmbBPryfR+BJtGiez6wsn269oIXfWNpE89eDbqpZjFoidS1/bfFtJ5OjEUuBTOlkSBv8y4DkaBGPmvEj7B9f6esHS/rJN9qSpuIhxwVj9ELvCDIjsyR5qTts0TTKm+Uhp4rjWrRhMEXw5c0rIpXJaaqjGq5Y/grK8ufjgpQss41LBxO06UsxtGAJio9uAB3kwQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7B+pFb/N8Nt0CI6ybQ2DgiaZzn+77nUb4TRCrU8TpKU=;
 b=hALpxUfiVLoO79h1Sn2VkqD4QDSe4mjwkKKlG64jo6ymCRjF1OwcvKGuq/EjZ3eGgEXO2EXM3vwp+X4l8onL9zFNvSg0iEB4WlmVyjyMNihmxwKNaQwLUA7J9fnMTz07edKnRW7Q7VG2cBoDkXA0mI29IXZhmnMEiuOt/bvaDdg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 929f679986e06651
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGVQRI4DaY2FwYJX/qOFDTVaJtT+t8Y6s8W6cxtjmL6vp6LHem02wbJfy661vl2EpxXjOlogLipoZDAfjB5OuYySmSVB7gwN0Dee7E8KzGVDE26glPidIiEF39hCon26pYg9t4K9ybrVdVbFecfVkrKyxhoCE8ylvFNpm0Xga33OyqRgoyqjXzisQ2E1bt1mCoZBdo8Qs7/BX4Ew68lbbfSyX0Sv7YZOUK3MkJZ7FYpyPH7E9VpyN2cMdRCWGC6Aahrz3ocSQuStx25hgMFil31Kkh9mbADd4UsGjXtsDCmq/nWnjzDK+iWrMUgHPFN/cw8f6ftYlyKZZGxk5BAUwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7B+pFb/N8Nt0CI6ybQ2DgiaZzn+77nUb4TRCrU8TpKU=;
 b=KW1HR6GZUa+GBr2VenPDnzl6ju5xHv5r5intJj7pA4Mq97rsfkkVY+GOP+uI69k4Bi5Oyq2hr2NkUblTClrfTLElT3Iq7VtlLRi/BpRJ+2Y2diLBnklRhEI4APGOrdhkiimAD5wv7T+dg0hObC/rEh2OfVjJl+08JjPCmL54L8LdBR7moOg4uiRY3ZUWWsUryXMqPezhlyyukYUJYmyI5Bxs3uGEqGzFP3STDQh/s1mjf0uoQMNrYQi3pdqYFuhTWDAFt8Lc2TeEGDyrpMdl+9Sh2ADslqz9UP8DzX+Uz93GRRo2I8IavUSAK+El5Z5r95/+oaM0p4OaHD/zF7Az0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7B+pFb/N8Nt0CI6ybQ2DgiaZzn+77nUb4TRCrU8TpKU=;
 b=hALpxUfiVLoO79h1Sn2VkqD4QDSe4mjwkKKlG64jo6ymCRjF1OwcvKGuq/EjZ3eGgEXO2EXM3vwp+X4l8onL9zFNvSg0iEB4WlmVyjyMNihmxwKNaQwLUA7J9fnMTz07edKnRW7Q7VG2cBoDkXA0mI29IXZhmnMEiuOt/bvaDdg=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH V7 00/11] PCI devices passthrough on Arm, part 3
Thread-Topic: [PATCH V7 00/11] PCI devices passthrough on Arm, part 3
Thread-Index: AQHYm5cOuiXPVkeraUmibOPVUdwdrK2QtXSA
Date: Tue, 26 Jul 2022 13:47:59 +0000
Message-ID: <4B8A2C5D-194B-4C15-9F4A-C5703CCA5727@arm.com>
References: <20220719174253.541965-1-olekstysh@gmail.com>
In-Reply-To: <20220719174253.541965-1-olekstysh@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: fc396a19-be14-4a0a-eec5-08da6f0d7bc6
x-ms-traffictypediagnostic:
	VI1PR0801MB1790:EE_|VE1EUR03FT012:EE_|AM8PR08MB6562:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1dGhobXcdZIi3kftodAXhL2v+j/d/KOQyTnvT/MKAHqZ9d9edAtavWAGsZcKpw+OnY8U2cx+pMa8UyyoMm+WiZ0n6LDhuhBdCILOq/duD+Qp/KpDVOiFzO9IIVxpx0mROLdIcGytBoV+eWf5QzItaY2mX4k9w5c3MUAtJLixPfNT5gkoGVGELgNdjCHSi1wnPfC+4vLHXeyCqmenfW2VQKGxjvxmphLjOPkgEpR9ozkziU/RzvbeRifCnfnkG3vEkFuQAgLoC1V62YLvOKdz6Xy3XHHjUh+JaVixCTD0V/WTxfkrwf44wV26UMVO/WFfquzOcsL9m848wyjZbsIEupHMM5lC8LshX+maUyxSh6sNNerVC470HeNIGKyR1F21XmMHpGcs7wU8uXorUpvCkBQP0OWoNojtMP1OdPLZIDD1oiI0TNferlryUf6wiu/uG+QCZzO6krlx0AxDtI7t4FQ8J4TNcn3Kj036nk08EKeZJQftvQRJHeaQ9buXN4Km2FWjsoEHG/cjTBlqV+J18tHlZoSuE5ves4wogbyoqXMoDtLir0bT/wmIOAgE9TAWcVSOEoV9lGX/FArGIJ4hFBHQTWB0JHcfuh1WYeTeDivA/bZ4B05UtPbj91Oxzf7ROWtdy3MoSvy3G/NpqNEcjwKCw7bZMNw1r1p9PpMbU4fRtMAP2KWUEMortPaE8B2azX5bUXJBT3wXwlvE+ZFjV7dmlLiT2DuqL12Rnp99wbN3A0a37pPxIFOqRAlwEO1MyJhvTmJUcYTXyFhvAd57/QE+xkI/R3eK9T21C6r9axGHHgxUrKXiDh7uaUH/gckZnckP4pjYFcDIFTtdtRPP/Dbvv8QVvvvPUz77pD/JfidQpJgMnFI7DW3hcAlybtATgKs0x3ogZ7weRil7N8Pvlg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(478600001)(6486002)(186003)(83380400001)(26005)(966005)(6512007)(38070700005)(7416002)(36756003)(8936002)(5660300002)(2906002)(2616005)(86362001)(6916009)(122000001)(6506007)(53546011)(54906003)(91956017)(66946007)(66556008)(38100700002)(33656002)(316002)(4326008)(76116006)(41300700001)(71200400001)(8676002)(66476007)(66446008)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CCC79E91F755D84E8B3F1862FED32FA9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1790
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a8d1ae2d-5bb9-4b50-2784-08da6f0d73d6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uE4CLTnPqvkqYw4+Io6sH/KKhVVwlqSF5TKtqwk9oNciv40BIBo4KsIpByLjzcEKZvMGAJOtyryi0HYGOs/ioqlE7NqX7VlogXTXfOTXMDd9pFAYWAEL8DYn9aTgNVUp68IIMLqjjOoDyISd9e6BE2aDh5BnlPWm8zyz1372lQfjfvYLIF+a0g7jZni4Q3EatpF1On5KZVpMCzj0XHnP9qypdoO1X8587SuJf6Hkgo6kUbxB5njMkp26SIYfSJ5DK+duzrMuBTQ0kOgBPcwi/Geb39xSxfAG5i4eATK53uzC0wYmbbWBYz58oX4WFIkxZNhLjGNNRo/ukyqZ58RLXRCyulW2eCHYxw4wTWiJUK55mEls3CPj9CLVbEHRdAOhB/gnehCiOzaqLVxUSJfWOeyLaipaq/droHhYSTq2bDoGLoTVo3BefcYgdNZ3WhMURIVdYSV6oZ6voLAyaToygTSfHxcCjjF3PeLlTC5Qi8xIKuxLRlgO3/VScky1e6F5SBe92Fmnv25ayn6mg8mEt6m1chkZoUVBSUp27q89XOHpWM1BFOjnuEtj4wydrs+14R9VSeG4Wvdsv2uOsxPkX6hLIs+lZYJT2Kgz4Kph8vZdbPIK/aGdpd9PL35rDz6D4M6AIbReACf5+lQ38nqBKSBVnFuWOvZ6HKRlgbPRMeQ18AHN8yCPcOk76zUF0/KUP+n0HeGxwICRp1hBd8DifN2Uln5ZN+MmKUUw1w54rF+4LD5sySq91hmipuuiGQP8iX88lZVARIkRQFsvZ7qLR4y4Ka8JyGJ9rqxornzFEUcFkJ6bn+uwCpIOAnLjdrBMYLcEe5y3OFPzu5nrPhjJl3GaU5GfeBW8XmpnsBC9kmcxKyOnJM2rNZ6fcuza8oXX
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39860400002)(136003)(376002)(36840700001)(46966006)(40470700004)(6512007)(26005)(53546011)(107886003)(356005)(2616005)(6862004)(8936002)(5660300002)(478600001)(966005)(6486002)(41300700001)(33656002)(6506007)(2906002)(82310400005)(36860700001)(40480700001)(336012)(47076005)(186003)(81166007)(82740400003)(86362001)(83380400001)(40460700003)(36756003)(54906003)(70586007)(4326008)(70206006)(8676002)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 13:48:12.7111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc396a19-be14-4a0a-eec5-08da6f0d7bc6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6562

Hi Oleksandr,

> On 19 Jul 2022, at 6:42 pm, Oleksandr Tyshchenko <olekstysh@gmail.com> wr=
ote:
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> Hi, all!
>=20
> You can find previous discussion at [1].
>=20
> 1. This patch series is focusing on vPCI and adds support for non-identit=
y
> PCI BAR mappings which is required while passing through a PCI device to
> a guest. The highlights are:
>=20
> - Add relevant vpci register handlers when assigning PCI device to a doma=
in
>  and remove those when de-assigning. This allows having different
>  handlers for different domains, e.g. hwdom and other guests.
>=20
> - Emulate guest BAR register values based on physical BAR values.
>  This allows creating a guest view of the registers and emulates
>  size and properties probe as it is done during PCI device enumeration by
>  the guest.
>=20
> - Instead of handling a single range set, that contains all the memory
>  regions of all the BARs and ROM, have them per BAR.
>=20
> - Take into account guest's BAR view and program its p2m accordingly:
>  gfn is guest's view of the BAR and mfn is the physical BAR value as set
>  up by the host bridge in the hardware domain.
>  This way hardware domain sees physical BAR values and guest sees
>  emulated ones.
>=20
> 2. The series also adds support for virtual PCI bus topology for guests:
> - We emulate a single host bridge for the guest, so segment is always 0.
> - The implementation is limited to 32 devices which are allowed on
>   a single PCI bus.
> - The virtual bus number is set to 0, so virtual devices are seen
>   as embedded endpoints behind the root complex.
>=20
> 3. The series has been updated due to the new PCI(vPCI) locking scheme im=
plemented
> in the prereq series which is also on the review now [2].
>=20
> 4. For unprivileged guests vpci_{read|write} has been re-worked
> to not passthrough accesses to the registers not explicitly handled
> by the corresponding vPCI handlers: without that passthrough
> to guests is completely unsafe as Xen allows them full access to
> the registers. During development this can be reverted for debugging purp=
oses.
>=20
> !!! OT: please note, Oleksandr Andrushchenko who is the author of all thi=
s stuff
> has managed to address allmost all review comments given for v6 and pushe=
d the updated
> version to the github (23.02.22).=20
> So after receiving his agreement I just picked it up and did the followin=
g before
> pushing V7:
> - rebased on the recent staging (resolving a few conflicts)
> - updated according to the recent changes (added cf_check specifiers wher=
e appropriate, etc)
> and performed minor adjustments
> - made sure that both current and prereq series [2] didn't really break x=
86 by testing
> PVH Dom0 (vPCI) and PV Dom0 + HVM DomU (PCI passthrough to DomU) using Qe=
mu
> - my colleague Volodymyr Babchuk (who was involved in the prereq series) =
rechecked that
> both series worked on Arm using real HW
>=20
> You can also find the series at [3].
>=20
> [1] https://lore.kernel.org/xen-devel/20220204063459.680961-1-andr2000@gm=
ail.com/
> [2] https://lore.kernel.org/xen-devel/20220718211521.664729-1-volodymyr_b=
abchuk@epam.com/
> [3] https://github.com/otyshchenko1/xen/commits/vpci7
>=20

I tested the whole series on ARM N1SDP board everything works as expected.

So for the whole series:
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul

