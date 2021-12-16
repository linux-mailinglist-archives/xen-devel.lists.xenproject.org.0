Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 095FD476EE4
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 11:29:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247850.427408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxo04-0005dD-O9; Thu, 16 Dec 2021 10:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247850.427408; Thu, 16 Dec 2021 10:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxo04-0005a4-KK; Thu, 16 Dec 2021 10:28:36 +0000
Received: by outflank-mailman (input) for mailman id 247850;
 Thu, 16 Dec 2021 10:28:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HYuw=RB=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1mxo03-0005Zy-FO
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 10:28:35 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe07::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb4ad5f7-5e5a-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 11:28:33 +0100 (CET)
Received: from AM5PR0301CA0001.eurprd03.prod.outlook.com
 (2603:10a6:206:14::14) by AM6PR08MB5254.eurprd08.prod.outlook.com
 (2603:10a6:20b:d6::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Thu, 16 Dec
 2021 10:28:31 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::b7) by AM5PR0301CA0001.outlook.office365.com
 (2603:10a6:206:14::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Thu, 16 Dec 2021 10:28:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.12 via Frontend Transport; Thu, 16 Dec 2021 10:28:30 +0000
Received: ("Tessian outbound de6049708a0a:v110");
 Thu, 16 Dec 2021 10:28:30 +0000
Received: from 9865fd34e82f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 373FB4C4-00B2-4B0D-A488-D6F5C4CFF43E.1; 
 Thu, 16 Dec 2021 10:28:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9865fd34e82f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 16 Dec 2021 10:28:07 +0000
Received: from AM9PR08MB6914.eurprd08.prod.outlook.com (2603:10a6:20b:307::13)
 by AM0PR08MB4564.eurprd08.prod.outlook.com (2603:10a6:208:12f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 10:28:05 +0000
Received: from AM9PR08MB6914.eurprd08.prod.outlook.com
 ([fe80::b1d3:4778:2574:bc13]) by AM9PR08MB6914.eurprd08.prod.outlook.com
 ([fe80::b1d3:4778:2574:bc13%6]) with mapi id 15.20.4801.015; Thu, 16 Dec 2021
 10:28:05 +0000
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
X-Inumbo-ID: eb4ad5f7-5e5a-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeOHfYJ8kW8bVJULprGG952kbFMUNaCYl+nA7VT8RTE=;
 b=yTIXz7B0G+GbcZM70GJ1DpogsmKePAkioGAQpZCidyhTtSFc7YzJmWRNjBo+CBJjZS3++CG4iaMQ2SEx0ClEt5FUPB17xc9Q/ueWmUfdEwFSQH7WoXr83ZnLGqXy4XExLqk8pKtKwdYOkL3cZZeLDACwc3dVX9XlNvqQlOiwZqg=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: 80009d3dd59d6319
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsWfjVMsMJJdY66Tfl+CbgCGgkn8QNAZhERsshIeK+P9prayxB0EN4mb9fuShltPFsqTVpd7EBOJd1sG6kduRsdsz46pTG1NWfPvGdQMvkYdSCrpIFAH6KbBQzPgPzQisI0GqoIXDrYfV7bbOWZcw6vEMXgDUZBkTFK69V2ZRr+36EV54PL7JzjD14u4hNRDt/O810X0P+9heu0yNJ4yl2djbWjsPs0Y1pmhfBw/IY/UCEtBmea9O47pz6RDyUGCtpHRlLNK+xTw1TcrxknHddinavsDUyYabeG7gEkgof55OWbYExkjipbLNMtvA+cU9WD0K7Pi3ZEA4Kkb9Um7tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XeOHfYJ8kW8bVJULprGG952kbFMUNaCYl+nA7VT8RTE=;
 b=AptksQgobJ6WK1qXkrUlOmlHV4TwURT6p/xmN1U8NQnLOIPLJfNbSFpYoCkf2lELEEX4ZFyDwEHnrypurWEt3OUI2x9LIHVPxd0A6VqeVPp4J89yOmfuAKzNEdEJNWjUH+cc2tanTiTn3rTuvqbgryVp0iH6WL5smnLsZkloSiyeKDT2l5iuQZ2V/zMenAQm8ftWvZMv0NM37pjUHua5FaSWFMoPB0LloWxMLDeYGBK2nKiDDtIrf2UAvlivwjVJkLMr+eS7TVHx1rofLnYSFXxJMUYDYMSiNEn9wsL0qUq3lbUqZmVTxp+xRTi9ccYcjHzoUb3GOVW69dMguNFYCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeOHfYJ8kW8bVJULprGG952kbFMUNaCYl+nA7VT8RTE=;
 b=yTIXz7B0G+GbcZM70GJ1DpogsmKePAkioGAQpZCidyhTtSFc7YzJmWRNjBo+CBJjZS3++CG4iaMQ2SEx0ClEt5FUPB17xc9Q/ueWmUfdEwFSQH7WoXr83ZnLGqXy4XExLqk8pKtKwdYOkL3cZZeLDACwc3dVX9XlNvqQlOiwZqg=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/vpci: msix: move x86 specific code to x86 file
Thread-Topic: [PATCH] xen/vpci: msix: move x86 specific code to x86 file
Thread-Index: AQHX8NfN625eD/1es0eaHkpOvTmQ3KwyCGqAgALlHQA=
Date: Thu, 16 Dec 2021 10:28:05 +0000
Message-ID: <E3B171DA-E199-435D-8582-22A155E5C16F@arm.com>
References:
 <b8c0e550dde0fd80b2f72e9136a94caab2c3d52c.1639478534.git.rahul.singh@arm.com>
 <bfb2b7f282249cee8b6ff15d424a2b7d823ac743.1639478564.git.rahul.singh@arm.com>
 <90c66d68-4939-f203-de2a-caebd0d6fc6c@suse.com>
In-Reply-To: <90c66d68-4939-f203-de2a-caebd0d6fc6c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 30fc4960-ef97-46f4-a501-08d9c07ece09
x-ms-traffictypediagnostic:
	AM0PR08MB4564:EE_|AM5EUR03FT009:EE_|AM6PR08MB5254:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB5254F8CF33AC1B6DF5AA17B7FC779@AM6PR08MB5254.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XfnzUdhryxq8jBZmelhInlFzMUDdyn9ElpZPxEoBRGWLNh2BHBAcd5YvCmLUSu5TUvc11mdorBrjjmlV/J+oBPyEqYkgElYwc/j/jUxlwAqBwqaC7rXDmVFwaZ+ggxy628xVE3hNXTUzdmwWbf5F1OyBqJMr3RlJw6uYgW/QaUk9qTCADQ4v8BZV93XaxAGLwC4bci9f8pmwlFa+9mDPos51TkpjTiSrWYRmvtxSV2cEBrUUf0Mw7D8oGucBtnBEbD0gJZ2deqajG1oVgvb+HpZ2X7zAftFasv8B1BaUHBr5nIIT4yB7hqWGn7C1lWh+ZJHRjLg3dzI7R6tiIBv+u/4Ya1+6DrC3K8SE0r9bQ1vRpe0hozrP86QeDujJjHliw9si0Zy/QwtqyfWLK0xErUOiQrdtxf/mpQ2R3XPsOO5aTILAeiItp5W6IeFCbIwvMhIB2s9lwhyHDHu/ysYM1kgEywfK5vxelnp3Cyws/MOR9Bhq7ikKGcESafnWR/EW45HVwKv/jG/dshjXzVIIMfSzy4THg5E4iFr3zV8Fbqvs1hNXYgU6JrdRX/BQASNh5JhrbPRBU7ALNlmJ1Zy0vfwaIJX/z89yqCrL+rakI2UajlYnLiRyjFqTyVNs+fzKxsyTbiAf90UKCbsBXU93s3JatKWibvkvTfG0FCo4RTXcURsvD3jX6FxY7mkdsnwzta7hhQu0L+qQoLDKyULy2R6oUd+isoNN9dIA7+sXte7lsHJzhS9464qTXL9yOSV5JFY+GFAIooKUMzj+SAfKpYbdapRIFFdqyv6jwRbsQaoaxnqu60v3d5AtRWp4je4gQdsOK/oKsIkhHUFn8weNMQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6914.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(33656002)(66556008)(4326008)(122000001)(66446008)(64756008)(6512007)(6506007)(86362001)(53546011)(2616005)(36756003)(38070700005)(6486002)(186003)(8936002)(26005)(2906002)(6916009)(38100700002)(316002)(76116006)(91956017)(66946007)(83380400001)(8676002)(66476007)(71200400001)(54906003)(508600001)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D317FB7F9329E74B9AD75D69C3E6B448@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4564
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ff6e5d00-0881-4098-0e29-08d9c07ebeeb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D4CaxvASQb6d4ro/IKZfAYKYCvfxubU/KFWkI/ry0pD6BA7I+CGRF7AfZKKe49ghiu6B5tGTNtD5KXSRgve7Gm83ypFUon4sbK/JrHcgPJRJCxYJkG7kvX8tfNJvDNb1FU+GGe5CctNLcabYQPC+Tat+xSurt6qlRo8c16qv9omLtuXtHUqRJdr+a/u111o3S2StbyVoZrYLAyWqgnRThLM5vNxpaiOJKsfMvE/d949mDHTwIYCvuy9D2NDIJfbm+b1dzpC1pkhA0TLfTR1wxpoZjfstcZFgz/Z7kqB+WG74NwRh5FLBRqLpzg2biog0FtNKhST2jLiAtyhnDJc2fd73av+APL+GPS056rr4x0YC+HijEdqbElDVC8cF7QVXG/icMetrFA3LZsNfN1XyFae1Ae/qDV6sODWse3tNywVJ1pDy/jcrAlRvM41uoX4StpNp9NEaVo5bfD/07my83Koz7w4zw+NxvkpEHKAMMJ8hdHym9PdzPHg/By+GWoCeD5LcbL9WKGdW/jQSFeRnUZ8/CTHhAaKcGlCjMQE0vsmY9tHXXfbu3NJnrQzMgZRxxN0pFn14/GJDw8KRDAcW2j9O/3Hp+tQ5rYPJ+MXEKQFD+ujGvTqp6/gL6OqDxXGSC6qJByZXPq+T8WvKYuYq2ZItnhxRgfvL7Iv56DCe59HvLrqtQL1QqbruycHi5ctWfZfmP1snfGhzbh1bInNhKiS0act4jSSf6QHFnHdtqNUo3eECex7R8RcS9mUt2mXF+vPCeytKpRe75jiZWZb5akOwEic5CWopgkbenLIXhsoCZxGirs8GfQckyRYXj1y5hqzprIxx4c7GveT3VnWEF5R4lhWGwxE2jyJyW70N86p5vUoJfjCnFOdyOo6hnLb+86EPKajNwr9wtifvrN+CVQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(8936002)(47076005)(40460700001)(33656002)(5660300002)(356005)(54906003)(63350400001)(63370400001)(6862004)(6512007)(316002)(36860700001)(336012)(81166007)(86362001)(508600001)(4326008)(26005)(8676002)(70586007)(6506007)(53546011)(82310400004)(70206006)(2616005)(36756003)(186003)(2906002)(6486002)(83380400001)(2004002)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 10:28:30.4005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fc4960-ef97-46f4-a501-08d9c07ece09
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5254

Hi Jan,

Thanks for reviewing the code.

> On 14 Dec 2021, at 2:15 pm, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 14.12.2021 11:45, Rahul Singh wrote:
>> --- a/xen/drivers/vpci/msix.c
>> +++ b/xen/drivers/vpci/msix.c
>> @@ -17,15 +17,24 @@
>>  * License along with this program; If not, see <http://www.gnu.org/lice=
nses/>.
>>  */
>>=20
>> +#include <xen/msi.h>
>> #include <xen/sched.h>
>> #include <xen/vpci.h>
>>=20
>> -#include <asm/msi.h>
>> #include <asm/p2m.h>
>>=20
>> -#define VMSIX_ADDR_IN_RANGE(addr, vpci, nr)                            =
   \
>> -    ((addr) >=3D vmsix_table_addr(vpci, nr) &&                         =
     \
>> -     (addr) < vmsix_table_addr(vpci, nr) + vmsix_table_size(vpci, nr))
>> +/*
>> + * The return value is different for the MMIO handler on ARM and x86
>> + * architecture. To make the code common for both architectures create
>> + * generic return code with architecture dependent values.
>> + */
>> +#ifdef CONFIG_X86
>> +#define VPCI_EMUL_OKAY      X86EMUL_OKAY
>> +#define VPCI_EMUL_RETRY     X86EMUL_RETRY
>> +#else
>> +#define VPCI_EMUL_OKAY      1
>> +#define VPCI_EMUL_RETRY     VPCI_EMUL_OKAY
>> +#endif
>=20
> In addition to what Roger has said, at the example of the above I think
> you want to split this change. The change in return value naming could
> likely quite well be a separate thing. And then it'll be easier to see
> which other suggested changes are really movement of x86-specific stuff
> (looking over it I wasn't convinced everything you move really is).
>=20

Ack. I will split the changes in next version.

>> @@ -472,11 +401,10 @@ static int init_msix(struct pci_dev *pdev)
>>         vpci_msix_arch_init_entry(&msix->entries[i]);
>>     }
>>=20
>> -    if ( list_empty(&d->arch.hvm.msix_tables) )
>> -        register_mmio_handler(d, &vpci_msix_table_ops);
>> +    register_msix_mmio_handler(d);
>> +    vpci_msix_add_to_msix_table(msix, d);
>>=20
>>     pdev->vpci->msix =3D msix;
>> -    list_add(&msix->next, &d->arch.hvm.msix_tables);
>>=20
>>     return 0;
>=20
> May I ask that you don't alter the order of operations? I take it that
> vpci_msix_add_to_msix_table() is the replacement of the list_add().
> That should occur only after pdev->vcpi has been updated. I could in
> fact imagine that in cases like this one for Arm barriers may need
> adding.

Yes I will not change the order I will fix this in next version.
>=20
>> --- /dev/null
>> +++ b/xen/drivers/vpci/x86_msix.c
>> @@ -0,0 +1,155 @@
>> +/*
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms and conditions of the GNU General Public
>> + * License, version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> + * General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public
>> + * License along with this program; If not, see <http://www.gnu.org/lic=
enses/>.
>> + */
>> +
>> +#include <xen/sched.h>
>> +#include <xen/vpci.h>
>> +
>> +#include <asm/msi.h>
>> +#include <asm/p2m.h>
>> +
>> +u32 vpci_arch_readl(unsigned long addr)
>=20
> Nit: No new uses of u<N> please; these are being phased out, with
> uint<N>_t being the intended types.

Ack .
>=20
>> +{
>> +    return readl(addr);
>> +}
>> +
>> +u64 vpci_arch_readq(unsigned long addr)
>> +{
>> +    return readq(addr);
>> +}
>> +
>> +void vpci_arch_writel(u32 data, unsigned long addr)
>> +{
>> +    writel(data, addr);
>> +}
>> +
>> +void vpci_arch_writeq(u64 data, unsigned long addr)
>> +{
>> +    writeq(data, addr);
>> +}
>=20
> Functions like these (if, as Roger said, they need abstracting in the
> first place) or ...
>=20
>> +void register_msix_mmio_handler(struct domain *d)
>> +{
>> +    if ( list_empty(&d->arch.hvm.msix_tables) )
>> +        register_mmio_handler(d, &vpci_msix_table_ops);
>> +}
>> +
>> +void vpci_msix_add_to_msix_table(struct vpci_msix *msix,
>> +                                 struct domain *d)
>> +{
>> +    list_add(&msix->next, &d->arch.hvm.msix_tables);
>> +}
>=20
> ... these would imo better be inline helpers.

Ack.
>=20
>> --- a/xen/include/asm-x86/msi.h
>> +++ b/xen/include/asm-x86/msi.h
>> @@ -148,34 +148,6 @@ int msi_free_irq(struct msi_desc *entry);
>>  */
>> #define NR_HP_RESERVED_VECTORS 	20
>>=20
>> -#define msi_control_reg(base)		(base + PCI_MSI_FLAGS)
>> -#define msi_lower_address_reg(base)	(base + PCI_MSI_ADDRESS_LO)
>> -#define msi_upper_address_reg(base)	(base + PCI_MSI_ADDRESS_HI)
>> -#define msi_data_reg(base, is64bit)	\
>> -	( (is64bit =3D=3D 1) ? base+PCI_MSI_DATA_64 : base+PCI_MSI_DATA_32 )
>> -#define msi_mask_bits_reg(base, is64bit) \
>> -	( (is64bit =3D=3D 1) ? base+PCI_MSI_MASK_BIT : base+PCI_MSI_MASK_BIT-4=
)
>> -#define msi_pending_bits_reg(base, is64bit) \
>> -	((base) + PCI_MSI_MASK_BIT + ((is64bit) ? 4 : 0))
>> -#define msi_disable(control)		control &=3D ~PCI_MSI_FLAGS_ENABLE
>> -#define multi_msi_capable(control) \
>> -	(1 << ((control & PCI_MSI_FLAGS_QMASK) >> 1))
>> -#define multi_msi_enable(control, num) \
>> -	control |=3D (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE);
>> -#define is_64bit_address(control)	(!!(control & PCI_MSI_FLAGS_64BIT))
>> -#define is_mask_bit_support(control)	(!!(control & PCI_MSI_FLAGS_MASKBI=
T))
>> -#define msi_enable(control, num) multi_msi_enable(control, num); \
>> -	control |=3D PCI_MSI_FLAGS_ENABLE
>> -
>> -#define msix_control_reg(base)		(base + PCI_MSIX_FLAGS)
>> -#define msix_table_offset_reg(base)	(base + PCI_MSIX_TABLE)
>> -#define msix_pba_offset_reg(base)	(base + PCI_MSIX_PBA)
>> -#define msix_enable(control)	 	control |=3D PCI_MSIX_FLAGS_ENABLE
>> -#define msix_disable(control)	 	control &=3D ~PCI_MSIX_FLAGS_ENABLE
>> -#define msix_table_size(control) 	((control & PCI_MSIX_FLAGS_QSIZE)+1)
>> -#define msix_unmask(address)	 	(address & ~PCI_MSIX_VECTOR_BITMASK)
>> -#define msix_mask(address)		(address | PCI_MSIX_VECTOR_BITMASK)
>> -
>> /*
>>  * MSI Defined Data Structures
>>  */
>> diff --git a/xen/include/xen/msi.h b/xen/include/xen/msi.h
>> index c903d0050c..1c22c9a4a7 100644
>> --- a/xen/include/xen/msi.h
>> +++ b/xen/include/xen/msi.h
>> @@ -3,6 +3,34 @@
>>=20
>> #include <xen/pci.h>
>>=20
>> +#define msi_control_reg(base)       (base + PCI_MSI_FLAGS)
>> +#define msi_lower_address_reg(base) (base + PCI_MSI_ADDRESS_LO)
>> +#define msi_upper_address_reg(base) (base + PCI_MSI_ADDRESS_HI)
>> +#define msi_data_reg(base, is64bit) \
>> +	( (is64bit =3D=3D 1) ? base+PCI_MSI_DATA_64 : base+PCI_MSI_DATA_32 )
>=20
> As you move this code, please tidy is style-wise. For the construct
> here, for example this would mean
>=20
> #define msi_data_reg(base, is64bit) \
>    ((is64bit) ? (base) + PCI_MSI_DATA_64 : (base) + PCI_MSI_DATA_32)
>=20
> or perhaps even
>=20
> #define msi_data_reg(base, is64bit) \
>    ((base) + ((is64bit) ? PCI_MSI_DATA_64 : PCI_MSI_DATA_32))
>=20
> Further items would want similar adjustments.

Ok . Let me try to fix this in next version

Regards,
Rahul
>=20
> Jan
>=20


