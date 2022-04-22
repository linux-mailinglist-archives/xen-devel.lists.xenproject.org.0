Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C298250BA91
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 16:50:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311027.528003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhubV-0000Ob-SY; Fri, 22 Apr 2022 14:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311027.528003; Fri, 22 Apr 2022 14:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhubV-0000Lz-PV; Fri, 22 Apr 2022 14:49:49 +0000
Received: by outflank-mailman (input) for mailman id 311027;
 Fri, 22 Apr 2022 14:49:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+xj=VA=citrix.com=prvs=1042e1a12=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhubU-0000Lt-R8
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 14:49:48 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73b73ff3-c24b-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 16:49:47 +0200 (CEST)
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Apr 2022 10:49:45 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM5PR03MB2826.namprd03.prod.outlook.com (2603:10b6:3:121::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 14:49:43 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 14:49:43 +0000
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
X-Inumbo-ID: 73b73ff3-c24b-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650638987;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=DIkvGl3E4Jcx+d5JejHHOmVng9dnbbg/kukzDT/s5d0=;
  b=Qam4HKB74hRcPVB6FtUoOrEEnEVGTkwmlwYWCjknV6UT7eliQAuXVb+p
   O+8kBJhIyhcK3scvdj4SoyKL3wUIcuQWCdlnlGPjT8H70JUZkZoZDaOt0
   zOTPCOpR8sFUE1vxUFkN5MfyRJmb5f9yWJ9OI1Nrv6PWv0BjXsHW/2TSU
   g=;
X-IronPort-RemoteIP: 104.47.55.107
X-IronPort-MID: 69709779
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zvS0v61wOqredtFFuPbD5aJwkn2cJEfYwER7XKvMYLTBsI5bpzUFn
 DcfX2yBb6mNYjH9eo90PY6wpEoDuZHRnNRhSApopC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tIy24Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0Qi4CMaz54H5bzmdYYVxt4CwN5Jq5/reqvzXiX6aR/zmXgWl61m7BLMxtzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82eBfySure03x9p7ixKNd/Ya
 9AUdnxEaxPYbgcUElwWFIg/jKGjgXyXnzhw9gPK/ftovDm7IApZk4bmPNCIZYywasxypAWE/
 zvLz2byO0RPXDCY4X/fmp62vcfNkjn8Q5k6D6Cj+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVQBmQsHOC+BkGVLJt//YS7QiMzu/R/FyfD21dFjpZMoV+64kxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLScZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:x6sY6axIqFmCSfUP9ZPuKrPxdegkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMUs1MSZLXPbUQyTXc5fBOrZsnDd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadv/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZfbxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESutu/oXvUiZ1SxhkFwnAid0idsrD
 AKmWZnAy1H0QKVQohym2q15+Cv6kd315ao8y7kvZKqm72EeNt9MbsBuWsRSGqm16Jr1usMr5
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvGbf2RYUh27D3xnklWavo3RiKmrwPAa
 1rFoXR9fxWeVSVYzTQuXRu2sWlWjA2Eg2dSkYPt8SJ23wO9UoJhXcw1YgahDMN5Zg9Q55L66
 DNNblpjqhHSosTYbhmDOkMTMOrAijGQA7KMmiVPVP7fZt3cE7lutry+vE49euqcJsHwN87n4
 nASkpRsSood0fnGaS1rep2G9D2MRGAtBjWu7FjDsJCy8zBrZLQQF6+YUFrlde8qPMCBcCeU+
 qvOfttcoreEVc=
X-IronPort-AV: E=Sophos;i="5.90,282,1643691600"; 
   d="scan'208";a="69709779"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAoQm9DKer3GRiE3emu+ubz2YWQbxXgSvP0ny77Q+4yauLIhrBQxraNXdtT/EGOH7mM7ZhRSIHY9RklkOq18N1jbOjSyKi/Wy4+S2UvdGUmrWOMe2RaNp6AXT6o3AK6btewtC3vmrKFdnssUccfyNAfqEdlrBm5a4thkgjO/S/2V1ehzDiD+df48lDgkTY3AbbvsUxlxLBuXF0J2BITJWD6iKN9Wbxe0n0eIjzLn0I1wzwETHQTUtZdMUVKvNVAGEiZRuXCEYG24lVkTE3u7hjsSYJJ0WvN4JRqxnEQxc7sODEPm5rF4jsjcwI0S0WFigFqnqeQeLz3C56qL91l8Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIkvGl3E4Jcx+d5JejHHOmVng9dnbbg/kukzDT/s5d0=;
 b=am7hezjIIc8Cubyx66BydmOa/TquTAqEZfB61osiUd6HjiQZfOifjBk92t6jMP6+6try0e8wgBG0H6ujgF6Ikls7+yWbilT/gKiiom6O6ZNc4kXhYnPse0fExJ4S7jqdZmvWU9JA9nGeIXP4PUyeDsO77KuIu0miIQHlb5Qf1fK293lsr0Ce4tnbie6SwiZhMn8b36UpR1QQm3v4RHzH3kSso/hSOnVV8mgePpSQjZNFFRo1bFe8sKUruOlQcZARa4HtyK20nklipCMpXkcR5PTyGu430G6LGPH6hAm3dxJ8DerDsr/8QLSfLa7PBRBQ06UufxRrEEw8/QUOIE3mFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIkvGl3E4Jcx+d5JejHHOmVng9dnbbg/kukzDT/s5d0=;
 b=XL62x7mu6v2FNMAre/gBu962cfWdPmX7n8rQqnEfQUtYoP+M2OGV8gYYZhLUZyOVz2SOieaIN/IwXxgcTmFzu8j6Zt44Ys5C9NXUVSV9TUi3a32QQyLhQZmjEnen3oqgYBWSGxlecqmben96pFcup+M0Iag0V6+5BIdk2qRMKYk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH 3/4] tools/libs/guest: don't set errno to a negative value
