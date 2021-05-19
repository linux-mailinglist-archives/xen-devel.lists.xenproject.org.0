Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A90389371
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 18:16:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130237.244083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljOrD-0006Bu-VS; Wed, 19 May 2021 16:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130237.244083; Wed, 19 May 2021 16:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljOrD-00069d-S4; Wed, 19 May 2021 16:15:39 +0000
Received: by outflank-mailman (input) for mailman id 130237;
 Wed, 19 May 2021 16:15:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IUdU=KO=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ljOrC-00069X-6q
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 16:15:38 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 423b47e5-7ace-4820-bc6a-4e49962a6c25;
 Wed, 19 May 2021 16:15:37 +0000 (UTC)
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
X-Inumbo-ID: 423b47e5-7ace-4820-bc6a-4e49962a6c25
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621440937;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/RvdvcoNzgaEU1wmQad6fXVJxD7hD5MTNpngWSv+Rl8=;
  b=Z+Vbfn+ev2uJeY4pfm/BXwtwfNjnKcyfMrae8upYxlwZhhQeij6VsmhR
   QMijYLqRyZmku/YPK7Wp1oLLwqTfGSrIGay/bMGQwfPkaPBMF/mR97oGR
   tWK2BD5y95nRFfGvLTj4ZUNaHyHnNgDu7rrH0f5a5PvjSEWvV+sN5q3en
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: q1d+fYkCESONGoI8sfdNo+Pzitcgl8/dIz4k+MGVpMhxGBIpYzviGI14blLjTaym9OE3DOI7MY
 bRWgNlm+6MrpmQsiWAE9D0w0bemWXCSSgXiZ4M2hluwy0ko+KRx6PbpHV+fLgLsNNMOmZsYBx+
 mUQUeIGQFbG9bW50XjxMgn99nZjN8EH6re41ldvcHgDAaKCjE7M1igImGYVk7apcShlj1OdROr
 OiFGrT6E+WskSkPxQsabNS1wUeMmDEi6lNhiUY18HynxUSjA2UVM3iHdb9itm5EbBUxU81Oj5d
 j8g=
X-SBRS: 5.1
X-MesageID: 44254766
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-Data: A9a23:Esav5qq4Mr3wbhSS6VwRmzAFeLteBmJqZRIvgKrLsJaIsI4StFCzt
 garIBnQaPfcZGPyKtp3aYvg9k0A65Lcm9A1HFdl+CE1Fygb9JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEljufXAOKU5NfsYkidfyc9IMsaoU8ly7RRbrJA24DjWlvQ4
 IKq/aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBLJD+nL1CWDNiMB4vF5F315qdYiaRvpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7Q8wJ56RCXoFNp3VnVI4jzeF/krB7zeRaHD/fdT3Ssqh9AIFvHbD
 yYcQWYzNkmcPEMRUrsRII4yx7evh0TgT2FV+QuYi6lp0jbTyiUkhdABN/KKI4fXFK25hH2wp
 33E13T0BAkAM96SwibD9Wij7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWc9lYL
 kkJ/CsyvO43/UqiQdTndw21pmaeuRwRUMYWFPc1gDxh0YKNvVzfXDJdCGccOJp87afaWADGy
 HebouHtXGNkmoe2diO3yoa7iGnxZwYaeDpqiTA/cecV3zXyiNht1EuVH4cySPPdYs7dQ2+pm
 23TxMQqr/BD1ZdRhv3TEUXv3mr0zqUlWDLZ8ek+soiNwARjeMaBbpGk5ELX5PJNRGpyZgLa5
 yFa8yRyAfpnMH1sqMBvaL5XdF1Kz6zfWNE5vbKIN8NwnwlBA1b5IehtDMhWfS+FyPronAMFh
 2eP4WtsCGJ7ZST7N8ebnaroVJRCIVfc+STNCamPM4smjmlZXw6b5iB+DXN8LEi2yRVErE3LA
 r/GIZfEJStLUsxPkWvpL9rxJJd2n0jSM0uIHsulp/lmuJLDDEOopUAtYArWMr9htPvayOgXm
 v4GX/a3J9xkeLSWSgHc8JIJLEBMKn4+BJvsrNdQePLFKQ1jcFzNwdeIqV/9U+SJR5hoq9o=
