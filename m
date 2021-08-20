Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FC43F24D4
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 04:38:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169201.309086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGuPr-0001Ob-OD; Fri, 20 Aug 2021 02:37:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169201.309086; Fri, 20 Aug 2021 02:37:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGuPr-0001Lu-J7; Fri, 20 Aug 2021 02:37:55 +0000
Received: by outflank-mailman (input) for mailman id 169201;
 Fri, 20 Aug 2021 02:37:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ok5w=NL=arm.com=Jiamei.Xie@srs-us1.protection.inumbo.net>)
 id 1mGuPq-0001Lo-Ak
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 02:37:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.51]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d18b257f-febf-461f-8a03-3abd419c9ede;
 Fri, 20 Aug 2021 02:37:51 +0000 (UTC)
Received: from AM6PR10CA0020.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::33)
 by AM0PR08MB5505.eurprd08.prod.outlook.com (2603:10a6:208:18e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 02:37:49 +0000
Received: from AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::13) by AM6PR10CA0020.outlook.office365.com
 (2603:10a6:209:89::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 02:37:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT003.mail.protection.outlook.com (10.152.16.149) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 02:37:48 +0000
Received: ("Tessian outbound f11f34576ce3:v103");
 Fri, 20 Aug 2021 02:37:48 +0000
Received: from 2d1df6f0f05d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 091E933D-7AEE-48D5-8DB5-E85429623D26.1; 
 Fri, 20 Aug 2021 02:37:41 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2d1df6f0f05d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Aug 2021 02:37:41 +0000
Received: from VI1PR08MB3056.eurprd08.prod.outlook.com (2603:10a6:803:3d::28)
 by VE1PR08MB5182.eurprd08.prod.outlook.com (2603:10a6:803:10c::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 02:37:38 +0000
Received: from VI1PR08MB3056.eurprd08.prod.outlook.com
 ([fe80::a931:b3e8:a3af:3a67]) by VI1PR08MB3056.eurprd08.prod.outlook.com
 ([fe80::a931:b3e8:a3af:3a67%5]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 02:37:37 +0000
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
X-Inumbo-ID: d18b257f-febf-461f-8a03-3abd419c9ede
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAvuNKxVrhPRT3eSRcdXwaUSi1medwsmmT+OuBT8+6s=;
 b=G63gMmnhhk04YI605qT0y4tL4qMPyRa7gOSuSY6Ko5HEOXgeTqkOqmCjb/LUvNPZ+vl/blbqlRvwTQNM6C2bOL04nHbyueMDO49EaML+Ncgp/En0xJHMxud2Dr6WOVaeNi9ANTKdetftqhWFk+f2S3tAh7wHLDhhyErxU7c9XLM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFCSRBNM2CsXOHrk3hhZBg59hMWJ1mba4L5wbxEgXiVmIT1Pyt+msPGNfXJ9JW+eDPmmEPYPSSF+eOo0fYQNf9SI1FRRdp5k705i8kj/bTsAOnJFqFiqcBlN/1AFRTljmDyiWEwwhQy5nwCkJZ6DLkagtnAicGM4AWRp+Dl3eGnK4DPz7AzrT4kDkedQbPT1e89IgrInL8Hc1/u/ztAC5qk4s8aC5praeQVYURe7IPWs8x+DSoXa4KxJ2iCgETUJ/K7TbQm6QRyT0kpxl21Ngh8sbxOhmPqlOapzTvBxX+vVgWFdqyhMinzrg2Ccje8Q7FbV3madzCnk4PWEcWzLWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAvuNKxVrhPRT3eSRcdXwaUSi1medwsmmT+OuBT8+6s=;
 b=nIAUFJqNlbES6pbx1y0fjE0geLPxF3x8FaAqtwF49vku/+RnnEGbYiFtnDB20Xg2XVIqD0sxxAwZhrFCqEwgIL9TsrgYFnewIikogIggILeBmoyNoG+2SrmlpfNMNhZHjKGDIweioy2AuTV/OLtY3P3eMZD9ImBAJnMDMrBiVeiGB/K5puUjzZg9x9UI67ry21yENHv8kIyxK9MCgN3gJaLQ/si/h8fXKtFpIt1czjQWMxquKHZt5soH8k03Csd/7fInQBobq+MuJkeCJI6d2B87pXJu0OayOI9Bhq0gQXWhald0Y/RauNCdSsoOtMjg31PP3RVV7GRaC5dJhd9Izw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAvuNKxVrhPRT3eSRcdXwaUSi1medwsmmT+OuBT8+6s=;
 b=G63gMmnhhk04YI605qT0y4tL4qMPyRa7gOSuSY6Ko5HEOXgeTqkOqmCjb/LUvNPZ+vl/blbqlRvwTQNM6C2bOL04nHbyueMDO49EaML+Ncgp/En0xJHMxud2Dr6WOVaeNi9ANTKdetftqhWFk+f2S3tAh7wHLDhhyErxU7c9XLM=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>, nd <nd@arm.com>
Subject: RE: Some questions about virtio-net on Xen x86
Thread-Topic: Some questions about virtio-net on Xen x86
Thread-Index: AdeU5cKJ2Iuh63HAShmSu85qvWY46gAHv3OAABlQA0A=
Date: Fri, 20 Aug 2021 02:37:35 +0000
Message-ID:
 <VI1PR08MB305615C1E11535F9FB2B12CF92C19@VI1PR08MB3056.eurprd08.prod.outlook.com>
References:
 <VI1PR08MB3056C6F2FF2916207824CC1492C09@VI1PR08MB3056.eurprd08.prod.outlook.com>
 <YR5npyXm9SwZ8iMT@perard>
In-Reply-To: <YR5npyXm9SwZ8iMT@perard>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 65D8746AF9623843ACB5D23FEE97D35B.0
x-checkrecipientchecked: true
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 395ca941-3c80-4765-4a15-08d963837fd8
x-ms-traffictypediagnostic: VE1PR08MB5182:|AM0PR08MB5505:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB5505B52F7754E065629839F792C19@AM0PR08MB5505.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0gtyrziswkSe35UkeEKPrv1/WKgVy3E99N+Rba/Cx+VvunWmFlpT5gT5oHJ8ewNxJGMhBDqBj2aGCexuJ2hzAv7EuOeUPZwNB0TIX/BJsON2FkP75WOlPN0Bf7vtTcTXrPguGzQa9NbJd4iRivcpKingM+67gipN97vWSVV9QAqa0T3BM33RV5zqw15+Q33FlRC93n9mMXG8hzpEACpQI4RKfCo8VoAbelCwOKKAOCdvtMwreZ3VA89nDqDoSgDKtfmCRMW3QgACfoPmsm2yFpJxohSUp52zg+AmSlGCy/b3vwYv8M90vt2G1N3coQ9jMqxcxhBsC0XIr5VRNekWRMhYqalMvAbM+mrvpCopAEDzRlBbxpdOZTLYy2yaXcqZonrxwVVnvnRQl8NsoNaF882gkRpGxcLKa5R+E+nK5AMVPRvwzmRk5bzLu2UYnP9A02cY8iMwgiB33W7cdwpJ3KscSoch67EQ7rpSCIVBbsz6IVlU4X36j2GUFwmF/QyCXq8Jj0DqrITqyRBfy6g2+stjhqKKEpNe8D3xPrPe/9DLwziP9O+sJltpe7wCI8eoVwMjzBGZeJg3onaJxvGwaa68BI4dLQ8g7ikPah1HdtnhMNd5xw+PRw845itW4Nhy5PB9e5/Q/wYD4J+RysXRLU0CqdieMBKExT6hvFOR9j7uVdOBJ/NUTXWvossA/6UhGAtMLoiWtiz0kfHNa+6K0m0YIZn60icYG5M10x7uC+CKuSjx1NvdxEgM83A70ZywEk6CvTsJjzeR6OXr14t6MQJLf1xBqjfSB9uqGZ82JPE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3056.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39850400004)(4326008)(6506007)(54906003)(53546011)(55016002)(52536014)(83380400001)(5660300002)(71200400001)(966005)(64756008)(66476007)(66446008)(76116006)(186003)(38070700005)(7696005)(66946007)(478600001)(66556008)(26005)(6916009)(8936002)(8676002)(33656002)(38100700002)(122000001)(2906002)(86362001)(9686003)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?L0FDbjFDUVhONFdhWVkrK0hQZUU5RVhJb2hPblZQZm1yRThVRWJXc0Iz?=
 =?iso-2022-jp?B?ZTYwdkMzOG5YK1ZxODhacmIzTENYby9TTkR0bzFZK3AvRGpvcWxZQU9U?=
 =?iso-2022-jp?B?NU9RL3M3U2dtZmpUcVJBNFB1cnRXakl4OGRJMitWeHVRdGFrT3lNdE0z?=
 =?iso-2022-jp?B?NWNRMXgybkRRa0NSM0VuS2V5TWZtUU12T1NLYitPTVppVk5VV3lBc3Bj?=
 =?iso-2022-jp?B?Vm5UNlhabU9CUTF5YjFBZUNwRC8rakpIdmZyaE5oTkMwRXhxbWk0SjJx?=
 =?iso-2022-jp?B?NTM4eGV1UnBQK2V5N0FwTFJucUhaRDl6eTdQYjBUVk02a2VZOGszTFVq?=
 =?iso-2022-jp?B?VUN6Q3k5SHBVU0NrL05NbXRDTXQ2YmF1U2U2cEMvWFhFL2Y0cTBVTWhJ?=
 =?iso-2022-jp?B?MWJTN0Fla0RNazUwM2lodElsdUdqSXFhOXVaMklJTnAzK2tOQmZIQ0w0?=
 =?iso-2022-jp?B?dGRuU1p0REhqRlEyTW1tRndPZm16M1BRMjM2cEk4TE5nd1VJZXZZNVVT?=
 =?iso-2022-jp?B?K1pZOHR2a0lLaThaOTJKNTIyZENRNkk4NWthK0Z2TnBGaTh2cDhYODdX?=
 =?iso-2022-jp?B?UzZuRWVZNEZsQzlzN1NKUTlUMURjZ1FXMm52KzJMazl6a3gzUmszdTRr?=
 =?iso-2022-jp?B?bzRid2RnMURGN0pnQjZBMDF4V1BkTFQyT25USmN3WmlvNXpQSHNnUFZP?=
 =?iso-2022-jp?B?cFlsYTBRb3ZWaCtPdUFiZEFkSTVXcVNDbXZ5ZlNOcUZSYjN3OHZMR3pB?=
 =?iso-2022-jp?B?dDBnNXRwRlQ0bEYrRk9JREVEYU10NTMwekR5U1U1c3YvbkVCMWMrVTEw?=
 =?iso-2022-jp?B?UDQxZGQwN3dBaEtkWjhDN0xTSVg1RjIyaE5GSlk0NEtEMW5nS1lnQ2ps?=
 =?iso-2022-jp?B?azdSenR0MFIzeWg1SjFRc0IvMEZvWW1iVk1kS1ZxRGxFT014N3Z2OUhm?=
 =?iso-2022-jp?B?MnNQNkpTbyt2SkM0bm5GUGdxQnJjMDJkdkRqOXZ2STNSMWdid0VVNkRL?=
 =?iso-2022-jp?B?bTE5cENBK3dwWm0rY1k5S1NpTUUzdVdRZk15ejA4UkJsalNqSlZiYk1O?=
 =?iso-2022-jp?B?OEgvQmhwWFplbms5V1pPaXlMdkh1OXVUbHZ4QmNia0dCS1M3dDFwZVUr?=
 =?iso-2022-jp?B?R08zVVIwQ1BoRjQ5VkJOcmt2emJZQTNoNWhpVXRFKzlZRTV4RHZXZjBz?=
 =?iso-2022-jp?B?aGhxalVMVEtJWjlJQTBnNVpYd1NlbmhYQUYxSnBCUEVIU1ZtVXYrUFZI?=
 =?iso-2022-jp?B?OHpIT2VUeVF2eUY3MWZST2JyeWRZNTR1QlBZUEx5ZHREQmVPejZjakZj?=
 =?iso-2022-jp?B?YnZrVE9WVTVJV2xDRjE4aE1IZmxucllJcDFiSW9GbEZ3dHRieHVuMzhC?=
 =?iso-2022-jp?B?dmloUTlUKzlJTE1EVWE3QVJiUC9NTHJJQWF1VmROU2hweXZUdnhXZW5x?=
 =?iso-2022-jp?B?Z0syWjhobC9OSHg2cU9zM3pBZnZyR2t4RlpvL3RqT1daZDBQZlVPZWk2?=
 =?iso-2022-jp?B?S0Fld2JVQzdyMTB1R1cyYk1iYUdORGwyNmlvSGd5YUVFelR3bXBjMFpx?=
 =?iso-2022-jp?B?U2NQbm50Zng0dm5jekJ4NHlxd3VBVnArd1p3VzA3L2svMDJjKy85Vjla?=
 =?iso-2022-jp?B?UDA4emNOMWJhWFV4K1ZHamlSeWNYUy9KRDZUc2ZhanBJN2VZTVdpbEd1?=
 =?iso-2022-jp?B?NnpLV3dOUWVuZnhkdG41VFBMdDRHQlZCODk3RDNOL3JxaExwRE5tdG9F?=
 =?iso-2022-jp?B?ditnUXpXODJmTDhkQitubzVSdEdvM1RqWkc4RkMrTVFWQ2paSDl2N3Yy?=
 =?iso-2022-jp?B?NFhBdWV6SVRNcVVwMHV2ZXYzOENKQ1pjM1YxZlFEd2xUU3RQVnl6UmhW?=
 =?iso-2022-jp?B?eXJIT1ZjcFF4Tnd0b0h0OHNKRXVOZ2M0QnNpS2IvK2F5cURBemVZb3JF?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5182
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e23a7c89-a143-48b3-cc6a-08d963837922
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yABaIXb1kk85GIw7U38VSl/4IIPoDXKvY27kG0RJY9EH/jfHU3GKXsh+upVSyd3YTn6Ba1u+CpWllZ1GgDQO7Fenykaqd9y9uLjr4Tgkb55pfVRxsJIMb6Y8pkcHe6TvuthvoR6kCmgDUvidlEmAoRbSgflXp5sRWU9P96MeCdEjA4ac5BRbZCZyHT992rVcUW0IQOuOmqui5PHUQIqGroYwJQmBrplOwZmHLJY0fRt0MCT+xfbI/FZz7CDomQt+DbEozM66GZYUv2LVF5qcefi+woXfV+XPc/scJuRTJc8gAA3E876F+yKW+ANNIvX90EUj5Sj9lo0+TKej0nG1WX5vvYI+BlYNE+xFwrAau2lGw7fzPkAgmKoWp3FgW2XaJHNe78b7f6PmlnZ+97UKhtsckZujWEHLi4eKr86wC/j0q/3jU3B6R4ypz0MpkKrNK+qqSKVJukVTTlkBwSVdpacAiSNdB/d2r3bYv5nJoLgiMXg8TTJKGL9E9GJ0BznAtJ8uAH+lYzch+RpSL1vaVAPOBPyOQamKa6+hyvKL+/k089n+b8Zs83Q74Sf3yX2DM5UmAML11R7jlNNxdfMUrgmeqE6E3XBnD6w638He++HY1udKHLdzcP4gyQV4MaVTvsC+oHhuQEh4UsSMV2bRXGHusF93MuXWtV+D2hdRQ9pSg+Y0fxHj3XHUtfv4EW0JGdKD5l3RVfWKbvX6VcxpYR3NthUnj+vFe5nqy3mM3eTXvXYDkSSW5N1QMfR7rXz6QGr1SIgDXMA5DS2bZkqdGGxpaBXhPbjG4kicVdxjNhg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(346002)(36840700001)(46966006)(83380400001)(86362001)(55016002)(54906003)(33656002)(316002)(53546011)(26005)(966005)(8676002)(9686003)(70206006)(5660300002)(186003)(478600001)(52536014)(4326008)(82310400003)(6862004)(6506007)(70586007)(36860700001)(336012)(81166007)(7696005)(356005)(47076005)(8936002)(82740400003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 02:37:48.5822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 395ca941-3c80-4765-4a15-08d963837fd8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5505

Hi Anthony,

-----Original Message-----
From: Anthony PERARD <anthony.perard@citrix.com>=20
Sent: 2021=1B$BG/=1B(B8=1B$B7n=1B(B19=1B$BF|=1B(B 22:16
To: Jiamei Xie <Jiamei.Xie@arm.com>
Cc: xen-devel@lists.xenproject.org; Wei Chen <Wei.Chen@arm.com>; nd <nd@arm=
.com>
Subject: Re: Some questions about virtio-net on Xen x86

On Thu, Aug 19, 2021 at 10:38:49AM +0000, Jiamei Xie wrote:
> Hi all,
> I tried to run virtio-net on X86 machine according to the Wiki page https=
://wiki.xenproject.org/wiki/Virtio_On_Xen.=20
> And I Encountered some confusing problems.
>=20
> It seems eth0 is not virtio-net, properly a pv-net. I am really confused.
>=20
>  I have the following questions:
> 1. Does Xen x86 still support virtio-net based on QEMU backend?

Well, we don't test it, and the libxl toolstack doesn't really help getting=
 virtio devices.

> 2. If yes, is there anything wrong in my guest config file?

The wiki state that you should add 'xen_emul_unplug=3Dnever' to the guest k=
ernel's command line. (That would be "extra" in your guest.cfg.) I think th=
at will prevent the virtio-net device from been unplug, and so you will see=
 the virtio-net device in the guest.

But since libxl create Xen PV device anyway, you'll still have the Xen PV N=
IC, so two NICs with the same MAC.

I hope that help,

--
Anthony PERARD

Your answer helped me a lot, thank you very much. After adding 'xen_emul_un=
plug=3Dnever', virtio-net can work normally.
I can see the virtio net device with lspci command.
00:00.0 Host bridge: Intel Corporation 440FX - 82441FX PMC [Natoma] (rev 02=
)
00:01.0 ISA bridge: Intel Corporation 82371SB PIIX3 ISA [Natoma/Triton II]
00:01.1 IDE interface: Intel Corporation 82371SB PIIX3 IDE [Natoma/Triton I=
I]
00:01.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 03)
00:02.0 Unassigned class [ff80]: XenSource, Inc. Xen Platform Device (rev 0=
1)
00:03.0 SCSI storage controller: Broadcom / LSI 53c895a
00:04.0 VGA compatible controller: Cirrus Logic GD 5446
00:05.0 Ethernet controller: Red Hat, Inc. Virtio network device

Best wishes
Jiamei Xie