Thread-Topic: [PATCH 3/4] tools/libs/guest: don't set errno to a negative
 value
Thread-Index: AQHYVIinr/Ua+fX7+EepMs2SjezAeKz8B1QA
Date: Fri, 22 Apr 2022 14:49:43 +0000
Message-ID: <ab1b7536-d082-eb88-6005-fd710bc6a1fa@citrix.com>
References: <20220420073119.16974-1-jgross@suse.com>
 <20220420073119.16974-4-jgross@suse.com>
In-Reply-To: <20220420073119.16974-4-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bba830de-7f10-490e-013c-08da246f5648
x-ms-traffictypediagnostic: DM5PR03MB2826:EE_
x-microsoft-antispam-prvs:
 <DM5PR03MB282695D80DC28A7F9AA9D584BAF79@DM5PR03MB2826.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6fTk7VG5F/FI+G2hAycxfjgfSCIq6yrA8VRpIaut8oVofwIqAk1fnF2lQ7Y8UzfWIGUwpOdCy9TJFqVHaaWXxyfMbUYBbvXhw+tDeyhvhE0bgTMqic3U0KXUcxim7UX3mag7Rr1ColEgztwewcwdoFBw9w5YMbeyS4EyxsAbXcY4maIeqsSUpT2gX2l0oIUFSmljmrKgklAxVTmZHe/uEBltPwaYtJO9Nv/BJ+1xXnI0GQYe3e0xWjM6x6NlYHPFh7GKxhKOSDLPCr9SEtf/hoqHtk803i7WQ+0l7/14WrW7CcwS+f8ALT93EzsIHtv6b7Hyst+9Sl/Y50G25ELfLe5Csnqi8CnrsNbdcvGolrCOuYx7BLVdriXA3HZNh3VRrGvJ+wE402fWiGTn9iVPR6kF/V54XII93qkNonwjmZtrRsulxGM0bJOeMQ66NL76YGwZi1n5ypBP2fQu7V7igkjDrVrAFYzC/wi+6pH0SmNl3+Zva+rUCxAZhnrYn5284XEMzryxN1HfWXn1fOvBHlLXUBtrtXgOjz+CVuT3HErdnkyC1eQSHGvL9smjyenYNRXGQmXY3bfEe5nl9G9bOLPzpei+SP0CK2VEhD869r4RlXO7mRx8NExRSK0xFCCJETnDGhPHywqGUxaRRqTGN2WFVt36O0FDQC486QuquJ1tHVHquwAr7SBygI5Glt5P7qipWiRUJ19zGQTiSmDBhHDo2WCh9dMT2Gwu1rVhglTmrpcGDoLIKzRpUMkynYh1YMtGcFLKO7JMYpfiETZ97A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(6506007)(26005)(4326008)(8676002)(36756003)(71200400001)(53546011)(31686004)(31696002)(122000001)(82960400001)(508600001)(86362001)(64756008)(66476007)(38070700005)(38100700002)(6486002)(66446008)(76116006)(2616005)(5660300002)(66946007)(186003)(91956017)(2906002)(558084003)(107886003)(8936002)(110136005)(66556008)(316002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dk5TWlV2ODB6cU9KcEZqeEFHZnB6TW9OSDJ1eEJLOVB5SXVlcFZYbzNUeEVq?=
 =?utf-8?B?V3FuRWRPNVdNQW50RndySGxqLzVBSndIR2hKTjZRaFFXVitQdGxOVWVQWjcw?=
 =?utf-8?B?UTlESFhFMTU3Tmd3UmJvRzJDMXhCNGRzaUpadndwTVVTSVdray9URndpMDlS?=
 =?utf-8?B?ZEMwWGxwaXE5TnNnczgycElSUkpsUG1TcU1NVGQ1WXVhWXhqZ0Q3TWJMNVp6?=
 =?utf-8?B?NGlZcXg5dlFFR3V6aDIzUWtiMUJVeTI5N05zTE43NTU5aGlDUW82a2VpZXRI?=
 =?utf-8?B?VGthbFpNTU1XWW9nMStKS255dzIxK3h6eHVtcWk1ZmVqbGVFZVEycFFPeml4?=
 =?utf-8?B?ZmR2SXNjTXBML0dVNFlxQW4xTnNBcGJUK0ZlR1BKU2NNbHk1aytBL01lQ1BV?=
 =?utf-8?B?TEM5THcrZzhSSXkvQjVab25TMUFDcVh6cU1qQUQ1ZE1wUnIzOS9mMHJEcFVn?=
 =?utf-8?B?ei9DcE9KV0VvbGRIbE5IZ2pWT1dWOGNxRVNOREZnMUpmVHJYTW1NVEFDT3pV?=
 =?utf-8?B?dVlVTFR1ZGg4Q2lqTjRHdmVORTZkNEtsZkwrdVFIM3YxbDZ4d3g5UDNTMUEr?=
 =?utf-8?B?WThoVVV0RGpUcjFRTUNWbHE0NEJlRHZiRW5BbHZUVWhGQVZScDZiTU54dmVB?=
 =?utf-8?B?bTlsTGdjZ0Nja256Qi9VNlRiOFovbEVXMjJwV0FtZ256V0dSZFpIZnBVSThG?=
 =?utf-8?B?T3RuNUg4SjhMQUIvTitESy9aakJJVU43Mi9TMk5RUzlpeG9GZGcwY0JOWDZW?=
 =?utf-8?B?ZVZ1eXhFWlEwTk5uQlRLZzAxS2JCNUY0dCs4T0FkaWd3SzdVOUo5OWZwU0lY?=
 =?utf-8?B?Skk3SFBEblRpcS9vUTQxSmdHVzFGYWE1aDBUajViQ3ZjTFdXcEZYKzdjVG0y?=
 =?utf-8?B?ZFBpL3JkQlh3eTJuU0J4UHdkbS9ndEI5V0FZTjZRK0IxcWczcy9GeGhSREZp?=
 =?utf-8?B?UkF5QS9ab0tPOU9GWkxGUHRETktBY1RnWGU4Sm8vOXQ4SC93N2NreEsva2Yr?=
 =?utf-8?B?S0lDdzNITDhuY0hqZmVsSWtjVEpVVmsrUUZDc29ZcnRxT09xL2ZEUVQyNXhu?=
 =?utf-8?B?dnhKTm5jc0U0dDhCZ2lVM21sUEFtVWNPMWNweEVCeHQ0NVNyM29DMmRPaE9s?=
 =?utf-8?B?S3pFZ2d3R0QwUHdBVTN2c0hGM1pWRGFCL1JpTUEydWVKY3hab1V0UUNWa3Vs?=
 =?utf-8?B?dHY2Y2VncjFBMHlwcEhkaHk1NDlGTTM2ZHFiTGxnemJpSWlZNG5FOTB2akY5?=
 =?utf-8?B?UTVNSzVwVklEM3E0MUQvc1BiOFRwOHhzdlF2YnJEeW1wbWtCSFZuRnBqODJO?=
 =?utf-8?B?ZU0vbXdzZmI5NTNTRVphSC9JOFRtYU1CWWpjTVp3azNsc0RhYjRON1VZQmhF?=
 =?utf-8?B?WU1wUm55ZDE2ZkNvSjFoZG9jeWNPNlRneE54UUdJMERWMGdlejlZS0Zrblhv?=
 =?utf-8?B?cnY4SCtibkRneDlJT0h3d2NsSEJBaUlGOTlMSzhDb29mbmtyS2VKeUltSUF5?=
 =?utf-8?B?bHhQOEpGNmpDb2h2ZjRncUFBWmVFQVpQOE5QT0ZUTTUvV0ZPTFRKMmViSVJz?=
 =?utf-8?B?eFpQQ0tKMlVvbS9PUHg0UXJjckJGaGcvK2VtZHVPNkh5OHd0ZlNqVHkzdDJV?=
 =?utf-8?B?OGlSR29VSXNLL1FXV0JaNUhlay9rT3E2UUlzKzg5MWZQTllPckxzYUJyWlh0?=
 =?utf-8?B?b1h2NDZUZU4vUW95VytocGdxN2l1NWpJbkJROUxldDA3YXFOTEhDeXVtWWxu?=
 =?utf-8?B?RHlSV2pveXNHc05zKzhzRTFaL1BYeEtVTXBGVHZ0bVFxanF0WkxDQmhmbldB?=
 =?utf-8?B?QkFtazRuUkFjQlNGODVNb3c3N1BLZlRDWXRCc0xVTS9YTGZac2dYQm8rbExy?=
 =?utf-8?B?cDRTUFVPcHBENTJub1J5QmdOdHIwWWtvRjhlNDAvb1pRZ0R0MUx6STR5QWNX?=
 =?utf-8?B?NUZxTDRnMjZxV1V6SUVQblZxNDNYVmVnWWoyb3E5N1JaV05rTU9QOXJ1dmFp?=
 =?utf-8?B?VFFMdjBpd1o5UXlYK2E0c0hUTU1ZZUQ3RGtqUnpOdXRWUXppdi9rVGpSSXkw?=
 =?utf-8?B?VHBBRmtoUGJ0dzBSaFZ0Ykl4QVpWamFSN285d3RmWXhFeVhYS3BPd1N6UUVT?=
 =?utf-8?B?UnpmUGlZWEZnQ3BmYTFhK2tWTWovU3lWeTE4Y2E1Nk44SXpyVkdiSVBqWW9D?=
 =?utf-8?B?bEtxTHB0N0E1OXBCeXNvVmkyMjRtYktHN3l4cDJSSVJtUmx0WE9ST0ZBRTVp?=
 =?utf-8?B?UGVYWS9Hd0VnU0lseHFRV3d2Q1g4bUxMVk5SL2pJUVNOdG1EWnRRWVRYZk5w?=
 =?utf-8?B?aTVWYThVL2pMZWJUbll2N1FST3NBaW9PMXZCVElUTmR5bGx2VEFCQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D51F3D454FE04C428C4148C706039106@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bba830de-7f10-490e-013c-08da246f5648
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 14:49:43.3250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w/UwmhUeBjDLe7//5msiYcQRMcRmww+VX3UCpjMw0znArEZG6XDECyAKKugS6FBdyqzvmXitMbAwrWcfPwOP0DftpLOUtY0uJt1BpE09E4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2826

T24gMjAvMDQvMjAyMiAwODozMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gU2V0dGluZyBlcnJu
byB0byBhIG5lZ2F0aXZlIGVycm9yIHZhbHVlIG1ha2VzIG5vIHNlbnNlLg0KDQpGaXhlczogY2I5
OWE2NDAyOWM5ZA0KDQo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4NCg0KQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+DQo=

