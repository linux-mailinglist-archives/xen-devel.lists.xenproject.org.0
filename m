Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCA3357E62
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 10:46:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107077.204653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUQIC-0007D8-CS; Thu, 08 Apr 2021 08:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107077.204653; Thu, 08 Apr 2021 08:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUQIC-0007Cj-98; Thu, 08 Apr 2021 08:45:36 +0000
Received: by outflank-mailman (input) for mailman id 107077;
 Thu, 08 Apr 2021 08:45:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XAoZ=JF=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lUQIA-0007Ce-P8
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 08:45:35 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.47]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc5e7617-afd7-4840-a45d-248361f4705e;
 Thu, 08 Apr 2021 08:45:31 +0000 (UTC)
Received: from AM6P195CA0003.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::16)
 by PA4PR08MB6176.eurprd08.prod.outlook.com (2603:10a6:102:ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Thu, 8 Apr
 2021 08:45:29 +0000
Received: from VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::af) by AM6P195CA0003.outlook.office365.com
 (2603:10a6:209:81::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Thu, 8 Apr 2021 08:45:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT046.mail.protection.outlook.com (10.152.19.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 08:45:29 +0000
Received: ("Tessian outbound 4ee49f77c636:v90");
 Thu, 08 Apr 2021 08:45:28 +0000
Received: from 56eb2c4f45ff.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 888DEAE2-4CBA-4D11-A24D-266162649904.1; 
 Thu, 08 Apr 2021 08:45:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 56eb2c4f45ff.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Apr 2021 08:45:17 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB6042.eurprd08.prod.outlook.com (2603:10a6:10:20f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Thu, 8 Apr
 2021 08:45:07 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d%7]) with mapi id 15.20.3999.033; Thu, 8 Apr 2021
 08:45:06 +0000
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
X-Inumbo-ID: cc5e7617-afd7-4840-a45d-248361f4705e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYZ3yCgEnuXY/2/qF5qLs1x7J+PBf8WlWhcVPeoUUbc=;
 b=FnC3dNFgbo35P/3Ixx2k6oF0POmG0m795ih3MSHRV2BMYTZhygpN/Rzn2crYpWfijd69ANs0/x8jQNJxoxCOdfMuLEk7TEUij8NAG4Vr0h8HUMFfmVpMpgEAZ+DeRaNr/H5aySbC7SXXTYxAisTxDwfjM8kPiIZsO7wsoT7Q+CY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 163804443dcca45d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3o7M7bc8PKxLF0o7IZEj/EDaW3FhyujjGuR4UstQPodgXohfv5kN7NvWJlRuaT1dryqnodoJ9sZLiGvUXXBdRmcW9KVFTCNV5ghNogFsd9uHQTDcxlu0eeN9cffzFFzxV1t1KYo3d66aDYt7CxGldNCaF+lTGQ7eY/pQZgrDFQXsdHq1F9+d6xzlJ0QI4W4FZqJ18vnKqH5bm2ZWD/LK9U7pCt00MzaCdPzqp499y8IMPFH0tEHMDUySvxHLp7xN3Coc8Km4/LRU1PIiY7mMhNT7tW8JUX4orrIbG8UG3d5nexBKRp6VRW0VK6DfnlCjMnuds+/jFGLfToxLVYR1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYZ3yCgEnuXY/2/qF5qLs1x7J+PBf8WlWhcVPeoUUbc=;
 b=MLpI+4Ek0lsTX/1bOPn3nGdPxTuGh0FsVAU23CKI9WoF6gGLHOayggwaQ+GglIBMpNMCERwhC12NLApoS1nBMunM7oaZPN4TDiX4A5fkAzPy1p6D+kGvcTViuNfC8d0RYpSIYhvnuWBbu/Hpa1mdGQGl5RhFrpIX8E/Xh6zlAxwVjUg2y179hQXMyf9Z/H249tfWGn0aWfBhYpck7FPuqckjS24u2FKoAJKpc3u/gjn5ReF1/3EQiYLNb5OoZ/IKopLu/GkwJ/08iZWStItrGhSjqun9pwAe/cn6IO6cerTEILfH1joxZLGe7Q34w4VrSvRX0f/IFZibxt/MtTNB+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYZ3yCgEnuXY/2/qF5qLs1x7J+PBf8WlWhcVPeoUUbc=;
 b=FnC3dNFgbo35P/3Ixx2k6oF0POmG0m795ih3MSHRV2BMYTZhygpN/Rzn2crYpWfijd69ANs0/x8jQNJxoxCOdfMuLEk7TEUij8NAG4Vr0h8HUMFfmVpMpgEAZ+DeRaNr/H5aySbC7SXXTYxAisTxDwfjM8kPiIZsO7wsoT7Q+CY=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH 2/2] xen/pci: Gate all MSI code in common code with
 CONFIG_HAS_PCI_MSI
