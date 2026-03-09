Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNLRIQqlrmk4HQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 11:46:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E71D723752D
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 11:46:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249250.1546728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzY7x-0000FN-WD; Mon, 09 Mar 2026 10:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249250.1546728; Mon, 09 Mar 2026 10:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzY7x-0000Dh-Sp; Mon, 09 Mar 2026 10:46:21 +0000
Received: by outflank-mailman (input) for mailman id 1249250;
 Mon, 09 Mar 2026 10:46:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lNRQ=BJ=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vzY7w-0000Db-4z
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 10:46:20 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30d65b15-1ba5-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 11:46:14 +0100 (CET)
Received: from SA3PR03MB7419.namprd03.prod.outlook.com (2603:10b6:806:39c::6)
 by MN2PR03MB5296.namprd03.prod.outlook.com (2603:10b6:208:1e8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 10:46:10 +0000
Received: from SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc]) by SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc%6]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 10:46:10 +0000
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
X-Inumbo-ID: 30d65b15-1ba5-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWGq8Ma3vVepB5jdjxODd//+uBbVBwQj/GMwIlLfFmCYCSeX5tD6YtwQgymPWT4FE2rWWbEEexP1fmT9rZrhwQL7RLZnIwzVYGBzMr88/GhkXEjrbEfOSiDCW0TlwU2FnrZRTSPwXCfutygZS1RRmdjf38fXl3nJqcFeMUERFwcwb6DrUEdooq8dWNWPJyS0aLnzt6rTTWSoD6BRmk7yGiALvbJdog2kB58gYZOiip+9Xq4JzMieFPxEJfKdRKvERccR7vYQOWYyezWcgaBh+SQIbDETIORsbNndAzRBdhiTWzkV0qsDRTr5BGtNzd5G+DRsb8onRcTfkumADbrm+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWuuO0DE7JddmloIvsWoWHqdKWz5S3CurWOhGgZGUO8=;
 b=Cd8CH1GK6WzGFLFqQ/ciNUhWyTNgUgcjmUU9uprasiegP4MBPLKJsHgg73a4qS09ZMBVGeY9a3u8u7bBk6jSO46at36HwrFqFcPgd/Z2a8KghBDL01nB8Z++4DqPmO2K1cFY5jqivwc/Gq9t0DGYIHd6Y/ppDaqoJ4BklCyb6B7ZbUJIi8bU1ID0I+PZBtYRV5TMOkd6/sO6cbQ5m41BpfuVRnwUIEAf/qNiSo145jhR58Yx3f+A1MvalB1eBRL+HDR6s3TNeLXAa08aMnqZ7ffeR2FcAUJ2ilmmT8lFxPdMvKSwHrkSfdHx3CRDZjhw1L8ibV3cQkBzbuH67/17UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWuuO0DE7JddmloIvsWoWHqdKWz5S3CurWOhGgZGUO8=;
 b=SRWqf0p3fWd5xA8q0IZmzMWkU97CynTmDl1dwNwphC93WxfLzTfsdH8oX7S4NYIqCL+Pkne1/zbH+P+yWAh5iU257gvmZ27pLhovF9Z6iBMa0UAKiKhDFhbdLXIIYtXElW0poFojQX2yPT29PwR0QESHSoZ5vnHw938oWhUaL04=
From: Edwin Torok <edwin.torok@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/1] tools/tests/x86_emulator: avoid duplicate symbol
 error with clang: use -O0
Thread-Topic: [PATCH v3 1/1] tools/tests/x86_emulator: avoid duplicate symbol
 error with clang: use -O0
Thread-Index: AQHcrYXnXQSbfSYkDE2XRiS+3V/VSLWl1toAgAAhtYCAAAj/gIAABzwA
Date: Mon, 9 Mar 2026 10:46:10 +0000
Message-ID: <D9BDF457-D228-47B6-8892-A90728FCE8A5@citrix.com>
References: <cover.1772813802.git.edwin.torok@citrix.com>
 <a4a29c95b06a0352889bb6c032c19be6e4cf8288.1772813802.git.edwin.torok@citrix.com>
 <49d22b35-f5d8-4992-a32a-bb3f7c3e5ad2@suse.com>
 <5B5A0A1C-B7EA-47F2-8CF9-3000CF4414F1@citrix.com>
 <39057e2b-5d1e-41ff-b5d3-0e5aa4745d15@suse.com>
