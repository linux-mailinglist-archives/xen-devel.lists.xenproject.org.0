Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD660387424
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 10:39:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128938.242032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1livFZ-0005jW-Ks; Tue, 18 May 2021 08:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128938.242032; Tue, 18 May 2021 08:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1livFZ-0005hf-GA; Tue, 18 May 2021 08:38:49 +0000
Received: by outflank-mailman (input) for mailman id 128938;
 Tue, 18 May 2021 08:38:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2je3=KN=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1livFY-0005hZ-BL
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 08:38:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.42]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a8e0a57-e6e9-461e-a637-52adc889a80c;
 Tue, 18 May 2021 08:38:44 +0000 (UTC)
Received: from AM7PR03CA0026.eurprd03.prod.outlook.com (2603:10a6:20b:130::36)
 by PAXPR08MB6735.eurprd08.prod.outlook.com (2603:10a6:102:138::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 08:38:42 +0000
Received: from VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::a9) by AM7PR03CA0026.outlook.office365.com
 (2603:10a6:20b:130::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 08:38:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT019.mail.protection.outlook.com (10.152.18.153) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 08:38:40 +0000
Received: ("Tessian outbound 3c5232d12880:v92");
 Tue, 18 May 2021 08:38:40 +0000
Received: from 8fe6b0724967.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 56B87D00-7ABF-490F-AB35-7166F7AFDBC3.1; 
 Tue, 18 May 2021 08:38:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8fe6b0724967.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 May 2021 08:38:34 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VE1PR08MB5806.eurprd08.prod.outlook.com (2603:10a6:800:1b1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 08:38:32 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 08:38:32 +0000
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
X-Inumbo-ID: 4a8e0a57-e6e9-461e-a637-52adc889a80c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5j6DHPk3Onp8iMyaDnuhLbqdzju0oLU7p9yQyO0eueU=;
 b=uGKXmL4t4t1JHdeuyktKbwUIf3l5M3gQ5CRyrqZLiJuUmifxZdaJytVLq0OYY5NsEV0HNWRq1qAaetrIbWHHX6jrOwZT1V1lkWTrnd3i+tZR2YK/EPho1cRD7WaqWnlBROvkEalvWow46Ix2L25VExLenpuowonDfv0TaZCoPWQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4+X6FceKZ8EivGW2ivCi5OMpsof/SIM1TwNcogto8LXovz75tNBFhPqf2gjnd3Z1Ld6rHc/qRFdpZd3bkdZRQkhyqrIbDYyfG/4LEED9wlBgIv7hv7D1VcvtUCur6p7EPzmcs8wVOoQj7kTE32pQf4kUenDl+eM8YA3sPEYVDads92c+GI36WcD6dHJ0RwM5++obANlOL/yLYxOkYrqM08i7K+v3b5BdcbWiB7ZvmFiNEwGBd+iv3DVH2Jj1Ss7qhcxxYifvIlAGGMpOF6cbNYFcMkHgemdxIT3um35jno5HlwB8WFCL+rz7JT0kSKePU98WiIX8RTo60K2y4bBLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5j6DHPk3Onp8iMyaDnuhLbqdzju0oLU7p9yQyO0eueU=;
 b=ASJPiKj9A7CfQRF2S9y5jmTjF178ldhmSDTcgU4BXQi2+gwt7ndhjwGz3bAgHQ2qH7N831plro+/252O/spV90fHZjCBW/vZyV5ecy9O52BmRgHbdt0waWBOcHQcf0Ef6+BhIWWGRMTHaLeI3vWusDdk15RTIPi9LJn60n2gRdBD+VdOtsYsR7HhV9LKND6ex+o6AvGhg3tq3UvjWG1k8Yl0JEVKO2SrE8ylzXLkJSSUusO8T2syvRaUuj5dQ/T/j7XgOoY/XxQSzgA1W9jnj/l/HI7XHdHBtOmtgrn6H8nKA8YmaYILD8vPBIAg1b6MFywqVak5220F5Ju4NYeuJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5j6DHPk3Onp8iMyaDnuhLbqdzju0oLU7p9yQyO0eueU=;
 b=uGKXmL4t4t1JHdeuyktKbwUIf3l5M3gQ5CRyrqZLiJuUmifxZdaJytVLq0OYY5NsEV0HNWRq1qAaetrIbWHHX6jrOwZT1V1lkWTrnd3i+tZR2YK/EPho1cRD7WaqWnlBROvkEalvWow46Ix2L25VExLenpuowonDfv0TaZCoPWQ=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>
Subject: RE: [PATCH 08/10] xen/arm: introduce reserved_page_list
Thread-Topic: [PATCH 08/10] xen/arm: introduce reserved_page_list
Thread-Index: AQHXS6XFXoougD95T02cEJMQScUNQ6ro2ogAgAAQIWA=
Date: Tue, 18 May 2021 08:38:32 +0000
Message-ID:
 <VE1PR08MB521538CF7B0BFED3007E5D8DF72C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-9-penny.zheng@arm.com>
 <97bc6ca6-206b-197f-de08-20691578b9db@suse.com>
In-Reply-To: <97bc6ca6-206b-197f-de08-20691578b9db@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 63CCA8CC5CA50A43A763D68EEB432BF5.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 25284c61-d092-4605-bf49-08d919d856c1
x-ms-traffictypediagnostic: VE1PR08MB5806:|PAXPR08MB6735:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB673566B975E624FBA3816541F72C9@PAXPR08MB6735.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /IDu5btiWy+NA0oGPWtWCNDE4DyybBRJJYFVHAk/myOymmmSQUfzD1AAorTR4V49BUGAle0dDKTEUQNUqgOyw+lTv6NY+ig3sbZqr9KqrfQgI7iaJELPSvIGRgbhZmlkPqKL/l69X9mjtUDNLNAkWU8qsYlS08ZdhCCv7LqXSQuvFX2LiNECEDI22FjvoPBHgC2EPMWm4cZbUTjEBRqunGfqSMMcM9973V2QOQXDl4XKw5qhnKQhxPjbog2vSyWs2P4xw87LD7Vz2ze/60Z9x4OXEDH8yMh1+vK5f+/i+F9TaIh0MJRlXj7UjEZMabtROHiquJTUc21NV96c63+vw0KiOvXMZOLR6LRjufIprOS7fG1YBSamJV3Y9E+fs/91Q4QaOgxqYxEjSs45lt+uzNDlAI5Ega8xFRwXuAJuGMw9hlOIHoSLgHXL2gKW8sjaZt834gQOrHUf27CU+2jPyGukZWUKeZ2Yfl7SavuhGoet5ngt0Ed6wt7jyjVb8LgJpjoUuYSVZ3s6vyQogMai5xILxMlREon3mM3tpZELXGeANevHYax8gI1LNkCX9L+a8ckWLpvZBT2Z4JavFNv1PqGnyxMz2qI3KKKTkRCJUCU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(6506007)(53546011)(4326008)(2906002)(5660300002)(9686003)(86362001)(76116006)(66556008)(33656002)(55016002)(66946007)(122000001)(52536014)(8936002)(66476007)(66446008)(478600001)(8676002)(6916009)(7696005)(186003)(83380400001)(316002)(38100700002)(54906003)(26005)(71200400001)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?cVFVa05EbXVrb3l4MUJwSENYSlQzNit6U0I0T25DdDRpVlk0TWNWZWdESzE3?=
 =?utf-8?B?aThaclJ6VUZRTEFieVFhc0RSaElEdURocjR4MksvMGdMSHhuRzd0TlhHTytS?=
 =?utf-8?B?TnFvU3UyQWxBanl5Sjk4eXkxeGdtZTBuTEEzWlF6RFBEdEYxZG9qVEJRdFVJ?=
 =?utf-8?B?RWozbWtkZWc2Zi8zQ3hMaWFoekJ4ZElETWFUVGFyTVFEUUh6amV5VXZGL0hm?=
 =?utf-8?B?d2R3TmEvN3FKc1lKK2lqL0NPNXQ4em9yT1pQQ3FJLzRPc0l1UTB2U3lYdGQv?=
 =?utf-8?B?aHYvV3ZQd3dpSlJKamI5eG40SCtrZGZmR3k4eWNDcEFYcjZobDh4NWt0WjVG?=
 =?utf-8?B?Z0ZXNEV3aWNsbjVqOUc1SFo5QnNTTWdMM2hnanhDMkNxZ3BTYmtDR3BBMDU4?=
 =?utf-8?B?d3JTTjVreHJnVnRQdU1Dd0dkQXdqbWxhVitKb2NRdzRoYkpRbFZCOGtyOE5l?=
 =?utf-8?B?VnF1QUVSaVcvTUpGRzNjYjNZTEVPM1NMUVdzUC9jNml4cDc1NGlWK25LbkZW?=
 =?utf-8?B?UXU5U2xTYUxLWllHUy9pZ3lWR3pOTTYwNzUxSzF0VDZRajI0TnowSFEyeENS?=
 =?utf-8?B?bXZXMTI5Z05XYkZZSkhTOTFwV0QrVmJvaVk5dldxUldWS29rTnBWV2pGRmJr?=
 =?utf-8?B?MGxxUWcrbzRMMERlbEVVUk1nRmsxZXVtaXZPdVFZUzcreEduSVRVZVh1a2hi?=
 =?utf-8?B?MGVBT2NvTWFROWV4U001clhYT05leGo5SXh2WUxaR0Jsc0c2NlpQUGcyOU1z?=
 =?utf-8?B?REVGR0txTk4ySVBPS1h1L1VpbXg4S3ltZk9pcU9JbGFRRmNKVXBGQU9IRHly?=
 =?utf-8?B?YzcrWFhiTVNVR294dmczTmM2Yk9YVzBYNWMvRFU1YTZselFpU2d3MDJyTzdk?=
 =?utf-8?B?SEF5aWhiZFdZeDMyVXZDUk14Tm9wYWdORTJpYytrOE5OVzVjV0NDbldNWFJS?=
 =?utf-8?B?dGE4ZWYxeG1QUFY5c0pZTzRtMTdXWTNTRVo2aFFaS1Z2QmRkRTdCenNpWW51?=
 =?utf-8?B?TVl0Rjc1NjQzSnlmaXNNdjdTNkp3cjVDditpamdkeEV2ZFg2MkNRYkFaOXZt?=
 =?utf-8?B?aUpKSkZZNmFVSDJFeE1sVjVqZG45dUVEQXZtbFNVdkxzWWViVlEzNUhCMndu?=
 =?utf-8?B?SGxwOEk1YVRORGI4MllRbDhka3JHZ3R5VUxKUFhZR2VzUGo0MTlFQitXVkla?=
 =?utf-8?B?U2hpdlY3NFd6VDJuWWR6c3hZRDJVcXJSbG1rQ1NSbnlKMG14cE1oSzkwanEz?=
 =?utf-8?B?NHMzVWZtdFpRa25kK05JV3c3VDdhUWN0M29FQ2xoL2hGblFGOExQMjE3N1V1?=
 =?utf-8?B?bGY2L0U4NGl5RkRLT2IwMGoycDJJZW54MUhaaXBDMDVFM3ZiZDVYZCtpakdM?=
 =?utf-8?B?cVV0aVh0djJjdE9VK2Q3SHg1QzN6NTRTenBqZjdsaGpjL0hmaDZXZVVUSzNh?=
 =?utf-8?B?ekFqQitaS2swcXh0S2h1TVJVSy9IUHlUYlpCRXZDZVFaNElVRUpydXpkQ1Nk?=
 =?utf-8?B?Q1M3N2Y4WGg1NzQ0NVlQQW5nbllvQ01lR1Nnd09VK2R5ZDVpR0xMQUk2QWJC?=
 =?utf-8?B?YUM3a3B4VldUUUtTYXkxcjhsdVRXRHBXZVRsK0Z6b1ZjaFF5SDVCamhjZDZM?=
 =?utf-8?B?RGxLL0I4OEd0eUlWTzRiN0Evc254QU9XWWwwd3FBRU1VR1Y2dFMwTVVnZzlU?=
 =?utf-8?B?RDlhRzZTT2J1OWdCTzZnMjVrdllmTFNXeUJlQzRlZEVDcThIZ0hNVFR0ZlJN?=
 =?utf-8?Q?9ECli1Ny3llb52414oLSstnhR/7Y+5GT1Az7EFP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5806
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0dda64d1-f172-4aba-732c-08d919d85202
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SaXWRFO0guN59Y1VuyWmna3rhHfLKYkIHWozmhF487Lpxo7MP345+4w1RmxFsxD79zes76lJtMuCrFhvP6M9LYe+9CCX4YjYLzTtmgGIO25nkNDJ/AaaccrvP/ZiO5Jnh4U4ccSwcU9Ri+ROuv/WzRob2BGiJf9Xg0Yv1+oJ2iEKg3LGRECGew4rq6WInWN51dMir0fhXbM0r4Tq06wyWhSRTbGKBwOE+mYtXB4tKk4oFGmBriWtG4ZsUNtNxKNYwFBtuBCWXosibeXYrgdY9p/9ulKvx6pVgxc/mCeZqlaaMhAR6L9nXVSHqPeEArzMqYy7edWxRMaULiyGxs9Ixc8kC3hY0NuQTrWhWdfdW6/k/UKx7z9A8s+lgeRQPY33ZHj2GLbEN+TjLGpYJL7JWzHwa0xv62uAzzhj/ne0F4+IZ5zWgGc/5Z95FXE9FlNSc5GQgamdszTHcYYhjOZAWlNkpD1XCSNvxNQwOSevAtLsnMrrAveIKZA43XNpspGg5MqU0K9i4uzxKO/NR7HaaNSHgqxh8diZ29+7U4Osx/Cfdoxj6l0sxRaVlQ6z6lVVM6rA1jWnvj7bWdHOdeafQax9CRHinJ+01dRudfFewTddY5nqo2Qo2UAYy4lYhpUT6r2YZezMC681F+2A0Ri6Lw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(36840700001)(46966006)(53546011)(6506007)(8936002)(316002)(47076005)(2906002)(86362001)(8676002)(9686003)(7696005)(4326008)(55016002)(54906003)(82740400003)(356005)(6862004)(83380400001)(52536014)(36860700001)(336012)(81166007)(33656002)(70586007)(26005)(186003)(70206006)(5660300002)(82310400003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 08:38:40.7344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25284c61-d092-4605-bf49-08d919d856c1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6735

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMTgsIDIwMjEgMzoz
OSBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+IENjOiBCZXJ0
cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8V2Vp
LkNoZW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIDA4LzEwXSB4ZW4vYXJtOiBpbnRyb2R1Y2UgcmVzZXJ2ZWRfcGFnZV9s
aXN0DQo+IA0KPiBPbiAxOC4wNS4yMDIxIDA3OjIxLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBT
aW5jZSBwYWdlX2xpc3QgdW5kZXIgc3RydWN0IGRvbWFpbiByZWZlcnMgdG8gbGlua2VkIHBhZ2Vz
IGFzIGd1ZWFzdA0KPiA+IFJBTSBhbGxvY2F0ZWQgZnJvbSBoZWFwLCBpdCBzaG91bGQgbm90IGlu
Y2x1ZGUgcmVzZXJ2ZWQgcGFnZXMgb2Ygc3RhdGljDQo+IG1lbW9yeS4NCj4gPg0KPiA+IFRoZSBu
dW1iZXIgb2YgUEdDX3Jlc2VydmVkIHBhZ2VzIGFzc2lnbmVkIHRvIGEgZG9tYWluIGlzIHRyYWNr
ZWQgaW4gYQ0KPiA+IG5ldyAncmVzZXJ2ZWRfcGFnZXMnIGNvdW50ZXIuIEFsc28gaW50cm9kdWNl
IGEgbmV3IHJlc2VydmVkX3BhZ2VfbGlzdA0KPiA+IHRvIGxpbmsgcGFnZXMgb2Ygc3RhdGljIG1l
bW9yeS4gTGV0IHBhZ2VfdG9fbGlzdCByZXR1cm4NCj4gPiByZXNlcnZlZF9wYWdlX2xpc3QsIHdo
ZW4gZmxhZyBpcyBQR0NfcmVzZXJ2ZWQuDQo+ID4NCj4gPiBMYXRlciwgd2hlbiBkb21haW4gZ2V0
IGRlc3Ryb3llZCBvciByZXN0YXJ0ZWQsIHRob3NlIG5ldyB2YWx1ZXMgd2lsbA0KPiA+IGhlbHAg
cmVsaW5xdWlzaCBtZW1vcnkgdG8gcHJvcGVyIHBsYWNlLCBub3QgYmVlbiBnaXZlbiBiYWNrIHRv
IGhlYXAuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVuZyA8cGVubnkuemhlbmdA
YXJtLmNvbT4NCj4gPiAtLS0NCj4gPiAgeGVuL2NvbW1vbi9kb21haW4uYyAgICAgfCAxICsNCj4g
PiAgeGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgfCA3ICsrKysrLS0NCj4gPiAgeGVuL2luY2x1ZGUv
eGVuL3NjaGVkLmggfCA1ICsrKysrDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IFRoaXMgY29udHJhZGljdHMgdGhlIHRpdGxlJ3Mg
cHJlZml4OiBUaGVyZSdzIG5vIEFybS1zcGVjaWZpYyBjaGFuZ2UgaGVyZSBhdCBhbGwuDQo+IEJ1
dCBpbW8gdGhlIHRpdGxlIGlzIGNvcnJlY3QsIGFuZCB0aGUgY2hhbmdlcyBzaG91bGQgYmUgQXJt
LXNwZWNpZmljLiBUaGVyZSdzDQo+IG5vIHBvaW50IGhhdmluZyBzdHJ1Y3QgZG9tYWluIGZpZWxk
cyBvbiBlLmcuIHg4NiB3aGljaCBhcmVuJ3QgdXNlZCB0aGVyZSBhdCBhbGwuDQo+IA0KDQpZZXAs
IHlvdSdyZSByaWdodC4NCkknbGwgYWRkIGlmZGVmcyBpbiB0aGUgZm9sbG93aW5nIGNoYW5nZXMu
DQoNCj4gPiAtLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYw0KPiA+ICsrKyBiL3hlbi9jb21t
b24vcGFnZV9hbGxvYy5jDQo+ID4gQEAgLTI0MTAsNyArMjQxMCw3IEBAIGludCBhc3NpZ25fcGFn
ZXMoDQo+ID4NCj4gPiAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IG5yX3BmbnM7IGkrKyApDQo+
ID4gICAgICAgICAgew0KPiA+IC0gICAgICAgICAgICBBU1NFUlQoIShwZ1tpXS5jb3VudF9pbmZv
ICYgflBHQ19leHRyYSkpOw0KPiA+ICsgICAgICAgICAgICBBU1NFUlQoIShwZ1tpXS5jb3VudF9p
bmZvICYgfihQR0NfZXh0cmEgfA0KPiA+ICsgUEdDX3Jlc2VydmVkKSkpOw0KPiA+ICAgICAgICAg
ICAgICBpZiAoIHBnW2ldLmNvdW50X2luZm8gJiBQR0NfZXh0cmEgKQ0KPiA+ICAgICAgICAgICAg
ICAgICAgZXh0cmFfcGFnZXMrKzsNCj4gPiAgICAgICAgICB9DQo+ID4gQEAgLTI0MzksNiArMjQz
OSw5IEBAIGludCBhc3NpZ25fcGFnZXMoDQo+ID4gICAgICAgICAgfQ0KPiA+ICAgICAgfQ0KPiA+
DQo+ID4gKyAgICBpZiAoIHBnWzBdLmNvdW50X2luZm8gJiBQR0NfcmVzZXJ2ZWQgKQ0KPiA+ICsg
ICAgICAgIGQtPnJlc2VydmVkX3BhZ2VzICs9IG5yX3BmbnM7DQo+IA0KPiBJIGd1ZXNzIHRoaXMg
YWdhaW4gd2lsbCBmYWlsIHRvIGJ1aWxkIG9uIHg4Ni4NCj4gDQo+ID4gQEAgLTU4OCw2ICs1OTAs
OSBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBwYWdlX2xpc3RfaGVhZCAqcGFnZV90b19saXN0KA0K
PiA+ICAgICAgaWYgKCBwZy0+Y291bnRfaW5mbyAmIFBHQ19leHRyYSApDQo+ID4gICAgICAgICAg
cmV0dXJuICZkLT5leHRyYV9wYWdlX2xpc3Q7DQo+ID4NCj4gPiArICAgIGlmICggcGctPmNvdW50
X2luZm8gJiBQR0NfcmVzZXJ2ZWQgKQ0KPiA+ICsgICAgICAgIHJldHVybiAmZC0+cmVzZXJ2ZWRf
cGFnZV9saXN0Ow0KPiANCj4gU2FtZSBoZXJlLg0KPiANCj4gSmFuDQoNClRoYW5rcw0KUGVubnkN
Cg==

