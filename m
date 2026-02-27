Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDNVD6XfoWlcwgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 19:17:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E871BBE15
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 19:17:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243039.1543103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw2OJ-0006uQ-Od; Fri, 27 Feb 2026 18:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243039.1543103; Fri, 27 Feb 2026 18:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw2OJ-0006rp-M2; Fri, 27 Feb 2026 18:16:43 +0000
Received: by outflank-mailman (input) for mailman id 1243039;
 Fri, 27 Feb 2026 18:16:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wuQT=A7=citrix.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1vw2OI-0006rj-2r
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 18:16:42 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 737c2821-1408-11f1-9ccf-f158ae23cfc8;
 Fri, 27 Feb 2026 19:16:36 +0100 (CET)
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by DS4PR03MB8446.namprd03.prod.outlook.com (2603:10b6:8:322::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 18:16:31 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%6]) with mapi id 15.20.9654.015; Fri, 27 Feb 2026
 18:16:30 +0000
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
X-Inumbo-ID: 737c2821-1408-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NrJ8mu874/FSqduttOYqOVXZMybiF3ZYzUS68rTyfGfdmPB3Bn5gcngz0+hGPlKIzNPN1mj+sFHaOL7/Pc3uA9KnFqXekoAxiH35Qdfst4edXbODr//SPDNy2WRVf4tAwyopvOaHHn81qzcl9SI7pC+LIkC6NzRRqkZn5iPOyf4y4o0duyCgXCtXu/1Ji3MJ+/Cl1WoibrEF1B9MpNe36ZfKA5icustEsIISSbthoopfJesAQCtMU7MJSW1yio/GdTVl2/U3z8JDifJTmFcn2osU65emR7DqksTn3J3ZtSWn4dAwyw1D1WQSUKpMc8T6st6egjdPt+F2iDuaEtYejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hm/EzdykBF6TtR3U0O9OvKQyOUGBN2fkEmfv2THaCso=;
 b=mGPIFRvaRn0pdE/oVGW8fjLDNtdGAOxawqvX3MZh5r0JIpP3smpAz5Q0bykBbPecjS1U7yo0WJE2gX/n4zbipktJqMu0U1sVs7lY+sdxn9bz4z6TPl4XS9zVOPGrNShV74ggue/L2wG3si5T7MqjYk/eBTo/gjMIZP4Y2apF50tsfUifXUP3yIkCnkocmDgL7GiSeyOXZX8iBGyyJeOHmf9cBhi4x5XvHAEN1OVNfdlJG7W8jKoH54M0krI8z+2SjENgH701pvhtyd5CDaoDcumihAyVpJiJQhxCRkWFAknVFepSYtzjw+3LegVBRbEbDvdXevDHNBjXAUTIegtmtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hm/EzdykBF6TtR3U0O9OvKQyOUGBN2fkEmfv2THaCso=;
 b=Wyrc814DOLHPQxjXBUkSl1gJH7UFwQ/yM88mERxw9KC2EJSm0qpWclTTVM0kWelzSWRyGbD97aEaD2Ax4UN3z10L2MroSpbM2efseKWJmphIs4AzWjBlp9iu0mKL1M84+9/HgvIwWoW4wura+2Yu9QImzFs1oXvt98d2r3hRXIA=
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: RE: [PATCH v4 05/10] xen/domain: Add DOMCTL handler for claiming
 memory with NUMA awareness
Thread-Topic: [PATCH v4 05/10] xen/domain: Add DOMCTL handler for claiming
 memory with NUMA awareness
Thread-Index: AQHcpy8NKyz6wh/Wrk6CsdW/rK3ShrWVfM8AgAAgIzCAAK6rgIAAe1AA
Date: Fri, 27 Feb 2026 18:16:30 +0000
Message-ID:
 <LV3PR03MB77079F7679F069E88E7D70548773A@LV3PR03MB7707.namprd03.prod.outlook.com>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
 <b2c94f0c3b41976b2691ce15b9f9a2589370e65a.1772098423.git.bernhard.kaindl@citrix.com>
 <656ff614-9165-49ce-8c55-0cfad33d4ed6@vates.tech>
 <LV3PR03MB77072E23139DF353E7B8C9D28772A@LV3PR03MB7707.namprd03.prod.outlook.com>
 <a1b1daa3-a70e-454e-9cdc-42e26b204a0f@vates.tech>