Thread-Topic: [PATCH 2/2] xen/pci: Gate all MSI code in common code with
 CONFIG_HAS_PCI_MSI
Thread-Index:
 AQHXKtnMgQfSb5EUJ0m5ImZxjYO+aaqniEaAgAAErYCAAA9rAIABv2eAgADHeYCAAC39gA==
Date: Thu, 8 Apr 2021 08:45:06 +0000
Message-ID: <479D17E5-3021-4A2E-B066-D179226CC48B@arm.com>
References: <cover.1617702520.git.rahul.singh@arm.com>
 <4471ba4fffc8a0cef24cc11314fc788334f85ccc.1617702520.git.rahul.singh@arm.com>
 <YGxsfdK9GEefLgAv@Air-de-Roger>
 <75848a0d-d060-6a8b-5ebc-7376ffc14af0@xen.org>
 <b0eb0833-50aa-d9a1-3265-3255970ef210@suse.com>
 <4ab1e7ed-cdf6-1b06-4f55-bbb981cade91@xen.org>
 <0071311d-6da5-636b-b823-32b5570d8f49@suse.com>
In-Reply-To: <0071311d-6da5-636b-b823-32b5570d8f49@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: cc2068e5-2aa1-4c9f-8c47-08d8fa6aa992
x-ms-traffictypediagnostic: DBBPR08MB6042:|PA4PR08MB6176:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB6176CF3D3201662215266256FC749@PA4PR08MB6176.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 U3oszGLkmzwp9yFVwNI6/YmjdYhtpTGCS4oeR4p8WX0zv9gN69MoGVjOwTOTh/xsmkbpb+yWU+NXwinAzRnp7rV4N6ARKHTbXOep5myXiQDCOZn8MCQuVHRN8dpWi3Uc7PgSTYDBYiI4kWj6HMasM0Y1alqHmqTP87J014svT3nFS6NT5HNcH8vB8gckiSykqVmPyD9M7eBv02ZgTIdT/evXyZH4abpZhAi/T8EMdyzpQ8Sg1BifUvLB1mgvpe1RYmjweaf3V1A8oGQon1qXY+gqFaZ5E4YTQuMP0ZSyfWSqVt0BBTWFtiqM94rIXfnZmri/I5j2H7PpmAjHGHEMExqYx/hCRD8/I9l+f6xDpWUpJHy0ku1LFhkYJrL2G24AxcN1/mPZdy3S04m2QPV8cXIjlfNj/jA2rfrm8+aYtz2pgNoZsLjxOmquSwyAMeBj8HKvghHkQ1+2bWyGUkggpcOAgWei5+ecC6/cdb47NBmAPwK02IntyrHolSu3McclgyvOAgYDXdCIZfl9LmOjEoPOV4R8eVsuLTO6xd9ivJQBAGuxjpTLrI2s213b9zru+dzvE4EnYprL3Z3N4CvlMqGjY2c433Gf5R+CXBimIx4t/9N74wQvfcDqKZR6tFzigtyFGMizp7fqUhu/SE7SnY0Y0LJ5mjaELxdTKWBSIHzRxlB5GYfrwe55UXZTafFV
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(66946007)(478600001)(71200400001)(2906002)(7416002)(64756008)(86362001)(66446008)(66556008)(316002)(54906003)(6916009)(66476007)(91956017)(38100700001)(36756003)(33656002)(76116006)(83380400001)(8676002)(186003)(4326008)(8936002)(2616005)(6512007)(26005)(6486002)(5660300002)(6506007)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?OUFwVUk2bmFTWGhybnJEUWlPOUhyQzhmcC9Yb1JiYThTWE9kRVp1MFhvazBE?=
 =?utf-8?B?M3RIV1NrckhETTFzSnZ4QzkxRWlnR1VxcmVRUTVTdjVyOGRlYlBGemFqL2My?=
 =?utf-8?B?ZUNTV3lCY0d1ek02TzdCbjlJV0hiWDB6MVl0a2ZsKzFobmEwOXdmdEFwMk92?=
 =?utf-8?B?bVo1dlZpelc5dVVMRmpMdFU0VktuNTBUMllKb2ROVzlJQllZTjY5bHdMNmZy?=
 =?utf-8?B?cmx6WGMxTDVUVEs3aW1yZi9hK0JkRUhUUlM2VUptRGdLWnNiRW8wRFpiZE92?=
 =?utf-8?B?c2s1SnB2cmpFTTBIYTF5ajAxa3dRMjJXQUp4dkJxcGMxTlVtaXMzLzYxNFJm?=
 =?utf-8?B?aGx5RXVGT1FITWlXbHRlRHJyYmpYUDN6MUIyc0pRY2ptRVpVWGY2NGFEczFL?=
 =?utf-8?B?V1FPZno4Wm55c0w3dWhGQ2JpS2N4ODRZZGp0TnJQejhBMHFwdFJ0eFErbS9n?=
 =?utf-8?B?akY0WlcrR1duaHdoWHFDT3pNSWRJY1FnSHRDbmhad05PNmNsbmVZZmdtVFYx?=
 =?utf-8?B?a3RvMmliL3VkUS9RUzNJWDQwMnJBQUVUN2txeXFCRjlVbWg5U2dTUjB0c3hS?=
 =?utf-8?B?SDJBQnUzenhDWGU3T0paWGVkcWYydXVWODU3TlJ1WHFYb29aV1hpRUt3Ui9I?=
 =?utf-8?B?SzNCQkJtSjFUWC9SNWc2MGJFdGFTWDVTZ1FFRktJUFZJYW9XV2dEUTNmNFB1?=
 =?utf-8?B?blFkRmZHSWxacmttZTRjLzlQdWZLVTBuei9pQlk4V1h0WS9rdDd6RVR4V0U3?=
 =?utf-8?B?eURnTy9ScEJjdGlkRDQ3NmRCcElFR0RRVHJmaFczTnFES0NFUkdYdFR1TlJv?=
 =?utf-8?B?RThkVWNPY2RTWnMzK3VXRGFveW90RUE5aGR6YTVuSFRpbWp4c0crTnZkMmFD?=
 =?utf-8?B?LzNYTUI2bFZGd2FtUitySE81Vk5ESGZWTHo1dTc4MU5CSjBTRURQR2liNVhF?=
 =?utf-8?B?VTNpQWNrMHRNQy9rQTFtNGFsVDlTS1NUL1dodmx3MTA4UW93eTZNLyt3ZE00?=
 =?utf-8?B?MVNzOXlJWjg2c3lYVDQ2ZzE2RU1CQU9vR2pWT3BpMzlid1oycEYvTHFJOXJR?=
 =?utf-8?B?VTdYMW96KzVkU1d1Vm1Qa2Nac01NYytQOUl6OWgyQVZXSUQvV3IxTlc5SytC?=
 =?utf-8?B?VTVqUmRFWlRkWUg4Yy83Ui90aTVGemZDRXhOQVhlaTU4akRSV1Mya2JEaUJD?=
 =?utf-8?B?WldmcU5IMHZGSk5GR28yRHlTMkNoWXFQdVlieUtFT215cUJOVXNCQlJabll4?=
 =?utf-8?B?T0lWQTdiZFpJUmtTRHpzVmtrbUpLdjMreWdYYVowVVVHUXAzMG5oWWd0OVhX?=
 =?utf-8?B?bkEycDNIbWdxanY3WmxraTNaTFl5MDRSUlh2Yi9Xei9HZ1A0M2NIVzlvQUk0?=
 =?utf-8?B?TXRuc1A3Tys3WlhCVU8yL2MzS2FQQVRGc2pMVXg4WkVzeWpiTVN4ZkJHVlBs?=
 =?utf-8?B?eGNZdGZrYytwMTNrR2cxVEE4b0htTk1oSlNULzJXNG5ld2I5dHVTYUhIWi9h?=
 =?utf-8?B?aC85R0hrNFJhNmZwb0dzT1cwTHhIaFJtU3Z4d29CSVZUSlFXWTh1d1hjZU93?=
 =?utf-8?B?a3hoWDFnb2szWURYbnpZeEp5djRKdFR4bE5COGJOTTRQKzVJY2lUdGFhZEpi?=
 =?utf-8?B?UnpWSkFLVXBxNDRyUlJnSDFMS1VjWi85NXF6VXlFYWg4MjlxanVvMUxGL09m?=
 =?utf-8?B?TGdBUTBBSjF3SWZ6LzZWNVhVL2NybVZrSmhMYW85MGFDczdvZzJSV1pkVGMy?=
 =?utf-8?Q?nAXrPQSBAHadRAPyMVloGC7UMeq3H+v3Cl6PHkF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E75EE26395BE44BA8B9FAB2D6524786@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6042
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1ba2fedf-fc76-4570-254e-08d8fa6a9c5b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FDlDi6X2LkBH0WEu+aOijCA+W57+eQ+JRQ73FUXxS9yKlGBeGYIVwmZIEf+TpPUTSC3rTUximQhrwBLCw0jxWKx/96CVHABdT9rYyf0OzxE1e1CJoeACR8mvkAUzq6I6441Y70DVC2L+E2j021ftNYv6B/y3X6EiENtRzzbKaU87MPLhMy6aNnPro6vj6pVsQNQ9bV5C3ukeS2mIK4kmVlyJY3vGFtK3ioNW8Pr8q/ry3WWVpYDzJxTxkI7mGupRmwjPQc/tPZqMrAndEctK0eQO9w4xxDEYG6xXW08sBqqk2TdGSksmpT5NQpW4GCPwhXJ3ysa28Ygl/k6MeQ/fZIFJQCkpi0/dvGZz6IXrWANL1wuBofz/ufT2rQsXoRyZ8HbYK46jjFIksXwLZ6aEXk01T39EZRPlCKWYPXu4mtZMSQ7uM1zF4XZaz/RFC3ZFKQAQuxxLrGfGIbxLTRkSO5viHb2p1Mjn0YK0L8yGnw/hcNf4GVZ1YE/TkxwXtEo+ddNL5rbH02GIdE5G394vxzO2NtnTdCO8Q5oECj19qq2j04zOb7mUqC7Ci5TAJGOVCu6cTHrBTFZPv2NjODJp81GSZj5Rep7vJscOs6xKVLz6fEL9p1yM0uc552Zli1osXWkdQXiInM8OwY8UHSREajHoaOo1rX3e6Lvv5yy4Tws=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(136003)(346002)(36840700001)(46966006)(8936002)(5660300002)(83380400001)(316002)(8676002)(81166007)(107886003)(26005)(54906003)(6506007)(336012)(36756003)(356005)(6512007)(6486002)(53546011)(33656002)(2616005)(47076005)(70206006)(86362001)(70586007)(4326008)(36860700001)(2906002)(82740400003)(478600001)(186003)(6862004)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 08:45:29.0026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc2068e5-2aa1-4c9f-8c47-08d8fa6aa992
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6176