IronPort-HdrOrdr: A9a23:ZsxnYqrfxCXETaOEi7umYyAaV5viL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossSkb6Ky90KnpewK5yXbsibNhfItKLzOWx1dAS7sSrbcKogeQVREWk9Q96U
 4OSdkHNDSdNykZsS++2njELz9C+qjFzEnLv5ak854Fd2gDAMsMj3YbNu/YKDwNeOAvP+tlKH
 P23Lshm9PUQwVvUi3NPAhiYwGsnayvqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 nsiWXCl+eemsD+7iWZ+37Y7pxQltek4MBEHtawhs8cLSipohq0Zb5mR6aJsFkO0aSSARcR4Z
 3xSiUbToJOAkDqDziISNzWqlHdOQMVmjjfIJmj8CDeSILCNWgH4oF69Pxkm1PimjsdVZdHof
 52NiuixulqJAKFkyLn69fSURZ20kKyvHo5iOYWy2dSSI0EddZq3MEiFNM8KuZxIMvW0vFtLA
 BVNrCX2B+WSyLtU5nThBgi/DVtZAV6Iv6ieDlMhiW46UkjoJlJ9TpQ+CVEpAZ0yHsUcegy2w
 3rCNUbqI1z
X-IronPort-AV: E=Sophos;i="5.82,313,1613451600"; 
   d="scan'208";a="44254766"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LuY7M+DFngoe90UJ+F6CrbE8gL9L9+lxI8+FiqT8Ls9WPQXIdlDqxtWT1HuVfqyUoHvelJAmL+yHLVqRu5yt72kmPF74hV7Phaohx5v9VLmMKztNfuDqec1EuILWtPfmsMGOELmkXO+WSlB+CozdqM8+WJhGs2wi3WhXrJC4y099J4bRcPGyyklelhJbu/6MqRviIbvjyLzTMESYvlwOExWSGOiSV/Y/vbRr7RiKqRJ3GitwX001MDGauU6umUYjYVehGrrkCbdv4hPOwKg3B139FMBXXIgTVnhfherizUuST/E3PJqzb067puYkRUC4IRwwCwht/0ZWRRRwueuBOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RvdvcoNzgaEU1wmQad6fXVJxD7hD5MTNpngWSv+Rl8=;
 b=hjJhs0ksR6zHCNjPKd02j6dvaKkvbDxau/4UQLzByO4PdnzTzJcOOL5tonQkexuJO9SGzNznqk+lTaGhRlbVmu6AvW4Q0x6YHFhtCURIlVtntB20HRy++DKBlrhMWvPQ63j4O0aZllV2SSTm4EG65ePGKxE8pz28Bi9vYRjx0HGG1Xz90hGv3Rbs0Z9gzJOWW2mAw3fk2DyKoEnT1gnOeHvPzMHnBBkEopczFB5ErBTQbuMWYJ4WR22pIaloaTFxTLAeG0vqQS23tFAEo3lcZygRvsCI7Kyg+b++qpG5+vPBwb6YHyocw4kVtP7jYKE3tpW1oKPEPSLGGZFZ1hmNTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RvdvcoNzgaEU1wmQad6fXVJxD7hD5MTNpngWSv+Rl8=;
 b=Kc5UIfqzfhYai3qpz+ytpR3PTMmx3/x4A5mW8J8O7mvsB3Sn85h4pCjMsTpBM8N3Nni6WILInf2vDPtMo5GmKA46tGpno8K+gLNeQ4wqlQ7lzRD0sDqhGriA1G6EkrqKOUmCbSAN2ExOT5zrv+C19zztxhAqXNH8CcobfoNo+sk=
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"community.manager@xenproject.org" <community.manager@xenproject.org>
Subject: Re: IRC networks
Thread-Topic: IRC networks
Thread-Index: AQHXTMUre4pjfhF+RUKgWz01JlgFDKrq+tiA
Date: Wed, 19 May 2021 16:15:34 +0000
Message-ID: <10B84448-21E3-41F2-AAD2-B9F6E9EB5DE8@citrix.com>
References: <24741.12566.639691.461134@mariner.uk.xensource.com>
In-Reply-To: <24741.12566.639691.461134@mariner.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d7e63f6-0299-47fa-2ca0-08d91ae154e3
x-ms-traffictypediagnostic: PH0PR03MB5941:
x-microsoft-antispam-prvs: <PH0PR03MB5941D51EC1CAD5B2ED7F8E36992B9@PH0PR03MB5941.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d+7R9GDYMZCuB9lTL20ny6/IrcseT8c6u4QHnOJOavCkZxwmX0+Pylg7vFyateoTvpOkCO5DbMTTBYrUEpOFyxWRNTwkz5wXEli9Qc2UOmydP1MCWp0NXEQpdpuIJ6tw6JUUHQsgVx/uEFtN6go6z1C5U2jFVYEcBf80F0GO4zwjHMzwMJvUl2J/JINKLIIFY40dN5B9L0EOWJBahHvESz2uMp3eCzPqUXMukQmz1jhworgt5KGjvgWxHr353k2GIi4W+KwH5lYJET1qCYvxAG58f61GlxkGjIhJT9nN7S1NYZUg5TmIfg9BOEtyl61Fy1ySTScNpAJkdg2PhyDQhWZO4+rVrAX3j0kw0uknE/7IapLgY65kfnQYfWcGRV5VVgHb0z5KER15sishvU7VEgVagtTbkE54NWxu+gF1CAEVg2Vl19CzUdXtNWxUsTzR1jG7e1Rov1FBlE5qusXm1ZiimYXksvOcXoMpvoC8N8Vs7WaXgYSrTBzBIYezpP2jvZmwSPKCan619ulFhBHTYT6z0CtrDes/XWofx+SkBsTi0n4EH4zuahSASpCa64bH2JlcVcC1mxGmp24m8bPnQOzVykPDekyqyJychQ+oUvTScTcHtMbxa2VWQVCWe/PPZTROefvX1V609emNXGUCt3xDEbrhxhrmcPbUiC/pOT0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(83380400001)(3480700007)(66946007)(64756008)(66446008)(66476007)(66556008)(2906002)(6486002)(76116006)(6916009)(71200400001)(91956017)(4326008)(26005)(38100700002)(478600001)(186003)(5660300002)(86362001)(122000001)(53546011)(8936002)(8676002)(7116003)(6512007)(316002)(2616005)(33656002)(54906003)(4744005)(36756003)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UEVyYmUxbXpqQkE1aXRUWkhrTGVZK2k2V1NMSHdhOWZuSUxoOHM4cmFVY255?=
 =?utf-8?B?ZndpcDRxYWZmOTJHRlJpZkMvOFdjQXAyaXNqOUFqVzRHUmZROVZpcnZ4cEJy?=
 =?utf-8?B?b1hCcDhuU3YvRjZIUWdNTHltSzN1di82cEZiK0w3bHB3ZjV6cmNFZ1lpQTJt?=
 =?utf-8?B?VituSEZPNnVYakx0ejdldkRSZ2dZNFIwbGpLUGU1MlB6VXpFWDYvYUl6N1lE?=
 =?utf-8?B?TGlvbG00QW1rT2Uwa2RseHI4K1IrU2toV1VZd2NzWFRGaHFROUFwVlZHZGZF?=
 =?utf-8?B?bkRPZjNZOE5OUW03ZWQ1WUJoeVN1bkh3cVRpenFFTGx2QUxYSFFxQ2tJL3o2?=
 =?utf-8?B?aFF5TzU1QldHUXdyM0VZOGVCNHZUdU0vUzJNbEsrRnNSeUdTdkRsMUJQaUd1?=
 =?utf-8?B?MS92NWJNMTJjN3lhN0VPdUk3T3BjU09taTRqb3pKMWlBZEc1K1hJZjlVOFNZ?=
 =?utf-8?B?MlVJMXNSMnhVNnI2NnVoQlcrRENwb01MVzA3ckpzeUFHSnVvc3R2d1JVWnNp?=
 =?utf-8?B?R1c0U0RwRkd6bWpRamRPNXBLQ1p0Wklzc051bXFyVHg3OThnNmJ0cXdnVng5?=
 =?utf-8?B?cm5zNENWdXpRRHBWRHVlODFxT2xMNjloSFgyeGRVVTU1N293dUNNRy9jN1pE?=
 =?utf-8?B?L3BOclhiQ1V2a0FXZjQ5Nm0wY3hqTEhBMWkwWDNsUUhiVisyT1BkRm5OY3R5?=
 =?utf-8?B?cnNOcVFoU0pNVzV6UjR1bmJGOS96aU5jSmhQOU8wcDFBRy9tNDRIRFdQRjNz?=
 =?utf-8?B?UVJVanJid0hweUpoYURCb1EwNlJFMXQ4T1AzTGcrQVg2Qlk2NFg1RURDK1ZO?=
 =?utf-8?B?VXF3TFdMZ0k5RXBIVzlTTnBrNFhiZndlUHN4SnZzWVFuZ2pZVHFsbFlWN0Nt?=
 =?utf-8?B?MFJqS1ZpYVh6ejlORWZVbHBLcHhJQVgzNEloTjNOTU1sMDFJd0U4cVA2UjhO?=
 =?utf-8?B?YjhaN21iS3pGMFc3endYeEtoZHo5OUxmd3lPMDZZcTRJV2RpWVg2N2VSRFJU?=
 =?utf-8?B?b0NFUEpUS1pQeC93aWpsU2Jtb2k2NkUwVDY0WW5jMkQyMnZYYlRLa0NHTk9K?=
 =?utf-8?B?aFlxdVFIb1BueTRYYWx5QngvbWpCMnBwdUlGbTlWbmtIYTB1d3BVb2tSdWJt?=
 =?utf-8?B?aDdsUTJQUm9hK0luVlFiQnVValB5Qyt5Y3oyOU9jKzZpd0IrczZCcG5sdHNa?=
 =?utf-8?B?dWRhdkhFWi82SjFMTkVsUHpHTjk5UFlwSFczemZEc2VzR3RzeGZCRHphR0RL?=
 =?utf-8?B?TFkyMUNQeVcrV1AwN1JOemgwclFDUC9ZQWY1YjYzemhCWnBzYnNjM0VJTDg2?=
 =?utf-8?B?VzE4aW5OVHRQSHdUdTRzK251V3Q4UDBmSzVrRTl0enpFZk1HeXNyYzBldm8w?=
 =?utf-8?B?Z0hlK3VuaDBlOXplK0dwN1hWLzZ6ak1SN3BVZ1B2c1IvdTJMTFF4VG91aGVO?=
 =?utf-8?B?OFF0clBSYmtlMDYrQm5QTDJSMUIzL2VxWkNXNWJVZzliTlUyRjFZdk1ra09x?=
 =?utf-8?B?N1FiNGQ3am9PVFRJUXJJRjVpOHNyZ0V6aW5pcFNPdjJXOXc4SkNoUSt3OGw5?=
 =?utf-8?B?SVhoM1F3TjA2Y3R4M0xaUWR1OVRYUVo0dGFvK1ZaZTVOSGNWUFljdVJFWVVh?=
 =?utf-8?B?YUF4RC8wQ0lobUZQUGJpQW5jTTY5a2pUUEUrbFZhZWVnQmx5YzczUGg0YWhO?=
 =?utf-8?B?K2ZNM05EbWRTdXdaQlRwbmlyM25WNUxPenhiY29McnpUWVNPWEZNRDRnK2tz?=
 =?utf-8?B?NnJpOEZhSTNzR1ROUTF5K1RRQUhJNzJBMGJQQms5eEoyOERIUlVCSkpiNUlr?=
 =?utf-8?B?bnVBSE5GMkd1dWgxalp2dz09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7618C7F3BDC1124FBE69200421585EF1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d7e63f6-0299-47fa-2ca0-08d91ae154e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2021 16:15:34.2887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: coJoBaN+x5ZvK9UhSrBKKcPn+4W7zMzmHUF7gTaR5w6OHJ9BTt8/c2sP8AvIjLNu3UHBGiQB+ONFfc5YnPG2KkLRdqsbnVD8IgVwTtyUwhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5941