In-Reply-To: <a1b1daa3-a70e-454e-9cdc-42e26b204a0f@vates.tech>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR03MB7707:EE_|DS4PR03MB8446:EE_
x-ms-office365-filtering-correlation-id: e6043985-6ad0-45a9-bdff-08de762c54dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 QwiIu7e81M1o2q/dJ3OBMbXtZEiJB7yGoo95Wk8hxFeuJxbRbetsO1egqODnPvB47+S5RTTlnYw3uiShGzmNFyuwVKWUEToPy17aZWOz0RSBbb0mF9el/L2aHYWstCxBD+NXffHrKlCpSuRS9BJZHUJpAexSQrOm+Zph0Bhzw4P3KylaNykF+2a1rOE+gRxXZLDXsnM/13anY7qUkHrfn7jVVMmjX43lr33qtIc5tejwTjsSvonEClf6f884hMHRgY+afNn0OB5BUzNTku74+bYe3PZwptJEnzeBPuFmMKwsDMFVxrS2XUJjLT40/wA1MQm8oNjpwYvXCkpjzXKCnyf5KeW3F6fJrBjsHWtwkUYl8JDnFRRmevuhH+0yXeUTRik8m+bJ8GwnSGu8Jo1StqqDOfGdJ9ivbQg68OfduSgHfhYjd10yJjQkFXZXFMcHiqnE2+6c3i69Bk58ZpBKrI2D9LTPW0mKLofVat9yyyDVFa6L5NWk7U0KI/nQkgxqo0LIm5Qa9eIqZ8PgdJcFxuPVJQ8+D9S+Ot3MK/JlhR/THGfRDcDVp96l5tPbH97o8T2KM3K6wJibpyvFshDpssFyrr0HESj6zpzjjsCVINeXeSAMTfpbKVBxFe9hugNzyWsju2js9yZhXVuTgetMMERE+4B20YnoHBTmt3bExUGGqQblNdc1d7/VFhKs9DqagGLUVlrGzqESSSKSjWQ52hjDP/B9KUeEVkov8EfoEN8c3DrJjz5FEBSdC8I0PMmX581ehbBavKu7lTfedyG3R8LjAzdP9Y5B4qNLqR7DHzg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VkZ3bzZ5UFRuZWRlU2tralk2UG53VUlEcS9UcFhPR0dBU2IwSFBDRGhoU29D?=
 =?utf-8?B?d1pKL0RxeEs3akhYcHRCb0FwM1BUdmFIcW5ucXVhQVZoWGNwVVNXNHJXY2xN?=
 =?utf-8?B?SzdVdXdIODJJVUMzOTdNYkxxM3VzMUdncnJvcmhhNUJReTluSnFJTnlWUEpJ?=
 =?utf-8?B?N1ZhbCsxVzVBeWFUQmovV2NjS2ZKWC83aS9GK1kxVUcyUDdkcmhnSlVJamZ2?=
 =?utf-8?B?Nmk1RFlKMnF1dGNUbEZmdXZzNVl0NCt1Ky9Vc29ibWJra24vVFE3L04vZTdH?=
 =?utf-8?B?YzJNK09rZUdmUmpkU3B1ck9ubDIwOCtSdXpSZW5sNmd1U2xSNlAyUnc0RDJp?=
 =?utf-8?B?RjZpTDdidTJZcWJ2UWV3NU92emFkZ3g0VlRsMnJVNDZjWjU2ZzlxMTRlNElu?=
 =?utf-8?B?MFlVTHdrZTlHV0dFTGZHU1pYZzdvU3ZYQTdNTE1nMkVXbmZmY0JibWxIOXlN?=
 =?utf-8?B?SG9uT0JkNzB3bHpRL3V2dlQzZ2krbjBGTHFNUVkvaHFxSkdVSXRkaXNQMHpO?=
 =?utf-8?B?R3BWUmIzNnJBdXdiTXQyaHowZHVhRS9Kd2FPbTRmeUxkc0piZ3M1UDdtTFlE?=
 =?utf-8?B?SEo2Y2pmTEp4NFZQYXBBV1FJSWRJZkUvU0tza3Q4RlpIOFNJY3BybjBHN0Ix?=
 =?utf-8?B?QXVKY1dyTEw2WEVRQ3J6bGMrV2d6UEFUUXd4emdWUHcydVBkdlNxaDcxZDRG?=
 =?utf-8?B?U1RWbEZPVmdST09lWXYwMHpaTHhzY3F1SG95Q1FVN0Y4SzFHdmRUZzlrN2Za?=
 =?utf-8?B?N0JKUXZwbjVvM2tzRS94QktTM2l6WDZRb2trUDRROFowaHZvck0zQ21DQ1JI?=
 =?utf-8?B?MFlJVUhld3FxRi80blZRR205eEpHd0V1bjhkM3M3eGo5Q0JaaHg0WWVzQVFO?=
 =?utf-8?B?NVZZakE5NTk4aWJlcHQrMzk0R0JLaXFFcFptL3lCWDBqTGVDbisyY1NjRURw?=
 =?utf-8?B?TkpqWHBRWE45VjNYU0cvalBxbWhmZDhLV2EyQjRHWkhPVDZMOGdsMElhdU9M?=
 =?utf-8?B?QUpnYU92QmoxWkdVc1IyYkhESnlPcjhONFhVRDVIRGNIdjNSYlM2YlR5aHZK?=
 =?utf-8?B?YW92R29jWWQzdmJwV1V4bEQrcHNRQWpiL01KYS9RSFZ5d0gwWWdHME1kdzVF?=
 =?utf-8?B?VHNvcFM4NU5GaUc5eE9jQmhVWmJ3MEdBbloybklaRjkzb29WSW5pNERNZlpD?=
 =?utf-8?B?Tld2Q0dqZ1VWUDZIWVArUzJxbFdiOTdtaWVYU3krY2lJMzhyUSttSUtmcjZ5?=
 =?utf-8?B?dEtmVENYeEZBSzloNG0yZ2lRaW5COVZzOFZ1Yzg3T2RQMHJUQVMxTUJsUmRW?=
 =?utf-8?B?RWl1UjE3OTVzdm9NNWVkcWd3Z2t4Y0s1ZWg0M0JjU2dHOVlVT0FUWDV1YTV3?=
 =?utf-8?B?RzBHa1pLcnMrc284VjBlR2RkY2RjekVSRThWSmc4T2dmZE1DZGJqd09ITUFn?=
 =?utf-8?B?US8wejhHQTNSckNaR1NMWmVBdEdlZFNDbWQyZzltaUhwelJOdjZoWEVKdGFT?=
 =?utf-8?B?Q1R5ZHEzYWQyRmJJN2o1a285cGtiek83dkhWbTVHdmJIaDRQWHY4TTYyYmxz?=
 =?utf-8?B?c3FSd0VCV3hvclVkTmhjaEd4Q2dmM0phV1h5WEhyTEV1VDhMRkc3cGxQYVZp?=
 =?utf-8?B?ZHRVM01MQ2QwdVhZLzY3dXVpWVMyMHN1OXY3TFI0WFR3TGU5cWN6K1pmQ25h?=
 =?utf-8?B?aGIxYlgvSkhGVnU0RjVQV2NsVzRnY0NPOFF1eThjM0xNQ21Cb2s0cnNaUys2?=
 =?utf-8?B?YU9zV3MwMGJaYllQVTJiSnhIa1BFRGVIUXhJMHVmb0hGSDRxUkJRVEJPb3Rj?=
 =?utf-8?B?d0kyTkVJeHUzYVllb0lmOXAzOEJ1M3NnUURIU1Bmc3ZvRTNleUErZCtFcXFx?=
 =?utf-8?B?ZFFrK0taMzFQS3krSmxtaDBnWm9xei9xekFjWGdYZHp4blZ5R3gzMnhZTGFL?=
 =?utf-8?B?WUlqcU5jaCtDRURYb3dmMEFEVzBCcWFTRC83bTdVWFBzWFI1YUUvcHM1MTg0?=
 =?utf-8?B?OXN6bkt3bW9URW5ZODNxRUdOL3YyZ1kwSkVJV2tWNE1HVUZLYlZkY243Y2hO?=
 =?utf-8?B?a3R2djYyNkJhYlgvMExWWHBNY3lsYkpmR2lTeWpQNFI2SFliY1lGazNYN2c3?=
 =?utf-8?B?NFZQS3BNZitXRUhlek51UkdmWlpiUlFYdUdzQS92S0RFSjQ4ZE1Bdlc5c2Yr?=
 =?utf-8?B?ZzRublBSNU1tVnA0OSthRnMyZFduei9tWEJXWGZBbEJWMEx1OEx5RmFtc24z?=
 =?utf-8?B?OCttUHFNQldadnUxYXpHL2tKSlZwcWJnOTZCWG1tUzgxTms4U3BkdkNUS2hF?=
 =?utf-8?B?czRGUWJ2VmppNzhmOHJRZjRZbkRZdy9qVzhqVjkrL0FtbmlBV1N5UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6043985-6ad0-45a9-bdff-08de762c54dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 18:16:30.7403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QpHuI//ZiTrrqYxahHJpH3NVKBQUJIXDX1Yo/8yuDEVsUehRkQTDq0cAR3J/2SXynTwxgV5uos8yA0Pek6IKBIFjFd4UTXHP83uki7iVTgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8446
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.09 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:andrew.cooper@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[LV3PR03MB7707.namprd03.prod.outlook.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 94E871BBE15
X-Rspamd-Action: no action

DQo+IFNob3VsZCB3ZSBzdGF0ZSB0aGF0IHRoZSBvbGQgaW50ZXJmYWNlIGlzICJkZXByZWNhdGVk
IiAoc29tZWhvdyksIGFuZCB0aGF0DQo+IHBlb3BsZSBzaG91bGQgdGFrZSBhIGxvb2sgYXQgWEVO
X0RPTUNUTF9jbGFpbV9tZW1vcnkgaW5zdGVhZCwgZXNwZWNpYWxseSBpZg0KPiB0aGV5IG5lZWQg
YSBOVU1BLWF3YXJlIGludGVyZmFjZSA/DQo+IFRoYXQgY291bGQgYmUgYSBub3RlIG9uIHRoZSBY
RU5NRU1fY2xhaW1fbWVtb3J5IGh5cGVyY2FsbC4NCg0KWWVzLiBQZW9wbGUgbG9va2luZyBhdCB0
aGUgdGhlbiBvYnNvbGV0ZSBYRU5NRU1fY2xhaW1fcGFnZXMgaW50ZXJmYWNlDQpzaG91bGQgYmUg
cmVmZXJyZWQgdG8gdGhlIG5ldyBoeXBlcmNhbGwgdXNpbmcgc3VjaCBub3RlLg0KDQpJbiBwcmVw
YXJhdGlvbiBmb3IgYSBmb2xsb3ctdXAsIEkgYXBwZW5kZWQgYW4gaW5pdGlhbCBwYXRjaCB0byBh
ZGQgc3VjaA0KTm90ZXMgKG1heWJlIGFsc28gaW4gbGlieGMsIG1lbW9yeV9vcCBhbmQgT0NhbWwg
YmluZGluZ3MpIHRvIHJlZmVyIHBlb3BsZQ0KdG8gdGhlIG5ldyBoeXBlcmNhbGwgaW50ZXJmYWNl
Lg0KDQpCZXN0LCBCZXJuaGFyZA0KDQotLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvbWVtb3J5LmgN
CisrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9tZW1vcnkuaA0KQEAgLTU2OSw2ICs1NjksMTUgQEAg
REVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoeGVuX21lbV9zaGFyaW5nX29wX3QpOw0KICAqIGZvciAx
MCwgb25seSA3IGFkZGl0aW9uYWwgcGFnZXMgYXJlIGNsYWltZWQuDQogICoNCiAgKiBDYWxsZXIg
bXVzdCBiZSBwcml2aWxlZ2VkIG9yIHRoZSBoeXBlcmNhbGwgZmFpbHMuDQorICoNCisgKiBOb3Rl
OiBUaGlzIGh5cGVyY2FsbCBpcyBkZXByZWNhdGVkIGJ5IGludHJvZHVjaW5nIFhFTl9ET01DVExf
Y2xhaW1fbWVtb3J5DQorICogd2hpY2ggcHJvdmlkZXMgdGhlIHNhbWUgY2xhaW0gc2VtYW50aWNz
IGRlc2NyaWJlZCBhYm92ZSwgYW5kIHRodXMgY2FuIGJlDQorICogdXNlZCBhcyBkcm9wLWluIHJl
cGxhY2VtZW50IGFuZCBpcyBleHRlbmRlZCBmb3IgTlVNQS1ub2RlLXNwZWNpZmljIGNsYWltcy4N
CisgKiBUaGlzIGh5cGVyY2FsbCBzaG91bGQgbm90IGJlIHVzZWQgYnkgbmV3IGNvZGUuDQorICoN
CisgKiBTZWUgdGhlIGZvbGxvd2luZyBkb2N1bWVudGF0aW9uIHBhZ2VzIGZvciBtb3JlIGluZm9y
bWF0aW9uOg0KKyAqIGRvY3MvZ3Vlc3QtZ3VpZGUvZG9tL0RPTUNUTF9jbGFpbV9tZW1vcnkucnN0
DQorICogZG9jcy9ndWVzdC1ndWlkZS9tZW0vWEVOTUVNX2NsYWltX3BhZ2VzLnJzdA0KICAqLw0K
ICNkZWZpbmUgWEVOTUVNX2NsYWltX3BhZ2VzICAgICAgICAgICAgICAgICAgMjQNCg0KLS0tIGEv
ZG9jcy9ndWVzdC1ndWlkZS9tZW0vWEVOTUVNX2NsYWltX3BhZ2VzLnJzdA0KKysrIGIvZG9jcy9n
dWVzdC1ndWlkZS9tZW0vWEVOTUVNX2NsYWltX3BhZ2VzLnJzdA0KQEAgLTUsOCArNSw5IEBAIFhF
Tk1FTV9jbGFpbV9wYWdlcw0KID09PT09PT09PT09PT09PT09PQ0KIA0KIFRoaXMgKip4ZW5tZW0q
KiBjb21tYW5kIGFsbG93cyBhIHByaXZpbGVnZWQgZ3Vlc3QgdG8gc3Rha2UgYSBtZW1vcnkgY2xh
aW0gZm9yIGENCi1kb21haW4sIGlkZW50aWNhbCB0byA6cmVmOmBYRU5fRE9NQ1RMX2NsYWltX21l
bW9yeWAsIGJ1dCB3aXRob3V0IHN1cHBvcnQgZm9yDQotTlVNQS1hd2FyZSBtZW1vcnkgY2xhaW1z
Lg0KK2RvbWFpbiwgaWRlbnRpY2FsIHRvIDpyZWY6YFhFTl9ET01DVExfY2xhaW1fbWVtb3J5YCwg
d2hpY2ggaXMgZXh0ZW5kZWQgZm9yDQorTlVNQS1hd2FyZSBjbGFpbXMuIFhFTk1FTV9jbGFpbV9w
YWdlcyBzaG91bGQgbm90IGJlIHVzZWQgZm9yIG5ldyBjb2RlIGFuZCBpcw0KK2RlcHJlY2F0ZWQu
IDpyZWY6YFhFTl9ET01DVExfY2xhaW1fbWVtb3J5YCBwcm92aWRlcyB0aGUgc2FtZSBjbGFpbXMg
c2VtYW50aWNzLg0KDQogTWVtb3J5IGNsYWltcyBpbiBYZW4NCiAtLS0tLS0tLS0tLS0tLS0tLS0t
LQ0K

