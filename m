Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C74233B4C5
	for <lists+xen-devel@lfdr.de>; Mon, 15 Mar 2021 14:41:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98034.185892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLnSv-0005a4-M8; Mon, 15 Mar 2021 13:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98034.185892; Mon, 15 Mar 2021 13:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLnSv-0005Zf-Ia; Mon, 15 Mar 2021 13:41:01 +0000
Received: by outflank-mailman (input) for mailman id 98034;
 Mon, 15 Mar 2021 13:41:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3hl2=IN=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lLnSu-0005Za-1z
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 13:41:00 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c9cf899-bb8f-4669-aa58-80eacfbfd43c;
 Mon, 15 Mar 2021 13:40:58 +0000 (UTC)
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
X-Inumbo-ID: 3c9cf899-bb8f-4669-aa58-80eacfbfd43c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615815658;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RmDTRRT773a3FF+aRD9nWGNymyPgQV2shfmE2mJn5X8=;
  b=aSV/ZeXnrRlmXPPrUX0MI/YsNv54KWiKa0fHd5XAiAjQ9/3tKcqyV9iC
   jthWu9jYcGiPOmuVG7xCn7PQgAwMjzascBbfHDtY7wIPk9cN78OzzTnHr
   c8D+X59TXnG4ioUUOlREs5aqdMbyivRn3fIOJQkhiSMxUAg/R64h51J+O
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4r2foL93q6no+3cyxg//tdBpmb88CsnnyZ1YyNYAFSFU5KPQZaYU3PkBGbQaV4GTqWVo0wBmdk
 xHFstwKuMtb+L7m1YnpPKr6Ms4EHRcNcVb5rGoWRKQXwmC22QSkGD7e4N7bhre5KEFc4jxmGxu
 OIMU/EBnJM96Mf/yX41PCXKB6GUdy1vjBfT+QVikGjRFWtpwfgSlsVmIJyPXk9iG/+jF3Fi39O
 dM/G4ozdpkwtdevC+0NJH7v6wXkWOezm1SyoXRDFs635u8bMtIf6OdQ8DxRoMrKxyT8iZHow/F
 FkU=
X-SBRS: 5.2
X-MesageID: 39286645
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:l5uo8qn8gDY4e4ZgKBksaLh0E7bpDfK53DAbvn1ZSRFFG/Gwvc
 aogfgdyFvIkz4XQn4tgpStP6OHTHPa+/dOkOwsFJ2lWxTrv3btEZF64eLZsl/dMgDd1soY+q
 dkbqRkYeebMXFWr+bfpDO5HdEp3cWd/MmT6Nv24n9xQWhRGsVdxihjDALzKCFLbS1nIbZ8K5
 aG/MpAoFObCBcqR+C2HGMMUeSGh/CjrvPbSCULDRIm9wWC5AnAgILSKBSA2wdbbjUn+9gf2F
 LYmA/07LjLiZGG4yLbvlW8071m3P/a67J4b/Cxtg==