In-Reply-To: <39057e2b-5d1e-41ff-b5d3-0e5aa4745d15@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR03MB7419:EE_|MN2PR03MB5296:EE_
x-ms-office365-filtering-correlation-id: 0ba0f3d9-cb43-4985-007b-08de7dc913a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 aC4BbU9TDrM3XaNjeNjppYp/6nm/CbNx6Vg/LlZl5nG20ChHjNxR16HHLzOJs2i5Heahv/dACbcQ9/Amkt4nrXRkqbdImMpxG/BCMpUr10Zl4XMT4HzUbbZyBNSCDA2G960PKorr6ILmlSnPKCK8+3tQv7AgZb4kIuGm32OYqwxAX5+CM6BRnbBY0DDbjfWxrfK0ZenEUg1rYHnBGuPsLcoS/9nP54GjQiJz0FtHctLIA0k7eAGfogmcnid1vw6g/4RS2NkUeJ2Vkgm1e5CXb9rJZ0ql6kOZOh1DKcrIJYpzGre/n+LeY3AbL2V6BrVcs6+6UFW/1lyNlgx4km9BBwENkuqo5L7wZKf+qehMf4I8cWwyTPdV36CiHzxIP2HY6FR2GiPz8PjzcbGsqgg3l8FHqRJYmSM1PhE2j0Y1SAZggVGDj4lrvwCzT0R0z+GgUid3nB28TD5/bSDRER4dSH/PjrCELY4MjYLAA7VUUl4wkr8Hgt7gSlM9Y9ZzgJia2EuqnrkstU9JBNn1V87Iu9Naq7W4pdkGtYHss0wWPXHY/KFlmCuO7aB9khZia8TMaRCIGuCtqgifxRsV6EIahmiqS5Ah9Z7b+5fQB8HjxaF+kkh4k3JlFcNG4Ga1jvYZCGtOy/wcFo8mY4M7JycwGZeaI6d+aZLmA2/V9sYEd9T9BoOv0y8BvegIb8CjTj7a0lUgHrO1RaVFqyZl43W6TibvDRMDgqgX72mxgZdhNoQ6lijQ5FlwHqLfxxdbWy60WU8KO5Q+xUNvB8RVwFNNnfHA+1IrDynhM0SmKiw4BWU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR03MB7419.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YTdIUnhtcm4zSFJWRU84bGI0SGNBdEFVYmxaanRjLzhlaFNBU2lCNlI2NlRS?=
 =?utf-8?B?cmVhVWpQeXdoRjVyd1BQZXpCbkFpWTRuRHU2LzZQdkJxZUpkU2t5ZXllc3dX?=
 =?utf-8?B?MnJiSHBJbVU3TzNHSlZXanJnMkxrNWQ1d01Zc1cvTitGNHlTeGRMZG9mSnNq?=
 =?utf-8?B?VWZXMXJkQUtRL3Z1TllINjFLdllaOXp5d0xkREVXTnNhMHM3U0JOdlJPT0gw?=
 =?utf-8?B?VlZFdEREaDZyUUtGc1VpWjE1cEhKb21EK0lFeURsR3F1M3VLWjZSWlJxSEhS?=
 =?utf-8?B?bzBCWHF5MndwZU5yYU8vc0ZaVFlBd1pBeFE5cHVaNjArRXg0cC9naG9mUDlG?=
 =?utf-8?B?MnNlai8xdm1BOVB3eHQwVmc1YTdzWHlJZ3U1OG1tSXBIRjJWK3hpZU81TFc4?=
 =?utf-8?B?dXJSQWNTUmU5MjRIS0oyMGRGNmlreEtTVnFaYUFIakJkeFNBS3FxSjR4cWdk?=
 =?utf-8?B?NjNHRmRWQmNBc1g2MkdIb0dLQ01mSWJyWVE1TlFwS2k1eTNKTVJiVDJaVkxv?=
 =?utf-8?B?MXpRZy9lQitNQmhBNFEzZ08yelNqamh6QmRZY1NhcjlGeFJud3AwazFoQWp4?=
 =?utf-8?B?dHY2dGxUNDVRMDFZQ1ZyK0JmVCtSVDhtV1phRmNOUmFLai9sRkNWOWtaOHNa?=
 =?utf-8?B?TTN5VGRMd1NtVmdNWlFoaDNHNmxRZVM5WHo3RHhxTUVpTFlMZjNrMlZpNXFa?=
 =?utf-8?B?NlBQa0FUbHVQckJVdGg1WlZJN2wyR0pvdEZzVnpmYmJEb2JlV0dJSzBUbUhQ?=
 =?utf-8?B?MjRUc2s2eTZZekhHa081bU9wOWY3clY0Ym9SWlBIekpsaFJTQlV2MTlYdzVz?=
 =?utf-8?B?WjY3QmpoNVZ1ZSs0Vys3TGM4M29EaEdlelNOZFBuL20zQkNucXBLQmxSR0tZ?=
 =?utf-8?B?SG1BR3c1WUtYTGFpeHo4T3hRam9TN3MzdmZqMEFRWE1NU0pKV0xQL1VkSzlo?=
 =?utf-8?B?VnJMM0cwMW00RHpMUVRyZFI0UmtmQ29Id1ZYbkFWS0htR2NGUnd0ODlrdGVk?=
 =?utf-8?B?RzREMG1EZWQ1MERBTVVRdHpBK0s1RnMwWGVrWFJHOVBoWWhpVGV6eENPbWpY?=
 =?utf-8?B?M0RoeHZqSkhhRWQ5Rk5TQm96cklhUkpOUTJra1ZiWUtrOGRCZGRzZ3pRM1dN?=
 =?utf-8?B?VGlKQUZIUW1JVDNudDNXY0ZDQkF5OHVzWVkxVnhmUnIwRFZ1QlFsZ1JNWXIy?=
 =?utf-8?B?OWVHaXFHaWJ6cWpVMnV2T1BZUDhqRTVqaWgyYmJ4UEYzQ1hnVnhPb1JmUlhF?=
 =?utf-8?B?VXB5aVljbjB6OWZ0aTdBaHUwbXJVMWhtUXhBWGU2VWdHODkvMURlSDFtRU5Q?=
 =?utf-8?B?ZldsbkJNRWtvL3dJN3RjWmVZeW1jOUw3OE1iaU1QNFZIbzhXSDg1a3RaS2sx?=
 =?utf-8?B?ZGQzdE4xSktuWkRjbUxrQmhDQVgzMWU5emRMS0M4U01lNFVqd0EwNTB4eExM?=
 =?utf-8?B?cVZYNlpTS2p1QTBJR0xjcjJpWmtwS01TMUt5S052cFFkZVVQdHhRMUFjdTFt?=
 =?utf-8?B?YjE2cXdGb3lKU0RPZkNaQUUwcFZMN0NBS3BBbVdlTnF3ak16YndrSDk3SHR5?=
 =?utf-8?B?cEM4ejVwQWVZNTNIMlcxS1R0Q25LSS9ZSXR1NnhvVnhRWGRnWEo5b2xuNkEr?=
 =?utf-8?B?Mk5jQUEwaGpBclJ3UVZqVGFkVm95R25sV2dqakoralh2Yzg3ZDdDTDRPL01s?=
 =?utf-8?B?VytqM0w0T2dxb1lMdUV4WUpUYjh4dHRZN1NFQ0svZkNxNGlyNzNGRnpuVGlt?=
 =?utf-8?B?c0FTaG5ncHBLY1FHaWlWZ3hLN0tJbGZTUWNnMlJqTnl5WkUyOEJ2OEtZdlNa?=
 =?utf-8?B?K0w1cXdxb05RZmlrZ3AwYWhOUnZRRUJaT1luWmFIMjR6amhDcGdJWE1OKzZ0?=
 =?utf-8?B?VXdQZklUS29qQnhmYUxPdHNramdSVHgyNDJFU1A0WFpzc0o1SkdiQU83WHJv?=
 =?utf-8?B?WTh3V3d4RE1BK2txWStxZzkvMlN5cFRPeWM1RmlVa2xVMmVnSHBWR3FmaW9t?=
 =?utf-8?B?amZxME1Bclc2QzVrYkNyUWFCSjFWRk5HbEtLRHhQWlg0eDBSU0ZVMkt2V1dH?=
 =?utf-8?B?Rm1MTEM5VzdSUlJxaXdlYmkwMFgrcUtialpDVGJPZHA2VUhpL1MrejRJOEtu?=
 =?utf-8?B?NVZuSGs2cTZYZFUrTUNUUDhSdXNWalRUbEZ6Y1hVVis5RVVFQWxxdlVWREZZ?=
 =?utf-8?B?UGVhTEh2aDBNTWxjV1kyYXROS0xZdXZUQUhDMUVkR1k3RTJBVWJCYmNNblNs?=
 =?utf-8?B?MGtqVnlXdEdBdTBJbU1GWWFSY2I1RU5nVVhnRmw4ZEpQM2M1QXhoNDl3NlJG?=
 =?utf-8?B?MWs3bEZHaWFld0dQUHFHRGQ5SGh5bHlsb1JrK3pLQTZDclBEK1Rzc0ZDd0Zr?=
 =?utf-8?Q?VMjxTDB38f6Dvp0I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4393FA9A41DAD145857FE1849610AA52@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR03MB7419.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba0f3d9-cb43-4985-007b-08de7dc913a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 10:46:10.3967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3p9oTWOSJhRl620I7AzGwac+qUjTJZM+0mnswhGGEI2hCNqxW5zMa9Op8pYGaNCBRT/Ez5jTL1KXfUFX0QD93Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5296