X-OriginatorOrg: citrix.com

DQoNCj4gT24gTWF5IDE5LCAyMDIxLCBhdCA0OjM5IFBNLCBJYW4gSmFja3NvbiA8aXdqQHhlbnBy
b2plY3Qub3JnPiB3cm90ZToNCj4gDQoNCj4gSSByZWNvbW1lbmQgdGhhdCB3ZSBzd2l0Y2ggdG8g
dXNpbmcgT0ZUQyBhcyBzb29uIGFzIHBvc3NpYmxlLg0KDQpUaGFua3MsIElhbi4gIEkgdGVuZCB0
byBhZ3JlZSB3aXRoIHRoZSByZWNvbW1lbmRhdGlvbi4gIEkgdGhpbmsgdW5sZXNzIHNvbWVvbmUg
d2FudHMgdG8gYXJndWUgdGhhdCB3ZSBnbyB0byBsaWJlcmEgKG9yIHN0aWNrIHdpdGggZnJlZW5v
ZGUpLCB3ZSBzaG91bGQgZ28gd2l0aCB0aGF0IG9wdGlvbi4gIA0KDQpOb3JtYWxseSBmb3IgYSBk
ZWNpc2lvbiBsaWtlIHRoaXMgd2XigJlkIHdhaXQgMiB3ZWVrcyBmb3IgY291bnRlci1hcmd1bWVu
dHMgYmVmb3JlIG1ha2luZyBpdCBvZmZpY2lhbC4gIERvZXMgYW55b25lIHdhbnQgdG8gYXJndWUg
dGhhdCB3ZSBzaG91bGQgbW92ZSB1cCB0aGUgdGltZXRhYmxlIGZvciBzb21lIHJlYXNvbj8NCg0K
SeKAmXZlIHJlZ2lzdGVyZWQgI3hlbmRldmVsIG9uIG9mdGM7IEnigJlkIGVuY291cmFnZSBlYXJs
eSBhZG9wdGVycyB0byBnaXZlIGl0IGEgdHJ5Lg0KDQogLUdlb3JnZQ==

