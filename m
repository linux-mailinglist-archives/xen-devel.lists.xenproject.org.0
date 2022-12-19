Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AED6511D5
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 19:29:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466297.725177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Kt6-0003kr-0f; Mon, 19 Dec 2022 18:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466297.725177; Mon, 19 Dec 2022 18:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Kt5-0003hT-U6; Mon, 19 Dec 2022 18:29:19 +0000
Received: by outflank-mailman (input) for mailman id 466297;
 Mon, 19 Dec 2022 18:29:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w8L4=4R=citrix.com=prvs=3457a6caf=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p7Kt4-0003hN-AS
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 18:29:18 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09cd66c5-7fcb-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 19:29:16 +0100 (CET)
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Dec 2022 13:28:49 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5000.namprd03.prod.outlook.com (2603:10b6:a03:1ee::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 18:28:46 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.019; Mon, 19 Dec 2022
 18:28:46 +0000
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
X-Inumbo-ID: 09cd66c5-7fcb-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671474556;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8xMDHeVYzIPHdKJHXHByguJU3U1VUdtoElhDpeX5Dx8=;
  b=iYv8j/hBhHrodz3FwtrdBiB9DM0Z+re3R1E3N+q0eeO/xIzG59BiUVE7
   mXGF6VYyJ5CXJWtXi1PRtjNn3stc9ykJBq7Ws6y2PNKS6hWnVu4R99zL+
   Ztia5njq7ZMSUKUgr7XdwihHsUXgrllvzei9vX4k8zTwZONESi9kUGz8H
   Y=;
X-IronPort-RemoteIP: 104.47.55.169
X-IronPort-MID: 88655139
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:w+ZHBKj4UM4Et9r2ixQrjBWmX161xhEKZh0ujC45NGQN5FlHY01je
 htvXGrQO6zeZmPzeIhybIS39h4D7JCAxoNgTQRqpH83Hn4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5gaPzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQzeBM9UTqsldvm0Y2RWu9IxcYMAvvSadZ3VnFIlVk1DN4AaLWaGeDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluGzYbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6RO3mq6Mz2wz7Kmo7BUccTwumr9iCshCPeIlCb
 BIN2gEcsv1nnKCsZpynN/Gim1aOowQOUt5XH+ol4SmCz6PV50CSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaOyIYMGsDbi8sVhYe7p/op4RbpgrGU9JLAKOzyNrvFlnY3
 DSivCU4wbIJgqYj1bi//F3BqyKhoN7OVAFdzh7MQmuv4wd9ZYikT4+l817W6bBHNonxZlucu
 j4CksuX7uELBLmMkjCARKMGG7TBz/WILjzax0JuFp8J9jKx9nrldodViAySP29sO8cAPDXvM
 EnavFoL4IcJZSX7K6hqf4i2FsImi7D6EsjoXezVadwIZYVtcAiA/2dlYkv4M33RrXXAWJoXY
 f+zGftAx15BWcyLEBLeqz8h7IIW
IronPort-HdrOrdr: A9a23:KH3XZaO1olYqTsBcT5j255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKRyXcH2/hqAV7EZniohILIFvAu0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrjVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUySw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yfT9aw+cyDpAVr4RH4FqjwpF591HL2xa1u
 Ukli1QevibLUmhJ11d7yGdgzUImwxelkMKgWXo/UcL5/aJBQ7SQvAx+76wOHHimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KYuZtNkIPkjgZJq3PoiFXluYd49NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BH46WuonJrtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9ES8qqDW7GRw7KLQupUB/aPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CES19cvX5aQTOYNSRP5uw+zvngehTPYd228LAu23FQgMyNeJP7dSueVVspj8ys5/0CH8yzYY
 fHBK5r
X-IronPort-AV: E=Sophos;i="5.96,257,1665460800"; 
   d="scan'208";a="88655139"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTwuSmGChsTtRC/ZxbtnUhJcUtMhsEp0HBvOFAgT/SrMzIN/6vUC34qgglB207Xtg8IrAyW8uFfyVrLN7ve9qFpeqmy/+Ezfo115xcGqC1gcPehmogyb9+xdWXJJ/XXb1IA3ix5SeiFUC/u3lFV/9/qbLBg26+WZzQQUkFsS/MbEAr73PZmXjX+wROaF5/d/fqqUQ/pdcI+9CJ/R0OR0AdZ2cB7kYEFEmf3jqXlaF1z8H8nSXxV5HsMIc0IFde2TSTZS093UTuIZluKhLrltjUtW5ZbdAJT6PccFpkhzFa4S4oSRZ9uL4IfKLdkore9KfkDhISHeIAVWiQh8y7A0/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xMDHeVYzIPHdKJHXHByguJU3U1VUdtoElhDpeX5Dx8=;
 b=j/AXKjxsoVVi9J6vPDMqgstvAderqCIY8mYArnf7JHn7FXSW/bqKDhdTW5+n60vJwxf1dfU62LGx4wqVczHGwwk8LfeChdzfqrd1nIQdlvrObtq6KURWOulZUqr8e+U3eUXq4jZG48pwsYWm15X10rQPO3CQS42OMjkGFPi9mQO0rlEkOnhi3XvfyAB2bYYpr6GXAZoaEs/5UAkcVswQcEGLcl04cGn4d4zUloUb5Ldwg2blRDjpXnFGXP11KEJZJhym/zdPoyMJC8HZrvH39sGP2ZxydXheSvvL2ibZBsy18F7Y8lnEnGwGNWz2/z2EDRN66TZkPelwS4dvcKttkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xMDHeVYzIPHdKJHXHByguJU3U1VUdtoElhDpeX5Dx8=;
 b=UpsGS0tmS7TcEzwoYSByKqcoTTSyVbxk9dRjfZP9qWqeFYp6+ebbLJFXGh3gVL93iQU8pHvjojiGBZ36Ll7Aa15LPiVgKaUUfOEgn3ULUPSGcl3ypfAWvEP465xphqsWj9nC/CBwFBd86h2lB72qemcvTJfzeuNHwLxxM3jxyG0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [RFC 0/7] Proposal to make x86 IOMMU driver support configurable
Thread-Topic: [RFC 0/7] Proposal to make x86 IOMMU driver support configurable
Thread-Index: AQHZE3QW0AvNHREoGky0Qoqa2T8E6a51iI0A
Date: Mon, 19 Dec 2022 18:28:46 +0000
Message-ID: <4b45cde3-52e1-15ae-7b6a-84c0d5141cc9@citrix.com>
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
In-Reply-To: <20221219063456.2017996-1-burzalodowa@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BY5PR03MB5000:EE_
x-ms-office365-filtering-correlation-id: e96bc986-075a-495f-0d87-08dae1eeddc5
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 e5SXzomdbpX0CKho5kup1E2d7EkjChDXxPp30g3BsNLKdGMrHmll2z58lFrNdAUeerPrzEJ/uhC5NxCilZAwXWPMZNV5+D/jsl4PB2BUaJSzW8e8EcIPGacTIo9DxRgut8BI+Ow799WnHCLXiJBJSbpIN9GNI+q5oa2h1f/5bHzpkDoaOzSxAuxdlEgCGMGwfuWs1+2Jr+3CX9E6R3Ado9eQMMikqDRDbh4LoM0KBCHajWRQQIWv/a+INiHJfFeo6R3dBz1posoOYVxaToik5S6smP9JkKLiQ7Bsofk7/CFxL1BGxFXqC1a16QDBsqBnkec6h7k0pWmxhYC2wWOM9YNgRcQqfJLi8QHsV8PWEw5EzsHpT8ULlxsi9W6Fct/9maWzbCj15GnGZVWOPZ0yFv+9XwoWrOXTU6Ub/WelrHQh29HGeQ0O5IV3imYPSYW1B4c9Jj7Nujc/meYX8PRYn7JYy/swTaDEu34jZX3zicO96pxhxmwsidwKjD6hA6ODqairbs12fHQjlrwjyXRzMVseNC15WLOsdDwOOjrwfwcuhQsH71PcLPJrmYFxTakdWjP1/kuaphq3l1RdQWgP+hdV+x6QDUeVdKJwvkcp1ZWcWsMCwyL8XWt6B+b71zzYUU/etGxhgVEqbKsAJOi4Vrys0HeoCM+yOxXZKvya3IfcMYwke4oH13hFRmSZho2gpD780Mw5bnY5xeER/j5ReXWLtbyq+Nd1cRQm7RpMlvszbiRO1owigY98fuZfea2skqjOClYT/FCFPEbBFKfCeg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199015)(2616005)(86362001)(31696002)(122000001)(38070700005)(36756003)(38100700002)(82960400001)(8936002)(316002)(54906003)(66446008)(64756008)(66476007)(2906002)(110136005)(76116006)(66946007)(66556008)(8676002)(7416002)(4326008)(5660300002)(31686004)(91956017)(6512007)(186003)(26005)(53546011)(41300700001)(6506007)(6486002)(478600001)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TkQwaXpLVjhQdFdqREEyT1JIWHlUQXRVZHRGRFpHc0E5ZnVaVjdlY2FJbUdx?=
 =?utf-8?B?allsSEczei93d1B0R09KSllpek9KVTB2Z1FjRlF4TUhPdGRJekEwQ3YzRGdV?=
 =?utf-8?B?OUlJeUMwTHdtb2cxczcyNHJUUG13MTVObWtmQ2ViQmx0UitpaWtqc0twQVZI?=
 =?utf-8?B?YVpIZXFjUnBnTmFwWFZuOEtxajlCOGtzRFVxOEFEZ3Rsck1XY014VmtIMjE2?=
 =?utf-8?B?MWZHdmo2TWZQWlgzT2JiNEh1c0UyL0pBMGU1QnVkR1I0UFBOTW9uc05rSFQ2?=
 =?utf-8?B?SHNqNldLT21vVU5ieU96V0dzVWJtQjNSS0xYVHQwbUhFSmdwSWt3S0VVT2Ji?=
 =?utf-8?B?dGxrRURyS0pBVVE3WXBoQTdRTUJkZnNiNjhaUGcvRktYTFQyN2NieDR4MkF2?=
 =?utf-8?B?RXh5Um5PT05ueHRTQVhiZEkzTXJoR0hyektlRzZNdkJwWmZIdDBsbjBMUnJJ?=
 =?utf-8?B?S0tsck9GOUZKUytCR3htTkxYRTlmbkl0akcrLzNHSWh2NzEzZ09FREVDZEd0?=
 =?utf-8?B?OFl0aC9acENuQm1neCtrbEVwaW5CeHB3dGVPcFEvV0VmVzlMTWVDZm0wbjl4?=
 =?utf-8?B?ZTlOVlYvNGc3Q2dNd3ZUbUgyYVJYNURDMGsvT1NYRXhsdUZUSGZzeFN5VU5j?=
 =?utf-8?B?ZDIzV3NLOFo5WnJ3RlNMdlNwMXh4cG8ydWFoMUJKSEx1TzZpODQxUGdKa0FG?=
 =?utf-8?B?L3NXQlplMUxjMlZkUjVtWjVVQWk3V0szTERnNUkwa3piNU83SmQraGU4UitO?=
 =?utf-8?B?eUhDQVpybTY4YjBRT1lWYll5a0F2T0lFWUdkMCtuOFhJbTVrS3VtQVlQSW9m?=
 =?utf-8?B?MnJZejV6eVhqbTlqTGFCa0ZQL1lBZnJkS1NkVjJaZmErblRYeFJZRmUvMlVL?=
 =?utf-8?B?akdmblFGTHIyT2gxY2xiNTkrdFZ5NklEWUpmZExBMzZrWWlFSmM0Z283SFJM?=
 =?utf-8?B?cHVsR3dJNDg3aWhjYzI4eHhHZWNkT1NFNG8yRzJ1cTdoS0ZTVFBZZ0hka2g0?=
 =?utf-8?B?NlNKZXFKN2dkQUVOWU1HNHprbWpzRGVXcllrY3lvTzAvaGkvR0x3RURIYU5Y?=
 =?utf-8?B?VXQzaHZtSnRSSUU3d2hVVVMyS1F2c3k1QmNyNjBNVzk4QlkxeGFiQlFQVFVJ?=
 =?utf-8?B?ZEN5S0lSQWZwV3paa1JMMTJ2dUtZTTJvb1VNdXpIMUhQbXJ1SzJFcnkwelZT?=
 =?utf-8?B?TXJpN0RwN296cnRaMlZjSWU2SlRRTkYrS2NiZ2Uydnh2QXdrRGdxWlA3TXMz?=
 =?utf-8?B?ck1zUHFPQ1pGekJDaDVrNHM5Unk5bUpBZHlQTWtQbitvQzRUNURXOVpxUlVX?=
 =?utf-8?B?elJyMkpwYm5iSE9qUWRhOEFLbk5RUjVHKzZXSHJhUVlveFVUVkI2S0NBSHVP?=
 =?utf-8?B?Tlphb1AvdWhYUU8rQ0hDTW1jNnhZWmZaakFja3Fvc1A4dzZoalhJdSt1Q01U?=
 =?utf-8?B?N1ZodzhhdmdjdEM0L2w2NkdhajZkbFgxaHM1akZLb2cwSUYrTDRQeDFQMkd1?=
 =?utf-8?B?SzdOaGE4NHgzbjlqajlaTTZJeU9RMmQ5aVFKckhsMXJkSGR1MGdLV2orRnh2?=
 =?utf-8?B?bkJPbU43dEg2OWVGM1dobU9CbWN3dStRQVJEa0RsUlhueVZZQW1yRzZxNTVq?=
 =?utf-8?B?MXM4dTZvdTRCb1FjMjlCVFF4eU1aVUh3QkptWUU0UmtPdUxmS3Z2cnRYTVk5?=
 =?utf-8?B?ZXU4QnUyZEh2ZHZCNk1OZUNjNXJOWEhMOUQ3N1NtMmUxVFZnSHRUZmhtV1dJ?=
 =?utf-8?B?bC9yd2pucmdRMWtIak5MOEtkeHlScXNHdFVBR2dLUER0MEFkZXBqSHl4UGFa?=
 =?utf-8?B?VmwveDV5WWh3WHQyTXB4L2p3bEJmazMxRG1ZRjkxVm9kdDRQWWxVLzRHRGJV?=
 =?utf-8?B?M0xQc1ZRUHVRZHRZR2dJbXVDNkU0VG1ZTkI3d1dHc1FjUStTdlB4RVVFNjVr?=
 =?utf-8?B?U2N3T3VkQzJ4L2k1TnFRWkRwbnJuQVpCdG9NOWJnVUsza0dCOHFXazJkdVNK?=
 =?utf-8?B?anVkNG9IWkJsY0tKQk5Pd0tBWXNkNWdHRFlVaWVsZkRhUHIyTkx0YlRVb0Vr?=
 =?utf-8?B?Y21uREM1a0Rqc2Z0clU5V21iQUMrSFFqU3ZkcUhNeDM0VkxpSDlHT3ZhTncy?=
 =?utf-8?Q?lFZWrWG83v+q2Ow4aHyaNqdAk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1AD8836324B82240939E85A18EAF6311@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e96bc986-075a-495f-0d87-08dae1eeddc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2022 18:28:46.5022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j1R0QKFQPN8h5/bGMBwywUKMzptjdnOj7dqvnI4/h+TQoVyFJmHrVn9mefj4P7tWNp+l1oHUHcXyphO4tw7FXmOQ+Vr/5xpTetfiwO9lW8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5000

