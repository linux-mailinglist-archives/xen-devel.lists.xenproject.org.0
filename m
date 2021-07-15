Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A05633C9AD9
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 10:48:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156494.288818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3x2Q-0004NP-Kn; Thu, 15 Jul 2021 08:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156494.288818; Thu, 15 Jul 2021 08:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3x2Q-0004KY-GT; Thu, 15 Jul 2021 08:48:10 +0000
Received: by outflank-mailman (input) for mailman id 156494;
 Thu, 15 Jul 2021 08:48:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FYFU=MH=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1m3x2P-0004KQ-8m
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 08:48:09 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.49]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb3736d7-d1b7-47c0-897e-1544dab8908d;
 Thu, 15 Jul 2021 08:48:05 +0000 (UTC)
Received: from AS8PR04CA0103.eurprd04.prod.outlook.com (2603:10a6:20b:31e::18)
 by AM0PR08MB4561.eurprd08.prod.outlook.com (2603:10a6:208:12d::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Thu, 15 Jul
 2021 08:48:00 +0000
Received: from AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::32) by AS8PR04CA0103.outlook.office365.com
 (2603:10a6:20b:31e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 08:48:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT041.mail.protection.outlook.com (10.152.17.186) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 08:47:58 +0000
Received: ("Tessian outbound b269bca6e298:v99");
 Thu, 15 Jul 2021 08:47:57 +0000
Received: from 0d00fb3b9e33.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8B287BC5-3F19-4738-8F58-9E9DFC541F4D.1; 
 Thu, 15 Jul 2021 08:47:19 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0d00fb3b9e33.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 15 Jul 2021 08:47:19 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PA4PR08MB6128.eurprd08.prod.outlook.com (2603:10a6:102:f2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 08:47:18 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d%8]) with mapi id 15.20.4308.027; Thu, 15 Jul 2021
 08:47:18 +0000
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
X-Inumbo-ID: fb3736d7-d1b7-47c0-897e-1544dab8908d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGaZbc2V2+MQgkWl+HlsG3dfLdDeP9IrPeXmfHHtr5U=;
 b=lY21i7dXMCQwnAce84D8VjWvAj28NcQMAq4dkvh+Kz/xjB7EVoRtshtNc9H3iNQ772uR/lf6LMywNbp17ONvVzHvMSk26/ZuY50IruzqaWW5qcig+nCzkSii0OcuHROJZbgIU1XEHX/wWUR2FkEbZ5HUBDWHlAuGjFrqtlQMfbc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d5649ad6b2abc74b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzopu85tpkh7CI0uxW0QV/0vftFZuqj9SBPlBW/7DenX5ei5xHwgVkxgQZeMrhNkRlwyZO5gB8gHlZdQkeOGX0cJX9GQCr0TPRTmjvis0IXPbfsuk1mWkNkyWohS2KNLekND/rk+XYKd7F+PkPGq0af/lZapLTbN5y33GWhqD5/4qK9hH6yQwb4H5wQUCGnU4lt4DEeXp0uj+gtVtb441hmeoPp9F/xG5WFCylugvIoeE6cyQtSvfzaBGtFEHm2iLCus1M9S7Ks5By91x8B1UpYLGflYk8M7wVYMGQMU7wZpnQ1wk/W+R8efe+Dbf4vUq/38CIWX5foe4vXyzwFTXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGaZbc2V2+MQgkWl+HlsG3dfLdDeP9IrPeXmfHHtr5U=;
 b=MMaDmlzXV/gLKdRjOIl7hGtLlNvDQJALiR8kd3j2+UVkCikGvu+aUb3c95IJwgXOK97nBZ64eQAV/Hq2hal9MAEn+Bjsq7hPjqBKxGjBEsZ3mQz8Ygp8zdyqUH5ptb/2ceYhcXIz5P89FYThKPvINZTBRuRaUs7DanOOfrRMB5gN3K0ycADyBMxrhgbCSZO3mI1HNa6nFsEuftEsCjT4j7ds9ofgC15XxaoMZiGbe1m0iJay0TD/E5rA+PJYUDUsFkQ2BJoIOLoeWtqTFCmKdTAmREZ3snL9jA11tGin6TThCOS1wVSjcXNuylgZ7SPXBVUlCEOAkeE0/tC8cfA/rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGaZbc2V2+MQgkWl+HlsG3dfLdDeP9IrPeXmfHHtr5U=;
 b=lY21i7dXMCQwnAce84D8VjWvAj28NcQMAq4dkvh+Kz/xjB7EVoRtshtNc9H3iNQ772uR/lf6LMywNbp17ONvVzHvMSk26/ZuY50IruzqaWW5qcig+nCzkSii0OcuHROJZbgIU1XEHX/wWUR2FkEbZ5HUBDWHlAuGjFrqtlQMfbc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "julien@xen.org"
	<julien@xen.org>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org"
	<wl@xen.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2] SUPPORT.md: add Dom0less as Supported