SGksDQoNCj4gT24gOCBBcHIgMjAyMSwgYXQgNzowMCBhbSwgSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDA3LjA0LjIwMjEgMjA6MDYsIEp1bGllbiBHcmFs
bCB3cm90ZToNCj4+IEhpIEphbiwNCj4+IA0KPj4gT24gMDYvMDQvMjAyMSAxNjoyNSwgSmFuIEJl
dWxpY2ggd3JvdGU6DQo+Pj4gT24gMDYuMDQuMjAyMSAxNjozMCwgSnVsaWVuIEdyYWxsIHdyb3Rl
Og0KPj4+PiBIaSBSb2dlciwNCj4+Pj4gDQo+Pj4+IE9uIDA2LzA0LzIwMjEgMTU6MTMsIFJvZ2Vy
IFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+PiBPbiBUdWUsIEFwciAwNiwgMjAyMSBhdCAxMjozOTox
MVBNICswMTAwLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+PiBNU0kgc3VwcG9ydCBpcyBub3Qg
aW1wbGVtZW50ZWQgZm9yIEFSTSBhcmNoaXRlY3R1cmUgYnV0IGl0IGlzIGVuYWJsZWQNCj4+Pj4+
PiBmb3IgeDg2IGFyY2hpdGVjdHVyZSBhbmQgcmVmZXJlbmNlZCBpbiBjb21tb24gcGFzc3Rocm91
Z2gvcGNpLmMgY29kZS4NCj4+Pj4+PiANCj4+Pj4+PiBUaGVyZWZvcmUgaW50cm9kdWNpbmcgdGhl
IG5ldyBmbGFnIHRvIGdhdGUgdGhlIE1TSSBjb2RlIGZvciBBUk0gaW4NCj4+Pj4+PiBjb21tb24g
Y29kZSB0byBhdm9pZCBjb21waWxhdGlvbiBlcnJvciB3aGVuIEhBU19QQ0kgaXMgZW5hYmxlZCBm
b3IgQVJNLg0KPj4+Pj4gDQo+Pj4+PiBJcyBzdWNoIG9wdGlvbiByZWFsbHkgaW50ZXJlc3Rpbmcg
bG9uZyB0ZXJtPw0KPj4+Pj4gDQo+Pj4+PiBJSVJDIFBDSSBFeHByZXNzIG1hbmRhdGVzIE1TSSBz
dXBwb3J0LCBhdCB3aGljaCBwb2ludCBJIGRvbid0IHNlZSBtdWNoDQo+Pj4+PiB2YWx1ZSBpbiBi
ZWluZyBhYmxlIHRvIGNvbXBpbGUgb3V0IHRoZSBNU0kgc3VwcG9ydC4NCj4+Pj4gDQo+Pj4+IEkg
YW0gcHJldHR5IHN1cmUgdGhlcmUgYXJlIGJvYXJkIG91dCB3aXRoIFBDSSBzdXBwb3J0IGJ1dCBu
byBNU0kNCj4+Pj4gc3VwcG9ydC4gQW55d2F5LCBldmVuIGlmIHRoZSBzcGVjIG1heSBtYW5kYXRl
IGl0Li4uDQo+Pj4+IA0KPj4+Pj4gDQo+Pj4+PiBTbyB3aGlsZSBtYXliZSBoZWxwZnVsIGZvciBB
cm0gUENJIGVmZm9ydHMgQVRNLCBJJ20gbm90IHN1cmUgaXQNCj4+Pj4+IHdhcnJhbnRzIGEgS2Nv
bmZpZyBvcHRpb24sIEkgd291bGQgcmF0aGVyIHNlZSBBcm0gaW50cm9kdWNlIGR1bW15DQo+Pj4+
PiBoZWxwZXJzIGZvciB0aGUgbWlzc2luZyBmdW5jdGlvbmFsaXR5LCBldmVuIGlmIHVuaW1wbGVt
ZW50ZWQgYXQgdGhlDQo+Pj4+PiBtb21lbnQuDQo+Pj4+IA0KPj4+PiAuLi4gZnJvbSBteSB1bmRl
cnN0YW5kaW5nLCBtb3N0IG9mIChpZiBub3QgYWxsKSB0aGUgTVNJIGNvZGUgaXMgbm90IHZlcnkN
Cj4+Pj4gdXNlZnVsIG9uIEFybSB3aGVuIHVzaW5nIHRoZSBHSUN2MyBJVFMuDQo+Pj4+IA0KPj4+
PiBUaGUgR0lDdjMgSVRTIHdpbGwgZG8gdGhlIGlzb2xhdGlvbiBmb3IgeW91IGFuZCB0aGVyZWZv
cmUgd2Ugc2hvdWxkIG5vdA0KPj4+PiBuZWVkIHRvIGtlZXAgdHJhY2sgb2YgdGhlIHN0YXRlIGF0
IHRoZSB2UENJIGxldmVsLg0KPj4+IA0KPj4+IEJ1dCB0aGF0J3MgdGhlbiBub3QgImhhcyBQQ0kg
TVNJIiBidXQgIm5lZWQgdG8gaW50ZXJjZXB0IFBDSSBNU0kNCj4+PiBhY2Nlc3NlcyIsIGkuZS4g
SSBkb24ndCB0aGluayB0aGUgS2NvbmZpZyBvcHRpb24gaXMgY29ycmVjdGx5DQo+Pj4gbmFtZWQu
IElmIGEgZGV2aWNlIHdpdGggTVNJIHN1cHBvcnQgaXMgdXNlZCwgeW91IGNhbid0IG1ha2UgdGhh
dA0KPj4+IE1TSSBzdXBwb3J0IGdvIGF3YXksIGFmdGVyIGFsbC4NCj4+IA0KPj4gVGhhdCdzIGFj
dHVhbGx5IGEgZ29vZCBwb2ludC4gUmFodWwsIGRvIHlvdSB0aGluayB0aGUgY29uZmlnIGNhbiBi
ZSANCj4+IHJlbmFtZWQgdG8gc29tZXRoaW5nIGxpa2UgQ09ORklHX1BDSV9NU0lfTkVFRF9JTlRF
UkNFUFQ/DQo+IA0KPiBNaW5vciByZW1hcms6IEluIHRoaXMgbmFtZSBJJ2QgYmUgaW5jbGluZWQg
dG8gc3VnZ2VzdCB0byBvbWl0IE5FRUQuDQo+IA0KDQpPSyAuIEkgd2lsbCB1c2UgdGhlIG5hbWUg
Q09ORklHX1BDSV9NU0lfSU5URVJDRVBUIGFuZCB3aWxsIHNlbmQgbmV4dCB2ZXJzaW9uIG9mIHRo
ZSBwYXRjaC4NCg0KUmVnYXJkcywNClJhaHVsDQoNCj4gSmFuDQoNCg==