X-IronPort-AV: E=Sophos;i="5.81,249,1610427600"; 
   d="scan'208";a="39286645"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1phWj/2Q3Esd2vUtPmt/MqqxJTbWZbL99YQCa23IXurxG3k+3zSbyj36EHkSvcAb0323LhYN/wXptFMWagiJfA8AkODto7aV24OaTyIU6wKokUW1cHvXOnMoTJfLZPLihA7Q3xoWuZCNyNDWM8mZIbyjBZXIqmIXl1SFRTMCCIzoL8cBhXSb2t09iDvGwX+wGZ4PeTVP8siKKjE0rP12tia4mOPnOf1jQZ4QGE++bOOZNm3wrDGqiHlBejiUthZ7DMn0WlNqH415kdR/pZuMY1m/i9JUOLdkQFhRS7R6fybUmexocq11FBW3S/xwJujCqvt1rJEbz1J/T/6WBYn9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmDTRRT773a3FF+aRD9nWGNymyPgQV2shfmE2mJn5X8=;
 b=DY/DCGYKi7hh+uEuJ0R7aR34L452Yk0QYin4XeeOHmWvQdX6IXjwKr0H1MNSrIVOksQBuBJxweJ3JZjvrJnoP0caMm0HhyZHBdImw/F/l3IMM7NbHs6d7Z+eDc2YrNdZUT5AFTnWUTlCz8zRvKzKkAj77JEkuWFPXkgTx5q1yr9Q9RPBiOPGgdohxhLwCnKCvpbS8AvE171jGqqJCGVXrUm6MeFi/aE0Dn851BRocq6AnEoOXnd+zHhTp+lMx9Vvufwe2M08XAY4kNK2sqM+prCsVGUno4DWhKmLfIIAhXeV2KmlqJTAgyTCujk3Cs1WJyR7iw3/eOUg1wf42PpD2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmDTRRT773a3FF+aRD9nWGNymyPgQV2shfmE2mJn5X8=;
 b=Od5x45v5Liaz6Z4VwCucj+NOa7R769pPpjJk0kfqumC8ladndZYyTRt66s6S49NzGgjxhocG5A9LcYjativ8GLf971jS5pEP+lvrWTX4g5FLnQJYxXgxS/FAWCZnz21cp1siM3zoNArfC5n15vSVC5o4bZI2VivV9jOW3qXoujU=
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Community Manager
	<community.manager@xenproject.org>
Subject: Re: [PATCH 4.15 3/3] CHANGELOG.md: Glean some information from
 SUPPORT.md
Thread-Topic: [PATCH 4.15 3/3] CHANGELOG.md: Glean some information from
 SUPPORT.md
Thread-Index: AQHXFPObmjsak1n05US1KozduC4yDaqFE8uAgAAD7oA=
Date: Mon, 15 Mar 2021 13:40:52 +0000
Message-ID: <07E3E597-6E99-4591-BE73-737B59DF5E17@citrix.com>
References: <20210309145002.30359-1-iwj@xenproject.org>
 <20210309145002.30359-4-iwj@xenproject.org>
 <702645DF-2B40-42E9-95A3-11A8BF3E7E0C@citrix.com>