Thread-Topic: [PATCH v2] SUPPORT.md: add Dom0less as Supported
Thread-Index: AQHXeQrE43zpeLksDEud9U+EI8bv5qtDufKA
Date: Thu, 15 Jul 2021 08:47:18 +0000
Message-ID: <98B90F50-C5DB-46EC-A70A-BEB7B1E99EAF@arm.com>
References: <20210714234809.30483-1-sstabellini@kernel.org>
In-Reply-To: <20210714234809.30483-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.100.0.2.22)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2109d2cc-69de-422f-d915-08d9476d3f08
x-ms-traffictypediagnostic: PA4PR08MB6128:|AM0PR08MB4561:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB4561A16457BE035B9D83760B9D129@AM0PR08MB4561.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rkhJkRoeKkXPd6WezEV41ZDGRhAPeM+0Vwaq/OJQHBd2UZ8EmBX8QvVxe36V9f3ywk5HDPG+CTtHqiK2bZ+qbKIfeVFxeKG9JPrpdWKSnNKvbkOaSlobj318TEeniG1p6dKYMQ04ykTja4LqIpyCfdaqLZfTMl54jFmAFmy74CbHYp9W+IZuPqqQgq+zATspSbdg8TMFvrtboaPc2t5bdGKZH216srEzSV7WEIUkKMCUPioHytk0gvmdsUlHGiMA5tD7OUBmMZIcfsGMjaK7Puw7hI5+MF50WcuJe55OwzYvLzF0cKSVj+nFcWr3FugpAM0jRBTfYJJrd5nBZuh57llBG19Jit6Jyf+n1DrtrT5kt4e1h2/GdFPHZGmIIScoodMiznTrtHcat+SGqLDtPqUmMVPxtILg6DDj2gTpePr4jT89gjIEI1Qhb4pR8fFSlXa2ZC7zynADJnowpxxNBdR1qfO7otxu5bpUNN1qVUEjoF29ZooqgrmySGC+d6P8QVTiqWQ0Q5VLr6d+4d/ZH1gQT1bA5DTg/6Tb4n5vU4cuH/cmmw0eGgBIRQNNAbFDntYvJkLuU6B9n49NUtmHOglXc51G2QOmDFwCof7JPjUajH6zKrO9iN37qLkvdMSCIxfBUaJQhR+QqJ2jAo8+cqs+3ZsVGAoIZWKApeqtaDorN9gbLGqGw9r6VJUbwXHop4sdRO6yGejx1PNr2tKV/b26+PN8UOHse3kTYSiU+bgDJb7lNGws+at+agNy5h1S5MawFJYMzIbIL8pq22AIqg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(366004)(396003)(136003)(91956017)(54906003)(86362001)(2616005)(4326008)(76116006)(8936002)(36756003)(8676002)(26005)(6486002)(186003)(122000001)(38100700002)(6916009)(83380400001)(6512007)(478600001)(4744005)(53546011)(64756008)(66446008)(66476007)(66556008)(71200400001)(2906002)(33656002)(5660300002)(66946007)(316002)(6506007)(32563001)(45980500001)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Iwpv6i3KnQNXh0bwnmliATCpnHgvEcHKNFCI2Lp4OdMZ1PMmnInhTMvxdGWI?=
 =?us-ascii?Q?tIM2IXor0hAl3pHXOIQ8gPaRDF61zQIBKhgmmi1Mf0Yoh0S6XdEjS2TsotVw?=
 =?us-ascii?Q?ov0YBmGno80wXcesmn0PTOXqCj+MixBnPIA7j3Rp1rAvCO55xTUiD0rK063z?=
 =?us-ascii?Q?8k/ihWrqHRSxQFDttprW0tf7MaaBRAl9kElTBFEkQwplw+2YUfOpC0Ycnq6M?=
 =?us-ascii?Q?Q9U7lz1rG53xV7O/wev44EU2usljTzUJRsbgxG2MReVGoOWdtdZWGSDrjzUX?=
 =?us-ascii?Q?Ng3FApDzIm2JcPyIwLdaMpaMO+OZY4D0r8+F3DhsD7qidhKL/wA8y9N3TQI8?=
 =?us-ascii?Q?GOzNkwA5ytjFS0ZPQVFiOtr0PIVS8Iagoccx13GeutoDC424T5WLbMMRcGH4?=
 =?us-ascii?Q?ikaeiJ3gRg+8Qwz6KGaXzUDozRnYE0qJ8fbBIdZp5aPfIlYVtq/mlL525f0H?=
 =?us-ascii?Q?FaAmAyaqyJhvkk3zv3pv2dbar9ibJ/9FVZ49hc7ZDySg/ChwGDN0X/XSzBpS?=
 =?us-ascii?Q?osODmZ9gJzQgHmnlcGDVZQBMFacgz8y+5xVErYw9BYuGf7DRI+PwjcF+e7dY?=
 =?us-ascii?Q?Oos9zZgMt2/JiusroIlEG8YQDU3LlivN2ZNVYWMq7pslQGVUh6k7+dgMXbg0?=
 =?us-ascii?Q?PZerVu05qeiht/WCU7pVDO4H98InHKPpc6Il1ee0kou0fMxFEw9AuN+Yp7Qh?=
 =?us-ascii?Q?Im/cpwCbHLux1dRi4YQ37JwzzoAS+dij/4sz9QmvoFh++8IMBV5fkKipOmtY?=
 =?us-ascii?Q?gI4Rpi3xeeoCkKGAAR+He2Kl0gmrWjqsGfyfuUpxLSaw0rA3nUP+n+6xtv0O?=
 =?us-ascii?Q?zdr1xobEsg1phIWA60k9anLVa+D2ME3zsAyepORwQ7e418AHSCvS6V0AkYR1?=
 =?us-ascii?Q?bVtiMZAomr8q1PCptGc1RObyT2IeTR/T0itgqYj25YupklcQNdnaoOzyOQ/D?=
 =?us-ascii?Q?zUCibLHYC0J7DH61Cth3KckFnd5WwjwloJw6l1YMnRCSAUzL3BOgNCEfqNOE?=
 =?us-ascii?Q?GApahEQo0Hp+BE4JphcHahsRrhOas+w6yWT7/RhbObwOJPNUleWGRmeiSyzb?=
 =?us-ascii?Q?jft0nT6u7KhmK9HPzIPYhhBamw1b1IPKfvjW2BOl8wzfnlLlNrgp88WJp54G?=
 =?us-ascii?Q?pcCwR9ERvlvp358ud2iVDimJs6qsw55Q4UhZD1eqtWE8iu7VUZddUN3iJbvT?=
 =?us-ascii?Q?yOMQtYVjGJ6oCmT6Nj+wyrrl6NxNjy3+Ha7ZDCiVMx4sC9IlI8e2WHYb88RN?=
 =?us-ascii?Q?nNlrp7Fc3IC0MoATnlJyh0YjbUWCExssvzQX+CqTK0XlXI+GxUSznZ27/zua?=
 =?us-ascii?Q?Xc3l6gH8qqkPWIdCOHGfLIFb?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <08972FF66B1D9C4C968A9398FDC98A69@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6128
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	035a2129-5f70-4c9a-23be-08d9476d2782
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oKAiLRBpr2z2IXReRXk1mCofPQG+2Ly3h15QcMkxrj+S9jIxps4Zk8si9iY6ns5E4xJ975s8pzRH4Tl2SXAREUURYYWy5dQHF/OQCYExpw73NlW15jCE/sQW7ciNHs7SvDhSdu71jNBy8uu/7AbWtGc1lBHHMwhuL3bpCUlv5WJoj1gHRa+21PHiRBwVQj8vpQY9lbGEzbzsvGE7BrlI/2C0YPWJVF43fZDUnhZ6/ssHiTNQB3j8KNfsRV3SsspslbCqjNQyUmTuHZcuqX7NmO+6gZ3XsZHGeqBhhbf4rzcTQ5CK2QKHfdGSe1gu9Vz9ZnJazMzluLnHZilMQZQdDMl5wbOMsccDswJpHiXWWSPpji35SMUyjEKUaXXWu0gdgKvbXCMjlgwv9UBS72ANvx7lUVOXaRhTzMEAJdlZTq0E4rp6hQhRDt1mnXQINwhVjcfFIiyBDjTs2wIofMru0zAoblrx9vBOFI880rVgj9o9tA2iLrUQYvvMcq5MX/LV0iC9wJAQjTYFGQl71JyRuAM6DfyJJ40Kyc0lZKxVWYJ3Dd8dFAlZ0zg5jVy5TvsuYHBR+FeACwP++UrA/HuKldkxgVxM7cNvu840M87dn0jvxMQhKiH25Wg+zFiLrzf3ui73PzuNpTPQCFRO8o/B3l0jqJhPl5wcbzHjvV37XgdtgTWLGMCmFAHeb0XYfrim8mlJ2rHtjDso/JtkQJg2fKvSJFFfuaiJ+iiZCQm02EI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39850400004)(396003)(346002)(46966006)(36840700001)(2906002)(36860700001)(70206006)(107886003)(186003)(33656002)(356005)(2616005)(70586007)(83380400001)(4326008)(82310400003)(6506007)(86362001)(82740400003)(6862004)(81166007)(47076005)(8936002)(336012)(316002)(478600001)(54906003)(26005)(53546011)(6486002)(36756003)(8676002)(6512007)(5660300002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 08:47:58.3537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2109d2cc-69de-422f-d915-08d9476d3f08
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4561

Hi Stefano,


> On 15 Jul 2021, at 00:48, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> Add Dom0less to SUPPORT.md to clarify its support status. The feature is
> mature enough and small enough to make it security supported.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in v2:
> - clarify memory scrubbing
> ---
> SUPPORT.md | 9 +++++++++
> 1 file changed, 9 insertions(+)
>=20
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 317392d8f3..524cab9c8d 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -832,6 +832,15 @@ OVMF firmware implements the UEFI boot protocol.
>=20
>     Status, qemu-xen: Supported
>=20
> +## Dom0less
> +
> +Guest creation from the hypervisor at boot without Dom0 intervention.
> +
> +    Status, ARM: Supported
> +
> +Memory of dom0less DomUs is not scrubbed at boot (even with
> +bootscrub=3Don); no XSAs will be issues due to unscrubbed memory.
> +
> # Format and definitions
>=20
> This file contains prose, and machine-readable fragments.
> --=20
> 2.17.1
>=20
>=20


