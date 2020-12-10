Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDCB2D5F8D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 16:25:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49443.87443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNoL-0002tA-5F; Thu, 10 Dec 2020 15:24:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49443.87443; Thu, 10 Dec 2020 15:24:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNoL-0002sl-1t; Thu, 10 Dec 2020 15:24:53 +0000
Received: by outflank-mailman (input) for mailman id 49443;
 Thu, 10 Dec 2020 15:24:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/MM=FO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1knNoJ-0002sf-Na
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 15:24:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::614])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c069ed3a-661b-42f6-81f1-5e39e42aea03;
 Thu, 10 Dec 2020 15:24:50 +0000 (UTC)
Received: from DB6P192CA0008.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::18) by
 VI1PR0801MB1727.eurprd08.prod.outlook.com (2603:10a6:800:5a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 10 Dec
 2020 15:24:48 +0000
Received: from DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::25) by DB6P192CA0008.outlook.office365.com
 (2603:10a6:4:b8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 10 Dec 2020 15:24:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT047.mail.protection.outlook.com (10.152.21.232) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 15:24:47 +0000
Received: ("Tessian outbound 76bd5a04122f:v71");
 Thu, 10 Dec 2020 15:24:47 +0000
Received: from d51f337d481e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 58607FE7-1E00-4AEB-A8CB-F2F4CD7FFBDB.1; 
 Thu, 10 Dec 2020 15:24:40 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d51f337d481e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Dec 2020 15:24:40 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1989.eurprd08.prod.outlook.com (2603:10a6:4:75::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 10 Dec
 2020 15:24:38 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 15:24:38 +0000
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
X-Inumbo-ID: c069ed3a-661b-42f6-81f1-5e39e42aea03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bPH8rJeWoyjg+tIkKS0XDp2P54aYaZ+tH5ElhQjML0=;
 b=fWWEw4e3A3p9gQ79AY8nKqfXSrvPMH5BB+6/f6cuTpEZ+zIOkW6ENuX7YPjwzpRpY65LbV93i+WtUW5AmUUKZzWxGSalt/++4OfPko0BimTyPpfbRICWPxhLqwBuCyNQSENStmfLlIUFGPRrI89peNJKg7sBRXLQmMs0uPPt/HA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f4a8b7e1512d3267
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AX/BfmPM2QcUdGkvvkwFBvOziTaC/WCZXGf21AeARcJqX4fNEW9TaFudpjgI5BmX7q2qrqhguwAY9Sd8qqrq/XnmI2rFdiHls7j+misaYDzuAeXYAGWmqYeOwoNb0U0CEz91UwHf7SM9Y7WcDcF+e+9GDFsJ7VqiYsHWuNnbA/IJvtc7stYnm6fo+nJZmbcZurZkApgLGUEUaOcVaN5qeU2u7/r339V9S05VpCTlKHbPSbscOqZVQkKKiD2iT8/tS4ibaGKabRmVGjNEURwv+IOyg/aVzQgHt1zU1tQhbxqB/9prjbyPkkph/bApoHTCkVe/pCPKcX8KBDXPVWbqtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bPH8rJeWoyjg+tIkKS0XDp2P54aYaZ+tH5ElhQjML0=;
 b=dyGa4IiPu3z3gBmrDUfZVNgK5PqVs6FSuVNWK38uejX1nRxMX5lHVvAKWmDNGhWr+QzF2kB9W2aSadWR7MMsitnXri9tkN/HlsCFDgk58zniGG79sbdFoCeqY5MrnHH2g43FZKZbnd7uuVqn49tOp/OLoLYSQnIGxI8FjygFqG37dMwCCQNvGespLMIGOEsKBulcg6Ei03AH6eP9RxcyIJeocpxy8IGkT1ICODTyDtlRDdT6tJLgxXJi3Qi6tIZmd1HNCa1cF8VvT8bfpldrxdYWLPtvIjNkNLmcRVkFz2Aqe5M+0jbiC1eOd0FNoZgPoWDJwYy+wDCAb7XyoifLgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bPH8rJeWoyjg+tIkKS0XDp2P54aYaZ+tH5ElhQjML0=;
 b=fWWEw4e3A3p9gQ79AY8nKqfXSrvPMH5BB+6/f6cuTpEZ+zIOkW6ENuX7YPjwzpRpY65LbV93i+WtUW5AmUUKZzWxGSalt/++4OfPko0BimTyPpfbRICWPxhLqwBuCyNQSENStmfLlIUFGPRrI89peNJKg7sBRXLQmMs0uPPt/HA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 6/7] xen/arm: Add CP10 exception support to handle MVFR
Thread-Topic: [PATCH v3 6/7] xen/arm: Add CP10 exception support to handle
 MVFR
Thread-Index: AQHWzklxLeD2qzBVf0meNxRIV80xoKnvQUgAgAEzSgA=
Date: Thu, 10 Dec 2020 15:24:38 +0000
Message-ID: <12F1D373-4661-44A0-BC04-FFD867C90976@arm.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>
 <a72a378cd1d4e5c6670980cf4d201d457abe5abc.1607524536.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2012091256290.20986@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2012091256290.20986@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7e66db4f-61bd-40a2-279e-08d89d1fbaf4
x-ms-traffictypediagnostic: DB6PR0801MB1989:|VI1PR0801MB1727:
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB17271CABB0035021D7DF12F49DCB0@VI1PR0801MB1727.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tEkmXDBKdM3i2oShv6XsEpMI5ht4c3MVWZsicYL72oP5qEbj25yCj4e66GfkuzlnKIJfEWc6Gp1oOGW89UdyMIV8dKVSAR2aU1JL2yzFGPipTVDB6iooFSnTno4nNIKuwT1DHJt/BsGwoIHiGZsAVvBqWnrUwXUjQUAxw2ZAo7vE0UBtRd9jlvCGjyfsVPJdshVxQsUKvMwVme9+uB62j1GPXNlAKtawWunFee92tSKawVM2KrO0ebfkGCA9RS5Lx8LGi03cYQN2oErXD4uLN7dz0Q2QWG4Pcu8/aB9lQeKxIWSIm7FCVtY/n6o9Rnw1ES53uDckyJuC4RFNfu7ypCumImSbUM0cOAcYao7jRveAgDZRusbNmKAztOnTJbuU
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(83380400001)(316002)(76116006)(66556008)(33656002)(5660300002)(91956017)(2906002)(478600001)(4326008)(36756003)(2616005)(8936002)(54906003)(26005)(186003)(6486002)(66446008)(66946007)(8676002)(71200400001)(64756008)(6512007)(86362001)(6916009)(6506007)(66476007)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?V4NrLnpVt29/YxT/m1X+UONjlyEUcgoFU/kLfJLZ/HxqkKnkiZja8qCr0QxX?=
 =?us-ascii?Q?RFwJncotyi8nzfqv2P9leWvw6p8eqbRvsjdYZp4lIsZdVuUuH6mEzfIXEr0U?=
 =?us-ascii?Q?ULjWhBbGWk1RPoZZq7Ee3Ki2XhmC/LgqaFPwOg9W6X4gWh0P91equrmbZF+E?=
 =?us-ascii?Q?6FHeHh4aGFvc71k/RcYpHRS35v0SLBtx1IoRFilKJ8C++Xphbr+BwEa3Du3K?=
 =?us-ascii?Q?mKCredljrorqnUNjoSH5twGWmRhnyvFQGFNEmm3O2eCN+0JBu2cxZgXQtBXG?=
 =?us-ascii?Q?04DUSWgeVF9v9qqKRZukdFEh3G+Vn9gv90p1b1fDx4Q76MOSPIoD/S/TiY+C?=
 =?us-ascii?Q?6HpRqE3/G/ABaV0lUs6SklrIh5rcMmkFKAerTKDO0CM8c5UeZ2OpYrIcMsCP?=
 =?us-ascii?Q?FeRcal9UJgXsqcT60yybzwROxQNDqoRwjYAQAIzwbCLkX3IlhcmrvfnE276b?=
 =?us-ascii?Q?t8tWAxyeJqaMN7Md08HkLgpEyrsx8ofxhTY6AdjAcfnNdPW9/wYNn7ItCKxw?=
 =?us-ascii?Q?jQi5OSVkYJ5YeVxN1OozlJTs1T9FH4oRgu+/HiG7Va+6IuFfsvPBGqM1aki8?=
 =?us-ascii?Q?5foEZ+Dxs0W8553fstxYI+hjCf/ibXBcVwqpDv9BNRUFm2mWRNRvEpMfeKPz?=
 =?us-ascii?Q?pampVkUv62TCRcM5V6Fx3DgXkAmUhSHJTFtxtxoSpcgJqzAjCvjOucFaJHRr?=
 =?us-ascii?Q?QV7JrgXujiYEU8jaV3vSW99LR9c6MBtJzMvsmfgEQ3CB9IKWQShwo63Phqqd?=
 =?us-ascii?Q?6MqqenxByUW6b3jPhnsYAu96/CYIjCkp28zBe4CphF30BWhEPl7n5ypv5WK3?=
 =?us-ascii?Q?DUGUgs/mzvR7UF+utS+VOckBE2MoO6RqvKtCNjBepzcU0cFP0ha1wJ6YK/67?=
 =?us-ascii?Q?veYPFGj+cCmslMyPvuiig6GMzCGlmPSFiAVpLzHNj1s0ZN0AopnhPdS/CsQI?=
 =?us-ascii?Q?Y3ZqFLhXTNMJyIQd6zBpz27PCPSmX93caTcX3tffmA/oOx0h/BlbdO564kRZ?=
 =?us-ascii?Q?2YQ5?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C46DE912B24BC742A8D8E1114E845EF4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1989
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f2bd50ca-54f0-4cc9-00c3-08d89d1fb559
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OWZt77ikzOMBUAx1dv4YmOT7baqcflOQ7U+BNm0bgha3K/mY/x3Q9nMMfnybuHOa9vhEHqyfSgfOwsIWAQCkEhg2OIJAOUj/0K/PAqEc3BykLJis+aifwajF6pUIM6UJEx+z/R9931Xq/A1S1homXgkKzCdUvwFq08zvddFtldDa6efMuBIKH1uRML/GI8KOCdztuCD69muT4y328bDklCamFulK595VA/qAbHT+zM7nZm7grCyklsDxRZ0oc5UJbdWI56zlFqJZnPGO/6AyQ3tAuIe9+b3yp904lZskH268Sj6ytzIIMFuEmk7zxi/TxSXF4TgS2nSSxwjWlBakmZn+M8tOmE1IDhR5sUZlys1qZulaX8YWjFVPHZupkkPVWtDr5Kw0gpBFh+C8UjQKFg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(376002)(396003)(46966005)(186003)(316002)(6512007)(6506007)(2616005)(47076004)(2906002)(82310400003)(86362001)(356005)(107886003)(54906003)(478600001)(70206006)(81166007)(70586007)(8676002)(36756003)(336012)(53546011)(26005)(8936002)(6486002)(82740400003)(4326008)(5660300002)(6862004)(33656002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 15:24:47.8955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e66db4f-61bd-40a2-279e-08d89d1fbaf4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1727

Hi Stefano,

> On 9 Dec 2020, at 21:04, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Wed, 9 Dec 2020, Bertrand Marquis wrote:
>> Add support for cp10 exceptions decoding to be able to emulate the
>> values for MVFR0, MVFR1 and MVFR2 when TID3 bit of HSR is activated.
>> This is required for aarch32 guests accessing MVFR registers using
>> vmrs and vmsr instructions.
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> Changes in V2: Rebase
>> Changes in V3:
>>  Add case for MVFR2, fix typo VMFR <-> MVFR.
>>=20
>> ---
>> xen/arch/arm/traps.c             |  5 ++++
>> xen/arch/arm/vcpreg.c            | 39 +++++++++++++++++++++++++++++++-
>> xen/include/asm-arm/perfc_defn.h |  1 +
>> xen/include/asm-arm/traps.h      |  1 +
>> 4 files changed, 45 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>> index 22bd1bd4c6..28d9d64558 100644
>> --- a/xen/arch/arm/traps.c
>> +++ b/xen/arch/arm/traps.c
>> @@ -2097,6 +2097,11 @@ void do_trap_guest_sync(struct cpu_user_regs *reg=
s)
>>         perfc_incr(trap_cp14_dbg);
>>         do_cp14_dbg(regs, hsr);
>>         break;
>> +    case HSR_EC_CP10:
>> +        GUEST_BUG_ON(!psr_mode_is_32bit(regs));
>> +        perfc_incr(trap_cp10);
>> +        do_cp10(regs, hsr);
>> +        break;
>>     case HSR_EC_CP:
>>         GUEST_BUG_ON(!psr_mode_is_32bit(regs));
>>         perfc_incr(trap_cp);
>> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
>> index d371a1c38c..da4e22a467 100644
>> --- a/xen/arch/arm/vcpreg.c
>> +++ b/xen/arch/arm/vcpreg.c
>> @@ -319,7 +319,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const un=
ion hsr hsr)
>>     GENERATE_TID3_INFO(ID_ISAR4, isa32, 4)
>>     GENERATE_TID3_INFO(ID_ISAR5, isa32, 5)
>>     GENERATE_TID3_INFO(ID_ISAR6, isa32, 6)
>> -    /* MVFR registers are in cp10 no cp15 */
>> +    /* MVFR registers are in cp10 not cp15 */
>>=20
>>     HSR_CPREG32_TID3_RESERVED_CASE:
>>         /* Handle all reserved registers as RAZ */
>> @@ -638,6 +638,43 @@ void do_cp14_dbg(struct cpu_user_regs *regs, const =
union hsr hsr)
>>     inject_undef_exception(regs, hsr);
>> }
>>=20
>> +void do_cp10(struct cpu_user_regs *regs, const union hsr hsr)
>> +{
>> +    const struct hsr_cp32 cp32 =3D hsr.cp32;
>> +    int regidx =3D cp32.reg;
>> +
>> +    if ( !check_conditional_instr(regs, hsr) )
>> +    {
>> +        advance_pc(regs, hsr);
>> +        return;
>> +    }
>> +
>> +    switch ( hsr.bits & HSR_CP32_REGS_MASK )
>> +    {
>> +    /*
>> +     * HSR.TID3 is trapping access to MVFR register used to identify th=
e
>          ^ HCR

ack, will fix the typo in v4.

>=20
>> +     * VFP/Simd using VMRS/VMSR instructions.
>> +     * Exception encoding is using MRC/MCR standard with the reg field =
in Crn
>> +     * as are declared MVFR0 and MVFR1 in cpregs.h
>> +     */
>> +    GENERATE_TID3_INFO(MVFR0, mvfr, 0)
>> +    GENERATE_TID3_INFO(MVFR1, mvfr, 1)
>> +    GENERATE_TID3_INFO(MVFR2, mvfr, 2)
>> +
>> +    default:
>> +        gdprintk(XENLOG_ERR,
>> +                 "%s p10, %d, r%d, cr%d, cr%d, %d @ 0x%"PRIregister"\n"=
,
>> +                 cp32.read ? "mrc" : "mcr",
>> +                 cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs=
->pc);
>> +        gdprintk(XENLOG_ERR, "unhandled 32-bit CP10 access %#x\n",
>> +                 hsr.bits & HSR_CP32_REGS_MASK);
>> +        inject_undef_exception(regs, hsr);
>> +        return;
>=20
> I take we are sure there are no other cp10 registers of interest?

Documentation is saying:
"VMRS access to MVFR0, MVFR1, and MVFR2, are trapped to EL2, reported using=
 EC
syndrome value 0x08"

So this is my understanding yes.

Cheers
Bertrand

>=20
>=20
>> +    }
>> +
>> +    advance_pc(regs, hsr);
>> +}
>> +
>> void do_cp(struct cpu_user_regs *regs, const union hsr hsr)
>> {
>>     const struct hsr_cp cp =3D hsr.cp;
>> diff --git a/xen/include/asm-arm/perfc_defn.h b/xen/include/asm-arm/perf=
c_defn.h
>> index 6a83185163..31f071222b 100644
>> --- a/xen/include/asm-arm/perfc_defn.h
>> +++ b/xen/include/asm-arm/perfc_defn.h
>> @@ -11,6 +11,7 @@ PERFCOUNTER(trap_cp15_64,  "trap: cp15 64-bit access")
>> PERFCOUNTER(trap_cp14_32,  "trap: cp14 32-bit access")
>> PERFCOUNTER(trap_cp14_64,  "trap: cp14 64-bit access")
>> PERFCOUNTER(trap_cp14_dbg, "trap: cp14 dbg access")
>> +PERFCOUNTER(trap_cp10,     "trap: cp10 access")
>> PERFCOUNTER(trap_cp,       "trap: cp access")
>> PERFCOUNTER(trap_smc32,    "trap: 32-bit smc")
>> PERFCOUNTER(trap_hvc32,    "trap: 32-bit hvc")
>> diff --git a/xen/include/asm-arm/traps.h b/xen/include/asm-arm/traps.h
>> index 997c37884e..c4a3d0fb1b 100644
>> --- a/xen/include/asm-arm/traps.h
>> +++ b/xen/include/asm-arm/traps.h
>> @@ -62,6 +62,7 @@ void do_cp15_64(struct cpu_user_regs *regs, const unio=
n hsr hsr);
>> void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr);
>> void do_cp14_64(struct cpu_user_regs *regs, const union hsr hsr);
>> void do_cp14_dbg(struct cpu_user_regs *regs, const union hsr hsr);
>> +void do_cp10(struct cpu_user_regs *regs, const union hsr hsr);
>> void do_cp(struct cpu_user_regs *regs, const union hsr hsr);
>>=20
>> /* SMCCC handling */
>> --=20
>> 2.17.1