T24gMTkvMTIvMjAyMiA2OjM0IGFtLCBYZW5pYSBSYWdpYWRha291IHdyb3RlOg0KPiBUaGlzIHNl
cmllcyBhaW1zIHRvIHByb3ZpZGUgYSBtZWFucyB0byByZW5kZXIgdGhlIGlvbW11IGRyaXZlciBz
dXBwb3J0IGZvciB4ODYNCj4gY29uZmlndXJhYmxlLiBDdXJyZW50bHksIGlycmVzcGVjdGl2ZWx5
IG9mIHRoZSB0YXJnZXQgcGxhdGZvcm0sIGJvdGggQU1EIGFuZA0KPiBJbnRlbCBpb21tdSBkcml2
ZXJzIGFyZSBidWlsdC4gVGhpcyBpcyB0aGUgY2FzZSBiZWNhdXNlIHRoZSBleGlzdGVudCBLY29u
ZmlnDQo+IGluZnJhc3RydWN0dXJlIGRvZXMgbm90IHByb3ZpZGUgYW55IGZhY2lsaXRpZXMgZm9y
IGZpbmVyLWdyYWluZWQgY29uZmlndXJhdGlvbi4NCj4NCj4gVGhlIHNlcmllcyBhZGRzIHR3byBu
ZXcgS2NvbmZpZyBvcHRpb25zLCBBTURfSU9NTVUgYW5kIElOVEVMX1ZURCwgdGhhdCBjYW4gYmUN
Cj4gdXNlZCB0byBnZW5lcmF0ZSBhIHRhaWxvcmVkIGlvbW11IGNvbmZpZ3VyYXRpb24gZm9yIGEg
Z2l2ZW4gcGxhdGZvcm0uDQo+DQo+IFRoaXMgc2VyaWVzIHdpbGwgYmUgcGFydCBvZiBhIGJyb2Fk
ZXIgZWZmb3J0IHRvIHNlcGFyYXRlIHBsYXRmb3JtIHNwZWNpZmljDQo+IGNvZGUgYW5kIGl0IGlz
IHNlbnQgYXMgYW4gUkZDIHRvIGdhdGhlciBmZWVkYmFjayByZWdhcmRpbmcgdGhlIHdheSB0aGUN
Cj4gc2VwYXJhdGlvbiBzaG91bGQgYmUgcGVyZm9ybWVkLg0KDQpIZWxsbywNCg0KVGhhbmtzIGZv
ciB0aGUgc2VyaWVzLg0KDQpGcm9tIGRpc2N1c3Npb25zIGluIHRoZSBwYXN0LCB3ZSBkbyB3YW50
IENPTkZJR19JTlRFTC9BTUQvZXRjIGFuZCB3ZSBkbw0Kd2FudCB0aGVzZSB0byBiZSBzZWxlY3Rh
YmxlIGFuZCBhdmFpbGFibGUgZm9yIHJhbmRjb25maWcgdG8gdGVzdC4NCg0KU29tZSBzdWItZmVh
dHVyZXMgYXJlIG1vcmUgY29tcGxpY2F0ZWQsIGJlY2F1c2UgZS5nLiBDZW50YXVyIGhhdmUgQ1BV
cw0Kd2l0aCBhIFZULXggaW1wbGVtZW50YXRpb24uwqAgVGhpcyB3aWxsIG5lZWQgZXhwcmVzc2lu
ZyBpbiB3aGF0ZXZlcg0KS2NvbmZpZyBzY2hlbWUgd2UgZW5kIHVwIHdpdGguDQoNCklPTU1VcyBh
cmUgbW9yZSB0cmlja3kgc3RpbGwuwqAgVGhleSBhcmUgKGZvciBtb3N0IGludGVudHMgYW5kIHB1
cnBvc2VzKQ0KbWFuZGF0b3J5IG9uIHN5c3RlbXMgd2l0aCA+MjU0IENQVXMuwqAgV2UgY291bGQg
aW4gcHJpbmNpcGxlIHN0YXJ0DQpzdXBwb3J0aW5nIGFzeW1tZXRyaWMgSVJRIHJvdXRpbmcgb24g
bGFyZ2Ugc3lzdGVtcywgYnV0IFhlbiBkb2Vzbid0DQpjdXJyZW50bHkgYW5kIGl0IHdvdWxkIGJl
IGEgbG90IHdvcmsgdGhhdCdzIGRlZmluaXRlbHkgbm90IGhpZ2ggb24gdGhlDQpwcmlvcml0eSBs
aXN0LsKgIEF0IGEgbWluaW11bSwgdGhpcyB3aWxsIG5lZWQgZXhwcmVzc2luZyBpbiB0aGUgS2Nv
bmZpZw0KaGVscCB0ZXh0Lg0KDQpXZSBuZWVkIHRvIGRlY2lkZSB3aGV0aGVyIGl0IGlzIHNlbnNp
YmxlIHRvIGFsbG93IHVzZXJzIHRvIHR1cm4gb2ZmDQpJT01NVSBzdXBwb3J0LsKgIEl0IHByb2Jh
Ymx5IGlzLCBiZWNhdXNlIHlvdSBjb3VsZCB0cml2aWFsbHkgZG8gdGhpcyBieQ0Kc2VsZWN0aW5n
IENPTkZJR19JTlRFTCBvbmx5LCBhbmQgYm9vdGluZyB0aGUgcmVzdWx0IG9uIGFuIEFNRCBzeXN0
ZW0uDQoNCg0KRm9yIHRoZSBuYW1lcywgSSBkb24ndCB0aGluayBBTURfSU9NTVUgdnMgSU5URUxf
VlREIGlzIGEgc2Vuc2libGUuwqANClByb2JhYmx5IHdhbnRzIHRvIGJlIElOVEVMX0lPTU1VIHRv
IG1hdGNoLg0KDQp+QW5kcmV3DQo=

