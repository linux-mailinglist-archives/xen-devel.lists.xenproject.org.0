Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D24C3F2BAA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 13:58:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169485.309610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH3AF-0000al-H3; Fri, 20 Aug 2021 11:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169485.309610; Fri, 20 Aug 2021 11:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH3AF-0000Xf-DR; Fri, 20 Aug 2021 11:58:23 +0000
Received: by outflank-mailman (input) for mailman id 169485;
 Fri, 20 Aug 2021 11:58:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pH7i=NL=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mH3AE-0000XZ-B6
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 11:58:22 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.75]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9609146-01ad-11ec-a6a2-12813bfff9fa;
 Fri, 20 Aug 2021 11:58:20 +0000 (UTC)
Received: from DU2PR04CA0251.eurprd04.prod.outlook.com (2603:10a6:10:28e::16)
 by VI1PR08MB3806.eurprd08.prod.outlook.com (2603:10a6:803:b7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 11:58:18 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::50) by DU2PR04CA0251.outlook.office365.com
 (2603:10a6:10:28e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 11:58:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 11:58:17 +0000
Received: ("Tessian outbound f11f34576ce3:v103");
 Fri, 20 Aug 2021 11:58:17 +0000
Received: from 3e46764cd15d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BBBF144F-55B8-49C5-B73F-8EF76B5C8EB5.1; 
 Fri, 20 Aug 2021 11:58:11 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3e46764cd15d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Aug 2021 11:58:11 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB7PR08MB3403.eurprd08.prod.outlook.com (2603:10a6:10:4b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 20 Aug
 2021 11:58:09 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 11:58:09 +0000
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
X-Inumbo-ID: e9609146-01ad-11ec-a6a2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzmTUGknngJL0AS6h5LKJCtkJcSp2wujxJW8uX89Ocs=;
 b=oTwfwrcSpBQud7sx9I+8BHfu8cFDlEQVu5njEnDeUf8keNcEIKO0U9AHbGxSAB4OrsS49YG9UrELNKq9+ABEjSjyiaPdxUt7IJvPcRjqy3KvvhS79Dx5cbL4/tx6Q9gt+vPPlbp7mguRGxOUzunI2z8tPlPGGoNFs0F4I4waoeE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8ea2a575f05896e3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAFqxkA7O+WYJUFr9KKDQepWqwQGLoxy7i8dmLRLzCtFbTykPMrSeufx6jKB436s1JE9PgBdJmVe7wUsdUyNdv+78t6rfCePJdMYf6ggF9DY/mFDf0KzUyxjpSSu+QjC4KA4tjBUTvd+GvLI55v3iEFMDxfGMwZlLNVB7rHgcLMTMpUAIgHo6wtVLVmn4AGbnDLQdsBKMeIotXcO05etvu7jfwRambBZyO1FMwMfCxR1VX61c3oaV2qbStSuooc0FqceuGmG6VJ+bKKVI93E4+LjlMGQiG1vmfWSdD9c3K1FbeUESkM648ji4+w6RrLpyYJpy/pFjoXtBT8jKuotDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzmTUGknngJL0AS6h5LKJCtkJcSp2wujxJW8uX89Ocs=;
 b=Uxv0zn+44HDTJznBbvsGEyFJHju6V3cy4IDnQ27POkGihOLA+oWhd+ojV29ZSl1U7A4V8CePuB+9CYMSmaP5m0zg2WFBbPuHyTVoX/0DijvjmxiQGfFJbAVfuDch39FxW6delVT49+yy8/ZlHIu6TwZ9E5qRC79qGlUmIlKuYWLAF+/QV7E4R5jqr3grvvh3+3WIo8+dLYZjhTdReDiluq/diT64q1Oi3ANw5XVzft9T6Gfb084a8Q4tA3HYH3JRZwnar7WxiCw0o2uCNRLsOLRIlfvs889DlpdgaSGwhqFOkeSEKkfrNyXKxcbZWCjraIr/7gWdlED51U+p2aVHpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzmTUGknngJL0AS6h5LKJCtkJcSp2wujxJW8uX89Ocs=;
 b=oTwfwrcSpBQud7sx9I+8BHfu8cFDlEQVu5njEnDeUf8keNcEIKO0U9AHbGxSAB4OrsS49YG9UrELNKq9+ABEjSjyiaPdxUt7IJvPcRjqy3KvvhS79Dx5cbL4/tx6Q9gt+vPPlbp7mguRGxOUzunI2z8tPlPGGoNFs0F4I4waoeE=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 04/40] xen/arm: return default DMA bit width when
 platform is not set
Thread-Topic: [XEN RFC PATCH 04/40] xen/arm: return default DMA bit width when
 platform is not set
Thread-Index:
 AQHXjpsgsRofIZVQlECQrMelX8Mpkqt63vUAgADFfsCAAHazAIAACk/ggAAneICAAAox8A==
Date: Fri, 20 Aug 2021 11:58:09 +0000
Message-ID:
 <DB9PR08MB6857DA5109792DA1224FF9469EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-5-wei.chen@arm.com>
 <61893862-6b8f-9c1b-367b-7e0c837a43c5@xen.org>
 <DB9PR08MB68572A84F6A73644C4FE3F609EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <35fdd7c0-0607-e2b6-776d-adf9eea2c0e2@xen.org>
 <DB9PR08MB685782C02B95DB20F4E1626F9EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <ec9fcd88-5ea6-8e9e-f226-a818276887d0@xen.org>
In-Reply-To: <ec9fcd88-5ea6-8e9e-f226-a818276887d0@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F921F168A0DD2249B0E0338AADEEEC20.0
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1ea08b61-9709-4394-82d8-08d963d1cc7d
x-ms-traffictypediagnostic: DB7PR08MB3403:|VI1PR08MB3806:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB38063CE761CFAB6FFBE248A19EC19@VI1PR08MB3806.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /YRZ7/1zw4fly7h2BJXg9y95lQVKkxZf3ClkFmgwAJK8LNlttGO3Oug2wj6juYJQFQgvG4o2RXsk44uQd+bgMOr6gXiUJ8h8/uIpfhSPEt0EiLq5sx30KI2ICXp2lyLwpsrLnksaRazs9GoWTwCpEQ9u3jW7o9DA3AKM6rGYrtI21C80vHcs7WfkzJdM9+Cl5yNIJrsEc+xCNhDCFEvLDLayt4r7NWBFLxCkvmmf+iy5JuI2zYyeIdvQMFh1JJT5j/KYigPwT7i36ktuD4cRUrdvnCbTDyAPMyKeX/+gkdLSPNsstuWxqBGnGIj0clIdkDu6LHtWD04V+9zA0TaBAxkkoafsIcFaMg7Qr9M/TUA/PYxNMXOHcv6DtdciGp9hTvVhE8Nkct6QQIpOcWqBorE3dy/qdoeTlgB/RMN+qZpTpfEIngoygUBbQGV9EaNDzJ3hRKV437JMOCzsaTGIG1Fu/gj3Z0JN7IbjPOhXmleOkFY7yFr1D4iTMjdfW68BvMzZbKrvpD3CZ5oGe56tIY0Mb9L97YFcbxVNfJWXADe52QpuhbFmsO/oKJu+I/dJklp+PdShjfHep2j/rzP/qZnpQLepIZmCb6T/ppZZDGYkPwuITu1gt8UI/CLOdAG6KL3AjoA8CZ+YhN3okiu6H5qn6D+1RYSQtT+ypCXGjB8XgqiUZ9cnMHmQGGlcP4qs1yS9AXZCdFKoOiYqyr5l6Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(186003)(26005)(5660300002)(66946007)(38100700002)(7696005)(66476007)(71200400001)(9686003)(66446008)(4326008)(8676002)(8936002)(2906002)(83380400001)(122000001)(478600001)(110136005)(316002)(86362001)(55016002)(76116006)(64756008)(33656002)(52536014)(6506007)(38070700005)(66556008)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eGJqTVFTb2VHTnhWYlFpRGJDMVpSRlN4MkFhUktWd0VhOVpnZzkwRy83Y2ZZ?=
 =?utf-8?B?enZHYkZIU2hVaFZXQkxGdEVXZHVWYlNWQXZEZmlBaGMvckNRK2xqNmd5UGJm?=
 =?utf-8?B?RkFwN21kc1ZRRzRQVGdpUWoxK2dmckhBalZlWmRVWVVuME1Od2d6UWVhQzRz?=
 =?utf-8?B?QW5OUHErOXFRQXBVUFZ6TUQxTDdJVUo0aW5hY3JZdmYrMmhyRDNURWZYekNR?=
 =?utf-8?B?R2sySk8rUDZDMXZKZXlsUThIcy9pWDQ3YSswYy9QTlRjL0Irc0xoZC9xRnRG?=
 =?utf-8?B?RjJFWHQ4amNpQ0I5aHZ3NE9ta0M3azlRdytHTUswTlNQai9VT0ZhTXFOY1ZU?=
 =?utf-8?B?em9aMmQrZStOT2tsUVhKTmVhaUFyTFIwSm9YSlBJWWo5THZwK0Faa0ZwZFhC?=
 =?utf-8?B?L3A2MUYzSE0yNTNXZGY0VWlZc0YyR2FrVDE1ZUFDTU5zY3R5TmNNbUhpanpT?=
 =?utf-8?B?QjhRTk1yNk5mVWxQV2wwYkZ1d1JyWG9TWnlId1ZManYyQUdvcnk4SkgxaDc4?=
 =?utf-8?B?OWg3OXl3bTArK29KalUvaG5YbEpaaU5FTXlrK2s3THQrRHFoczIwOThEaCtv?=
 =?utf-8?B?TUlQejhzeGJkcmFWbkVoSTJkVDU0YmhYYlovRC9JTDh4QUhUc1pybGt0OU5Z?=
 =?utf-8?B?em5WUDlWMkp1WmVhaTlyRWpVMy9LSHJOUmdwQXhhNGl1aEFFL0VPV3F4Rncz?=
 =?utf-8?B?VUF4WXFYWGxMRGU1Q2NtaHdKL2x2SmxhS1NLTzUrbUtyMmhUbFZZdzRuNXFB?=
 =?utf-8?B?TkpkM1hjL2dqZ3crdXNmOEg5ZXVSZUJwOVFlWERaQUFhdFhUMmw4ejNXKzNM?=
 =?utf-8?B?bnNlcFg3MmNmb3dUVUJkVnhPMUNEajF2OXBMcW5DYzZ2OURjbDVibFFQZnlk?=
 =?utf-8?B?K0xVZG9uaFpBRzF6TUNDcjRKL3ZsMzBXTEhKZ3oxRmxYWFdPMVdrNk1UMEVK?=
 =?utf-8?B?VTd6ZjlrOGVuK3N6blhQTGQzK0xsVW9DUDcvbHV0UlBwdmNyQlg5bGlBZXVQ?=
 =?utf-8?B?MUl5OXJKMVFBVURFblNNYTUzY1NVdnA5d1RkMFozWEJvNTI1UHo5T285TmV0?=
 =?utf-8?B?cUI0dGJLNXpIQXVYaytKYW5ORWRjWUlZMllIRXdpY1VWSWNYQ2IxSnZ5dkJR?=
 =?utf-8?B?RVJBRWhQSXMvWWFTR2VDWDRWV01oZk5FZkVqcWxNYU9LaTdVeEV0enE2TDBY?=
 =?utf-8?B?MEREcWdrL1gwVjQxUFlmS2JrcU0xblBud3JzTEgyeWFUQWgvU2p3ZURLY3ZS?=
 =?utf-8?B?SEVPOGJubGJLMGJqNzkwMG5EM3hkOWROU0VNVHVsL2ZNaVM5ZXNSTlp2b0dE?=
 =?utf-8?B?ZDlVYXNDVG83V3pTSUIrVlVSRmh4aE9kNnhRUDVLY3M0U2ZCV1d6ZFJneVV5?=
 =?utf-8?B?RnN0LzgrY05KSElhcWFSNlJiVm5rdE9RNFhPenJtRDE3bTQxYjJzbEQ3ZjdZ?=
 =?utf-8?B?czVoRCtsVVBVM2RzQjRZMDU4SEpRQkhGN1V0azVJWG1RQ1JUOWFTajJsRDF3?=
 =?utf-8?B?Sm1oaTlkT1NQOW1MVXBqWDkwTWxiR2FPZDE2WlE3SW8ydTRuSDYvZUVIcnVI?=
 =?utf-8?B?K2Y5UmYwQVViVDhiRzBsd2QrM0hESWFRZ1RIcjhLNE5Benl1N0loUmdWaUx4?=
 =?utf-8?B?aUlzUG5YYTc4M01rTXMxVnBHYm5QQU1CUVhrLytKWHJpTHNhTkR5RDdXNWJL?=
 =?utf-8?B?eDJ1N01abjIxQjZScDR1b1U2OU13MWVnZFhySmt4bVkrQWs3Y2lESE1JMjhC?=
 =?utf-8?Q?W95Cxq1xC7M4Rb8moJqb61lB9KzSXd31vHi2RnU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3403
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	65e636ad-3e1e-412d-7131-08d963d1c77f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/aOyP9dsNpA8TLmlDqIjCkHXL9rfav4+yuvh3xiXHzRnvnD+Ja2+BGL2LwQtECtCX+oaqJaa6QCwFH3t/bJkaywvWdnxGVZkQTfFe0ns6sIpWmODZ42y95rZsrx8F1QCZ8JtfbruucNPxH0/hDNqkVOj0vxz6DhlKUe008fUDKvDQuwc3ARa5KeR6h7b0aeMOLA4d4Hl6Wkxl8dchRalRiwcKUvLYyRHi3ERxg1TJqw+zCWd+bMmGWGRb9h/vRnpuBuZbN24HGA0TNJ23dDZIoA+nV4IpSX5CQYZorNCsWI9aGa1doNUo/46pa/Y2Cz7+1sjjIWnhFMG63fKveEz47Kr4MoI2ABwo8Iu0DvC6dBNfWvku76Dxi54S3W8py88AX1yxsSEvQf/+fdjY9CvJ8z4XWpKIIh8BUXLcC/Gzv1iiuoVwK3kCEAnz4QNrujKk1NLwxQVZOijqJVvF6dn/UL5YbehPBr+yxwTi79sEoMgcmga9s9Mp7/8F2Gum26Cum/fzt4J4vuaPBjOqLDLEg9K6mu/LoACg1jc1hx3hNIiYRTUDVQiwQttOj87S1q88b7ecDz6TH3ImK2ygJi8cfGhpJjn8+iFnRQTOans7sz5ytGtRS/+LawhAr1VK6uU+qBuHsKqD0rCt9Fhl0xQI/3F034w7MNAaJ3MKQ7nqMabaXaw38HRSlWQkUNluQ5UGu5XhAgvMJhVnuqH3WqXsg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(46966006)(36840700001)(33656002)(55016002)(26005)(4326008)(8676002)(81166007)(316002)(8936002)(110136005)(6506007)(336012)(5660300002)(9686003)(356005)(478600001)(186003)(53546011)(70206006)(52536014)(36860700001)(82740400003)(70586007)(82310400003)(2906002)(7696005)(47076005)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 11:58:17.9648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea08b61-9709-4394-82d8-08d963d1cc7d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3806

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjDml6UgMTk6MTgN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBCZXJ0cmFuZCBNYXJx
dWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbWEVOIFJGQyBQ
QVRDSCAwNC80MF0geGVuL2FybTogcmV0dXJuIGRlZmF1bHQgRE1BIGJpdCB3aWR0aA0KPiB3aGVu
IHBsYXRmb3JtIGlzIG5vdCBzZXQNCj4gDQo+IE9uIDIwLzA4LzIwMjEgMTA6MzcsIFdlaSBDaGVu
IHdyb3RlOg0KPiA+IEhpIEp1bGllbiwNCj4gDQo+IEhpIFdlaSwNCj4gDQo+ID4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+DQo+ID4+IFNlbnQ6IDIwMjHlubQ45pyIMjDml6UgMTY6MjANCj4gPj4gVG86IFdlaSBDaGVu
IDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiA+
PiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1bGljaEBzdXNlLmNvbQ0KPiA+PiBDYzogQmVy
dHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiA+PiBTdWJqZWN0OiBS
ZTogW1hFTiBSRkMgUEFUQ0ggMDQvNDBdIHhlbi9hcm06IHJldHVybiBkZWZhdWx0IERNQSBiaXQN
Cj4gd2lkdGgNCj4gPj4gd2hlbiBwbGF0Zm9ybSBpcyBub3Qgc2V0DQo+ID4+DQo+ID4+DQo+ID4+
DQo+ID4+IE9uIDIwLzA4LzIwMjEgMDM6MDQsIFdlaSBDaGVuIHdyb3RlOg0KPiA+Pj4gSGkgSnVs
aWVuLA0KPiA+Pg0KPiA+PiBIaSBXZWksDQo+ID4+DQo+ID4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPj4+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiA+
Pj4+IFNlbnQ6IDIwMjHlubQ45pyIMTnml6UgMjE6MjgNCj4gPj4+PiBUbzogV2VpIENoZW4gPFdl
aS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+ID4+Pj4g
c3N0YWJlbGxpbmlAa2VybmVsLm9yZzsgamJldWxpY2hAc3VzZS5jb20NCj4gPj4+PiBDYzogQmVy
dHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiA+Pj4+IFN1YmplY3Q6
IFJlOiBbWEVOIFJGQyBQQVRDSCAwNC80MF0geGVuL2FybTogcmV0dXJuIGRlZmF1bHQgRE1BIGJp
dA0KPiA+PiB3aWR0aA0KPiA+Pj4+IHdoZW4gcGxhdGZvcm0gaXMgbm90IHNldA0KPiA+Pj4+DQo+
ID4+Pj4gSGksDQo+ID4+Pj4NCj4gPj4+PiBPbiAxMS8wOC8yMDIxIDExOjIzLCBXZWkgQ2hlbiB3
cm90ZToNCj4gPj4+Pj4gRnJvbTogSG9uZ2RhIERlbmcgPEhvbmdkYS5EZW5nQGFybS5jb20+DQo+
ID4+Pj4+DQo+ID4+Pj4+IEluIGN1cnJlbnQgY29kZSwgYXJjaF9nZXRfZG1hX2JpdHNpemUgd2ls
bCByZXR1cm4gMzIgd2hlbiBwbGF0b3JtDQo+ID4+Pj4+IG9yIHBsYXRmb3JtLT5kbWFfYml0c2l6
ZSBpcyBub3Qgc2V0LiBJdCdzIG5vdCByZXNvbmFibGUsIGZvciBBcm0sDQo+ID4+Pj4NCj4gPj4+
PiBzL3Jlc29uYWJsZS9yZWFzb25hYmxlLw0KPiA+Pj4+DQo+ID4+Pg0KPiA+Pj4gT2sNCj4gPj4+
DQo+ID4+Pj4+IHdlIGRvbid0IHJlcXVpcmUgdG8gcmVzZXJ2ZSBETUEgbWVtb3J5LiBTbyB3ZSBz
ZXQgZG1hX2JpdHNpemUgYWx3YXlzDQo+ID4+Pj4+IGJlIDAuIEluIE5PLU5VTUEgc3lzdGVtLCBh
cmNoX2dldF9kbWFfYml0c2l6ZSB3aWxsIG5vdCBiZSBpbnZva2VkLA0KPiA+Pj4+PiBzbyBkbWFf
Yml0c2l6ZSB3aWxsIG5vdCBiZSBvdmVycmlkZWQgYnkgdGhpcyBmdW5jdGlvbi4NCj4gPj4+Pg0K
PiA+Pj4+IGFyY2hfZ2V0X2RtYV9iaXRzaXplKCkgaXMgYWxzbyB1c2VkIHRvIGFsbG9jYXRlIGRv
bTAgbWVtb3J5LiBXZSBuZWVkDQo+IHRvDQo+ID4+Pj4gYmUgYWJsZSB0byBhbGxvY2F0ZSBzb21l
IERNQS1hYmxlIG1lbW9yeSB0aGF0IGNhbiBiZSB1c2VkIGJ5IGV2ZXJ5DQo+ID4+IGRldmljZXMu
DQo+ID4+Pj4NCj4gPj4+Pj4gQnV0IGluIE5VTUENCj4gPj4+Pj4gc3lzdGVtLCBvbmNlIHRoZSBv
bmxpbmUgbm9kZXMgYXJlIGdyZWF0ZXIgdGhhbiAxLCB0aGlzIGZ1bmN0aW9uIHdpbGwNCj4gPj4+
Pj4gYmUgaW52b2tlZC4gVGhlIGRtYV9iaXRzaXplIHdpbGwgYmUgbGltaXRlZCB0byAzMi4gVGhh
dCBtZWFucywgb25seQ0KPiA+Pj4+PiBmaXJzdCA0R0IgbWVtb3J5IGNhbiBiZSB1c2VkIGZvciBE
TUEuIEJ1dCB0aGF0J3MgYWdhaW5zdCBvdXINCj4gaGFyZHdhcmUNCj4gPj4+Pj4gZGVzaWduLiBX
ZSBkb24ndCBoYXZlIHRoYXQga2luZCBvZiByZXN0cmljdGlvbiBvbiBoYXJkd2FyZS4NCj4gPj4+
Pg0KPiA+Pj4+IFdoYXQgZG8geW91IG1lYW4gYnkgImhhcmR3YXJlIGRlc2lnbiI/IEFyZSB5b3Ug
cmVmZXJyaW5nIHRvIHRoZQ0KPiBzZXJ2ZXINCj4gPj4+PiB5b3UgYm9vdCBYZW4gb24/DQo+ID4+
Pj4NCj4gPj4+DQo+ID4+PiBZZXMuIEkgd2lsbCBjaGFuZ2UgaXQgdG8gc29tZSBuZXV0cmFsIHdv
cmRzLiBzb21ldGhpbmcgbGlrZToNCj4gPj4+ICJCdXQgdGhhdCBjb3VsZCBub3QgcmVmbGVjdCBz
b21lIGhhcmR3YXJlJ3MgcmVhbCBETUEgYWJpbGl0eS4gVGhleSBtYXkNCj4gPj4gbm90DQo+ID4+
PiBoYXZlIGtpbmQgb2YgcmVzdHJpY3Rpb24gb24gaGFyZHdhcmUuIiA/DQo+ID4+DQo+ID4+IFRo
ZSB0aGluZyBpcyBETUEgYWJpbGl0eSBpcyBub3QgYWJvdXQgdGhlIHBsYXRmb3JtIGl0c2VsZi4g
SXQgaXMgbW9yZQ0KPiA+PiBhYm91dCB0aGUgZGV2aWNlcyAodGhpcyBjb3VsZCBqdXN0IGJlIGEg
UENJIGNhcmQgeW91IGp1c3QgcGx1Z2dlZCkuDQo+IFdoYXQNCj4gPj4geW91IHNlZW0gdG8gc3Vn
Z2VzdCBpcyBuby1vbmUgd2lsbCBldmVyIHBsdWcgc3VjaCBjYXJkIG9uIHlvdXIgcGxhdGZvcm0u
DQo+ID4+IElzIHRoYXQgY29ycmVjdD8NCj4gPj4NCj4gPg0KPiA+IE9LLCBJIHVuZGVyc3RhbmQg
bm93LiBMZXQncyBrZWVwIDMyLWJpdCBhcyBkZWZhdWx0IHZhbHVlLCBidXQgZXZlbiBpbg0KPiB0
aGlzDQo+ID4gY2FzZSwgaG93IGFib3V0IERNQS0xNiBkZXZpY2VzPyBBbHRob3VnaCB0aGVzZSBk
ZXZpY2VzIGFyZSB2ZXJ5IHJhcmUsDQo+IHRoZXkNCj4gPiBzdGlsbCBleGlzdCA6ICkNCj4gDQo+
IEkgaGF2ZW4ndCBoZWFyZCBhbnlvbmUgcmVwb3J0aW5nIGlzc3VlcyB3aXRoIHRoZW0gb24gWGVu
IG9uIEFybS4gU28gSQ0KPiBhc3N1bWUgdGhhdCBlaXRoZXIgaXQgd29ya3Mgb3Igbm8tb25lIGlz
IHVzaW5nIHRoZW0uDQo+IA0KPiBNeSBtYWluIHBvaW50IGlzIHdlIG5lZWQgdG8gY2FyZSBhYm91
dCB0aGUgY29tbW9uIHVzZSBjYXNlLiAzMi1iaXQgRE1BDQo+IGRldmljZSBpcyBzdGlsbCBhIHRo
aW5nIGFuZCBjYXVzZWQgdHJvdWJsZSB0byBzb21lIG9mIG91ciB1c2VycyAoZS5nLiBOWFApLg0K
PiANCj4gSWYgdG9tb3Jyb3csIHNvbWVvbmUgcmVwb3J0IGlzc3VlIHdpdGggMTYtYml0IERNQSBk
ZXZpY2UsIHRoZW4gd2UgY2FuDQo+IGNvbnNpZGVyIG91ciBvcHRpb25zIGhvdyB0byBoYW5kbGUu
DQo+IA0KPiA+Pj4+IFNvIEkgd291bGQgZXhwbG9yZSB0byByZW1vdmUgdGhlIE5VTUEgY2hlY2sg
Zm9yIGRyb3AgdGhlIERNQSB6b25lLg0KPiBGQU9ELA0KPiA+Pj4+IGJvdGggc3VnZ2VzdGlvbiBh
cmUgZm9yIEFybSBvbmx5LiBGb3IgeDg2LCB0aGV5IG5lZWQgdG8gYmUga2VwdC4NCj4gPj4+Pg0K
PiA+Pj4NCj4gPj4+IFdpdGhvdXQgaW50cm9kdWNpbmcgbmV3IGZsYWcsIHN1Y2ggYXMgbG93bWVt
X2Zvcl9kbWEsIGl0J3MgYSBsaXR0bGUNCj4gPj4+IGhhcmQgdG8gc2tpcCB0aGUgbnVtYSBub2Rl
IGNoZWNrLiBVbmxlc3Mgd2UgY3J1ZGVseSBhZGQgI2lmZGVmIEFSQ0ggdG8NCj4gPj4+IGNvbW1v
biBjb2RlLCB3aGljaCBpcyBub3Qgd2hhdCB3ZSB3YW50IHRvIHNlZSAuLi4NCj4gPj4+ICAgICAg
ICAgaWYgKCAhZG1hX2JpdHNpemUgJiYgKG51bV9vbmxpbmVfbm9kZXMoKSA+IDEpICkNCj4gPj4+
ICAgICAgICAgICAgIGRtYV9iaXRzaXplID0gYXJjaF9nZXRfZG1hX2JpdHNpemUoKTsNCj4gPj4N
Cj4gPj4gLi4uIFdoeSBkbyB5b3UgdGhpbmsgd2UgbmVlZCB0aGlzIGNoZWNrIG9uIEFybSB3aGVu
IE5VTUEgaXMgZW5hYmxlZD8NCj4gPj4NCj4gPg0KPiA+IEkgZGlkbid0IHRoaW5rIEFybSBuZWVk
cywgd2hhdCBJIHNhaWQgaXMgaW50cm9kdWNlIGEgZmxhZyB0byBkaXNhYmxlDQo+ID4gdGhpcyBj
aGVjayBmb3IgQXJtIG9yIG90aGVyIEFyY2hpdGVjdHVyZXMgdGhhdCB0aGV5IGRvbid0IG5lZWQg
dGhpcw0KPiBjaGVjay4NCj4gPg0KPiA+PiBXZSBjYW4gZGlzY3VzcyBob3cgdG8gcmVtb3ZlIGl0
IG9uY2UgdGhpcyBpcyBhbnN3ZXJlZC4NCj4gPj4NCj4gPg0KPiA+IEkgdGhpbmsgd2UgY2FuIHN0
YXJ0IHRvIGRpc2N1c3MgaXQuDQo+IA0KPiBIb3cgYWJvdXQgcmVwbGFjaW5nIHRoZSBzZWNvbmQg
cGFydCBvZiB0aGUgY2hlY2sgd2l0aCBhIG5ldyBoZWxwZXINCj4gYXJjaF9oYXZlX2RlZmF1bHRf
ZG1hX3pvbmUoKSAob3IgYSBkaWZmZXJlbnQgbmFtZSk/DQoNClRoaXMgc2VlbXMgbGlrZSBhIG1l
dGhvZCB3b3J0aCB0cnlpbmcsIEkgd2lsbCB0cnkgdG8gZm9sbG93IHRoaXMgd2F5DQp0byBjb21w
b3NlIG5leHQgdmVyc2lvbi4NCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdy
YWxsDQo=