X-Rspamd-Queue-Id: E71D723752D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:dkim,citrix.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	APPLE_MAILER(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

DQoNCj4gT24gOSBNYXIgMjAyNiwgYXQgMTA6MjAsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwOS4wMy4yMDI2IDEwOjQ5LCBFZHdpbiBUb3JvayB3cm90
ZToNCj4+PiBPbiA5IE1hciAyMDI2LCBhdCAwNzo0NywgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToNCj4+PiBUaGVyZSdzDQo+Pj4gb25lIG90aGVyIHF1ZXN0aW9uIHRob3Vn
aDogSXNuJ3QgLU8wIHRoZSBkZWZhdWx0PyBXaGVyZSB3b3VsZCBhbnkgb3RoZXINCj4+PiBvcHRp
bWl6YXRpb24gc2V0dGluZyBjb21lIGZyb20gaW4gSE9TVENGTEFHUz8gQWgsIEkgc2VlIC4vQ29u
ZmlnLm1rIGRvZXMNCj4+PiB0aGlzLCBmb3IgYW4gdW5jbGVhciB0byBtZSByZWFzb24uDQo+PiAN
Cj4+IE9uZSBwb3NzaWJsZSByZWFzb24gSeKAmWQgZW5hYmxlIG9wdGltaXNhdGlvbnMgKGV2ZW4g
Zm9yIG5vbi1wZXJmb3JtYW5jZSBjcml0aWNhbCBjb2RlKSBpcyB0byBnZXQgYmV0dGVyIHdhcm5p
bmdzLg0KPj4gSSBsb29rZWQgdGhpcyB1cCwgYW5kIEkgc2VlIGl0IGlzIGFjdHVhbGx5IGRvY3Vt
ZW50ZWQgaW4gdGhlIEdDQyBtYW51YWw6DQo+PiAiVGhlIGVmZmVjdGl2ZW5lc3Mgb2Ygc29tZSB3
YXJuaW5ncyBkZXBlbmRzIG9uIG9wdGltaXphdGlvbnMgYWxzbyBiZWluZyBlbmFibGVkLg0KPj4g
Rm9yIGV4YW1wbGUsIC1Xc3VnZ2VzdC1maW5hbC10eXBlcyBpcyBtb3JlIGVmZmVjdGl2ZSB3aXRo
IGxpbmstdGltZSBvcHRpbWl6YXRpb24uIA0KPj4gU29tZSBvdGhlciB3YXJuaW5ncyBtYXkgbm90
IGJlIGlzc3VlZCBhdCBhbGwgdW5sZXNzIG9wdGltaXphdGlvbiBpcyBlbmFibGVkLg0KPj4gV2hp
bGUgb3B0aW1pemF0aW9uIGluIGdlbmVyYWwgaW1wcm92ZXMgdGhlIGVmZmljYWN5IG9mIHdhcm5p
bmdzIGFib3V0IGNvbnRyb2wgYW5kIGRhdGEtZmxvdyBwcm9ibGVtcywNCj4+IGluIHNvbWUgY2Fz
ZXMgaXQgbWF5IGFsc28gY2F1c2UgZmFsc2UgcG9zaXRpdmVzLuKAnQ0KPj4gDQo+PiBJbiBmYWN0
IHdhcm5pbmdzIHJlbHkgb24gb3B0aW1pc2F0aW9ucyBldmVuIG1vcmUgdGhhbiBJIHRob3VnaHQs
IGRpZG7igJl0IGtub3cgYWJvdXQgbGluayB0aW1lIG9wdGltaXNhdGlvbnMgaGF2aW5nIGFuIGVm
ZmVjdA0KPj4gKGZyb20gdGhlIGV4YW1wbGUgdGhhdCB3YXJuaW5nIGlzIG9ubHkgcmVsZXZhbnQg
Zm9yIEMrKyBmb3Igbm93KQ0KPj4gDQo+PiBJIGNhbiBzZWUgd2h5IGluIGdlbmVyYWwgYSBjb21w
aWxlciB3b3VsZCBkZWNpZGUgdG8gaW1wbGVtZW50IGl0IHRoYXQgd2F5IChpZiB5b3UgcnVuIGFu
IGFuYWx5c2lzIHRvIGdldCBtb3JlIGFjY3VyYXRlDQo+PiBpbmZvcm1hdGlvbiBmb3Igc2hvd2lu
ZyB3YXJuaW5ncyB0aGVuIHlvdSBtaWdodCBhcyB3ZWxsIHVzZSBpdCB0byBlbWl0IGJldHRlciBj
b2RlKSwgYnV0IEkgd2lzaCB0aGF0IHdhc27igJl0IHRoZSBjYXNlLiANCj4+IEUuZy4geW91IG1h
eSB3YW50IHRvIHVzZSBhIGxvdyBvcHRpbWlzYXRpb24gbGV2ZWwgdG8gZ2V0IGJldHRlciBkZWJ1
Z2dpbmcsIHdpdGhvdXQgZ2l2aW5nIHVwIG9uIHRoZSBiZXR0ZXIgd2FybmluZ3MuDQo+PiBUaGUg
b25seSB3YXkgdG8gZG8gdGhhdCBjdXJyZW50bHkgaXMgdG8gYnVpbGQgaXQgdHdpY2UgKG9yIHJl
bHkgb24gYSBDSSB0aGF0IGJ1aWxkcyB3aXRoIGRpZmZlcmVudCBmbGFncykuDQo+PiANCj4+IElm
IHlvdSB3YW50IHRvIGNoYW5nZSBpdCBJ4oCZZCBzdWdnZXN0IHNldHRpbmcgaXQgYXQgbGVhc3Qg
dG8gLU9nLCB3aGljaCBpcyByZWNvbW1lbmRlZCBvdmVyIE8wOg0KPj4gIkluIGNvbnRyYXN0IHRv
IC1PMCwgdGhpcyBlbmFibGVzIC1mdmFyLXRyYWNraW5nLWFzc2lnbm1lbnRzIGFuZCAtZnZhci10
cmFja2luZyB3aGljaCBoYW5kbGUgZGVidWcgaW5mb3JtYXRpb24gaW4gdGhlIHByb2xvZ3VlIGFu
ZCBlcGlsb2d1ZSBvZiBmdW5jdGlvbnMgYmV0dGVyIHRoYW4gLU8wLiINCj4gDQo+IEFuZCBkaWQg
eW91IGNoZWNrIHRoYXQgLU9nIHdvcmtzIGZvciB0aGUgcHVycG9zZXMgaGVyZT8gSSdkIGluZGVl
ZCBwcmVmZXIgdG8NCj4gdXNlIHRoYXQsIGlmIHdlIGNhbi4NCg0KDQpJdCBhdm9pZHMgdGhlIGR1
cGxpY2F0ZSBzeW1ib2wgZXJyb3Igd2l0aCB2ZXJzaW9uIG9mIENsYW5nIHRoYXQgSSBoYXZlLCBz
byBJIGhhdmUgc2VudCBhIFY0IHRoYXQgdXNlcyAtT2cgYW5kIHRoZSB1cGRhdGVkIGNvbW1lbnRz
Lg0KV2FzIGEgYml0IHdvcnJpZWQgdGhpcyBtaWdodCBub3Qgd29yayB3aXRoIG9sZCBHQ0NzLCBi
dXQgQUZBSUNUIE9nIGlzIHN1cHBvcnRlZCBzaW5jZSA0LjgsIGFuZCB0aGUgbWluaW11bSBpcyA1
LjEuDQoNCkJlc3QgcmVnYXJkcywNCuKAlEVkd2luDQoNCj4gDQo+Pj4gUGVyaGFwcyB0aGF0IHdv
dWxkIHdhbnQgbWVudGlvbmluZw0KPj4+IGhlcmUgdGhlbiBhcyB3ZWxsLg0KPj4gDQo+PiBIb3cg
YWJvdXQ6DQo+PiANCj4+ICMgVGhlIGRlZmF1bHQgSE9TVENGTEFHUyBmcm9tICQoWEVOX1JPT1Qp
L0NvbmZpZy5tayB3b3VsZCBzZXQNCj4+ICMgYSBub24temVybyBvcHRpbWlzYXRpb24gbGV2ZWwN
Cj4+IA0KPj4gSeKAmWQgYXZvaWQgbWVudGlvbmluZyAtTzIsIGluIGNhc2UgdGhhdCBjaGFuZ2Vz
Lg0KPiANCj4gT2YgY291cnNlLg0KPiANCj4gSmFuDQoNCg==