In-Reply-To: <702645DF-2B40-42E9-95A3-11A8BF3E7E0C@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99af2010-3190-458c-6c89-08d8e7b7f386
x-ms-traffictypediagnostic: PH0PR03MB5832:
x-microsoft-antispam-prvs: <PH0PR03MB5832A4485FAE8D5D30ECC59F996C9@PH0PR03MB5832.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tVm84epMHmFoDBqW4Hipx6XU7rf61Zm9dVH4Vk3i6XhIdpdZVPv1Pd1RJviPrBzLu6VKGkfVFn0hy9eIBlQVUqUu5AMrvnuQKmGQrOHP4HlLubTQfXm8neVVyO24nlVuM57KbG7EMfixq6EXFdtzJOg7Mvmawkk8R+fn1MQCyVsKlMNPwvZv2l8s2+HlqdHJR+s29pYjux/Te39/o4UbbWRyjzZueoeq9eIyVbI9SAyX86v0cnw/SgO6rcmtahNkXV7qckcfzM6I3y6napgRf/1bnIBeRI/lgoAwAEYib1yWNuBip+1A7hCdNRHMofSKbTWFHtJ6iuOTDORaJko/m4KmKGf5ibw/eGqGEA9i/4X7SPHjpma0mRADBBX1Ev6C81Y8NKGvISjKh0Xu+H+FQJe6HgdVtDl8DIF3OLnL7yICDw0z1bjhfSeF2dU0cmbj0VaXATTKfd5w/YhSCK2mk5gQw1oz+34PGoNNkp2RI9kvNkyv3Ahg3cYlhShJpbgRXGEoHdOFjzm0p0WY1Ox8ikseDKciTuKLwn6pFcEdOMh6gXfuhGg9VySwHhtd93p622fx5HPlZQNGgq1E0nZAVsGYGPi3EAkoyCU1Y9fxuZBmO5JeZH2jiZ3mwSDmMxXCdP+HjCRGkH1XKwdeOWjc9w65gN+oEg1e/5YpteDdJhdzLqJ5pTUZQ97QMx94uWkGWiEmcX0cEkAML09mhn30fPBTg8Y/FeorJw6K70jT2VGRaiQoVlnIqcTDI1vdGhrM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(2906002)(83380400001)(8936002)(66446008)(33656002)(91956017)(5660300002)(66476007)(86362001)(2616005)(478600001)(36756003)(8676002)(6486002)(6916009)(316002)(66946007)(64756008)(4326008)(6512007)(66556008)(53546011)(6506007)(76116006)(26005)(71200400001)(54906003)(186003)(207903002)(219803003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?bFh5ckNZQ2wvSnVYSFVZNlZWWTluZ3ZSWUhkLzY5TmxXdDhuZXc3ekpzVDFN?=
 =?utf-8?B?eWszemZPYlBYdmtOWjVxQ3BSTEMycFNET3FMeWZTeUNkeE5vd0NhLzVZRjRG?=
 =?utf-8?B?ek9XVmNzM2Z5NWQyMnVSdFlZM2YzSHBXZmluc21HdE9YdGFncjFySnNEbm1s?=
 =?utf-8?B?UjQ4UmI5ZW9OS2tzYXE0YUN4TGozZ2NCTXJWKzNqWDN4WitUVU1MRjdMVXB4?=
 =?utf-8?B?cmE0MzMwdDJHbEtLRTJuWjFIamZvL3Z1N0Q1Y0gxYnQ3Zm1pUndseTNlK09u?=
 =?utf-8?B?NnZVVkZoY1JEUDV1WHJQVmc4N1UxbWxSVWkxczZ1USt2NDNheFdIc1Y2eVpa?=
 =?utf-8?B?KzhiWmtBRmJqb1FUcHRtdy9SNFFRYTdKTHRGWENQVGE2cnVpSlo5ZVNja2ZZ?=
 =?utf-8?B?VXBXbTdYU1dtSXdYVVluSlBCRTlUNENVSzFBMURicUQyNlgyVmZVdXV3cXlX?=
 =?utf-8?B?b3B1cnovVllIMllrcFpnSlJ3MWJoUG5zU3dkSDFwM0p2eGgxTmpzWUkxZ2Vq?=
 =?utf-8?B?MUFzNm4xOFFRVVhucE52TUxGd0lGYndVWDIwWS96K1NpcDI1TXdJZko3cEdO?=
 =?utf-8?B?cjFReWV0TnFyRi9zaWVRM0JCeFhGQWRvUGVJaUZ4bi9XTm5xZnpudlRlTUsx?=
 =?utf-8?B?SEt4VGx0WUJvcUFudWQ0eGxCN1ZKQ0tTek95dDRhQTduYTdJWVIrNzkyK2lr?=
 =?utf-8?B?QkhxL0VYalErWlhyazBmY01OZlZEUTg0eU9JWFM2eWtPdExhZVB0VFhJeHE5?=
 =?utf-8?B?dVJDWE5kM1k5UFZpWFFLak90SVRxUTlrSmIydU1DS0ZTYUhVQk5Pbm9KRGhh?=
 =?utf-8?B?aDU5TGlmSTFtNlZaYlNwbmErUTNpT3B2OWl6aXpOZkxNR0lWK0pTRVdxZ3dY?=
 =?utf-8?B?QnpEOGQ0UW5Ta2Y4NjhNUWFha2Vya1REQmRJeTlJOHc4K1BsR0ZESFRYUE1V?=
 =?utf-8?B?bGRudzNUbzVUb2FYeDdxeVJTK0RwRndmZFdrYkZvN2pJSXhFMzVwWE1yUzQ1?=
 =?utf-8?B?c01GVWo0UEdJQjhoZTA2UktEZEZiVDFtMHhSNWN3Qk94K3ZmL3Zqb2RPNzNa?=
 =?utf-8?B?TzJ3MCtWMTlxNElQZHdIcE52STZlalZHRHVla3FrRjJNNXhaaG1sZDZjUjFX?=
 =?utf-8?B?Z3Q5Y0pONXFNdzJ4UFFRZ290eFluTXhOdmgwRy9lYzVoZG5HcGs3LzdFblBa?=
 =?utf-8?B?RndMbnE1eVdIcVNCbk9oaHVOa0JWdlM2a2IwWEdkbjUybWcreEZXQ1VyQ0NY?=
 =?utf-8?B?d0NwRXpXb1NwQ1RjWEgxMHVMeThiYVdCSjFYWE5DVHBRZHNvTUhWR3kvRTRu?=
 =?utf-8?B?UFc2d2pqZTh5QmRtc0hIem9oUzQ5RVJFWDlvQk5DVGtraUIyQWR0T3ZiRDZ4?=
 =?utf-8?B?NnJDSU5CcHFWaFRrTzhEZDFKMU9Xam5KTGFHWFp5aHZLemlmKzU4aXg4aXpi?=
 =?utf-8?B?ZnROdHh1OG4zMHhzb3hSSzVOTEYzRWs0dmIrMmcxdFg2aWN0MkhMWHUyZ3p5?=
 =?utf-8?B?K0VGNzVMOGVScy9XbzJJZ3NUeFF1a0tsM08yajdhSW51RDZ0cXdHR29QRG9i?=
 =?utf-8?B?YUxmaGRjd2JjN3ZaejUyTGg3SVdtMnpqT0w1ZVBwcjhuakNpMEMyUHllM0hC?=
 =?utf-8?B?ZnQ5K2trMGJuKzBBMk9Lci9ReVZwNU9SQ2RRV25qb3huU0hlR2xIZFgwa0k2?=
 =?utf-8?B?cDJQOWFBd3E3NFZWalljV09UamJjWDJZTGdKNi9qeStTSWVzQ1pyT1lDK1U5?=
 =?utf-8?B?WHc0QlQwZEZudEp2dFZnTFQ2b0Rjd21kRngyMW12ZWVUQmZTalZXbVQrU2N5?=
 =?utf-8?B?UG1sTlpZeUxzT2dxOERDUT09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <08F34D78830D334490EC327B0EDCC798@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99af2010-3190-458c-6c89-08d8e7b7f386
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 13:40:52.2863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dLX0l3OCYsHC3U0O9Inb3Fa4sNJbMZdn9cMWbMDTl5hWMVfIvYfsLerbpl2dy6yN2DBX29LIN7lufddHjJeuAu+PdjcDqEg0CRESYrv5DV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5832
X-OriginatorOrg: citrix.com

DQoNCj4gT24gTWFyIDE1LCAyMDIxLCBhdCAxOjI2IFBNLCBHZW9yZ2UgRHVubGFwIDxHZW9yZ2Uu
RHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gTWFyIDksIDIwMjEs
IGF0IDI6NTAgUE0sIElhbiBKYWNrc29uIDxpd2pAeGVucHJvamVjdC5vcmc+IHdyb3RlOg0KPj4g
DQo+PiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aXdqQHhlbnByb2plY3Qub3JnPg0KPj4g
LS0tDQo+PiBDSEFOR0VMT0cubWQgfCAxMCArKysrKysrKysrDQo+PiAxIGZpbGUgY2hhbmdlZCwg
MTAgaW5zZXJ0aW9ucygrKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvQ0hBTkdFTE9HLm1kIGIvQ0hB
TkdFTE9HLm1kDQo+PiBpbmRleCA0ZWNkMTU3YTM1Li5jY2RiYjgyYzJlIDEwMDY0NA0KPj4gLS0t
IGEvQ0hBTkdFTE9HLm1kDQo+PiArKysgYi9DSEFOR0VMT0cubWQNCj4+IEBAIC02LDYgKzYsMTYg
QEAgVGhlIGZvcm1hdCBpcyBiYXNlZCBvbiBbS2VlcCBhIENoYW5nZWxvZ10oaHR0cHM6Ly9rZWVw
YWNoYW5nZWxvZy5jb20vZW4vMS4wLjAvKQ0KPj4gDQo+PiAjIyBbVW5yZWxlYXNlZF0oaHR0cHM6
Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1zaG9ydGxvZykNCj4+IA0KPj4g
KyMjIEFkZGVkIC8gc3VwcG9ydCB1cGdyYWRlZA0KPj4gKyAtIExpbnV4IGRldmljZSBtb2RlbCBz
dHViZG9tYWlucyAoVGVjaCBQcmV2aWV3KQ0KPj4gKyAtIFhlbiBQViBkaXNwbGF5IHByb3RvY29s
ICJiYWNrZW5kIGFsbG9jYXRpb24iIG1vZGUgKEV4cGVyaW1lbnRhbCkNCj4+ICsgLSBBUk0gSU9S
RVEgc2VydmVycyAoZGV2aWNlIGVtdWxhdGlvbiBldGMuKSAoVGVjaCBQcmV2aWV3KQ0KPj4gKyAt
IFJlbmVzYXMgSVBNTVUtVk1TQSAoU3VwcG9ydGVkLCBub3Qgc2VjdXJpdHkgc3VwcG9ydGVkOyB3
YXMgVGVjaCBQcmV2aWV3KQ0KPj4gKyAtIEFSTSBTTU1VdjMgKFRlY2ggUHJldmlldykNCj4gDQo+
IE90aGVyIGdlbmVyYWwgdGhpbmdzIEnigJltIHNlZWluZyBpbiB0aGUgdHJlZSAobWF5IG5lZWQg
Ym90aCBTVVBQT1JULm1kIGFuZCBjaGFuZ2Vsb2cgdXBkYXRlcyk6DQo+IA0KPiAqIFN1cHBvcnQg
Zm9yIHpzdGQtY29tcHJlc3NlZCBkb20wIGtlcm5lbHMNCj4gKiB2bXRyYWNlIHN1cHBvcnQNCj4g
KiBuYW1lZCBQQ0kgZGV2aWNlcyBpbiB4bCAvIGxpYnhsDQo+ICogZ250dGFiIHN0dXBwb3J0IGZv
ciBOZXRCU0QNCj4gKiB2aXJpZGlhbjogQmV0dGVyIHZpcnR1YWxpemVkIElQSSBzdXBwb3J0LCBj
cHUgaG90cGx1ZywgcmVtb3ZhbCBvZiA2NC12Y3B1IGxpbWl0DQo+ICogeDg2X2VtdWxhdGUgc3Vw
cG9ydCBmb3IgQVZYLVZOTkkNCj4gKiBFeHBhbmRlZCB0ZXN0LWNhc2VzIGZvciB4ODZfZW11bGF0
ZQ0KPiAqIEhWTS1zcGVjaWZpYyBNTSBjb2RlIChzaGFkb3csIHAybSkgY29kZSBmYWN0b3JlZCBv
dXQgaW50byBhIHNlcGFyYXRlIGZpbGUNCj4gKiBoeXBmczogQWRkZWQgY3B1cG9vbCBkaXJlY3Rv
cmllcyBhbmQgY29udHJvbHMNCg0KTW9yZSB0aGluZ3M6DQoNCiogU29tZXRoaW5nIGFib3V0IE1T
UnM/DQoqIENJIGxvb3A6IEFkZGVkIFVidW50dSBmb2NhbCwgYWxwaW5lIGxpbnV4IHRhcmdldHMN
CiogQ0kgbG9vcDogQWRkZWQg4oCcYXJ0aWZhY3Rz4oCdIHN1cHBvcnQgZm9yIG1vcmUgZWZmaWNp
ZW50IHRlc3RpbmcNCiogQ0kgbG9vcDogQWRkZWQgZG9tMGxlc3MsIGFscGluZSBMaW51eCBkb20w
IHRlc3RzDQoNCkFnYWluLCB0aGlzIGlzIGp1c3QgbWUgdHJ5aW5nIHRvIGd1ZXNzIGZyb20gc2tp
bW1pbmcgdGhlIGNoYW5nZWxvZy4NCg0KIC1HZW9yZ2U=

