Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4153E7A049F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 14:58:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602259.938716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgluj-0001ln-Q8; Thu, 14 Sep 2023 12:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602259.938716; Thu, 14 Sep 2023 12:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgluj-0001iR-Mn; Thu, 14 Sep 2023 12:57:45 +0000
Received: by outflank-mailman (input) for mailman id 602259;
 Thu, 14 Sep 2023 12:57:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J3lF=E6=citrix.com=prvs=61487cf85=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qglui-0001i5-C7
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 12:57:44 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49af113e-52fe-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 14:57:41 +0200 (CEST)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Sep 2023 08:57:39 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6551.namprd03.prod.outlook.com (2603:10b6:a03:38f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 12:57:36 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 12:57:36 +0000
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
X-Inumbo-ID: 49af113e-52fe-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694696261;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ODxAtfwi+/Hdo9zc5Ehl3yKEfZbPtaK7Xl6/DHYFid4=;
  b=CuKvW5XYc/UqWHkzGHqYSkQFLcoZ9iEvpVMBLpRWCxIwGA5X3GnA8qo0
   cm/7EzYBhxOYTg6WZjwLg5VgGz3dImDPs/qfgtExhyRSCPaIcUR/jRNLS
   Y1H9pikuxpeNHHnmoZ2aGpyGDorbHcGZ6x6wpjc7aqCwPjG1xyoYOs2/4
   o=;
X-CSE-ConnectionGUID: 7QcFzRMBSSKeVqpP9UGlZA==
X-CSE-MsgGUID: n35I1b6gSo+kXEX6pt03bA==
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 125355355
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:Ta0eF6KuRrC1m1cEFE+R45QlxSXFcZb7ZxGr2PjKsXjdYENSgzIFx
 mIfCGrVOv6DYmHxf9Elb4mzoRsC7MSEytNhHARlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrZwP9TlK6q4mhA7wViPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4oOGpg5
 8Y9Ags2TR29nvqOkY+UTttF05FLwMnDZOvzu1lG5BSAV7MMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGMlWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv227SSwHimBer+EpW+raNL2VfNyVcUSx4meGvlueXh0USXDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Ul7Cmdx6yS5ByWbkAfSTpMbtEOs9c7QzYx2
 hmOhdyBLSxitviZRGyQ8p+QrCiuIm4FIGkafygGQAAZpd75r+kOYgnnS99iFOu/iI3zEDSpm
 TSS9nFh3vMUkNIB0Li98RbfmTWwq5PVTwkzoALKQmai6QA/b4mgD2C11WXmAT97BN7xZjG8U
 LIswqByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:pDnTtK07f9W6wlGINmPmXwqjBcZxeYIsimQD101hICG9Lfb5qy
 n+ppUmPEHP5gr5AEtQ5expOMG7MBThHO1OkPYs1NaZLUXbUQ6TR72KgrGSuwEIdxeOk9K1kJ
 0QDpSWa+eAQmSS7/yKmzVQeuxIqLPrnM/Y5pa9854ud3ARV0gJ1XYhNu/xKDwReOAyP+tBKH
 Pz3LsimxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlal9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4kow3TX+0aVjbZaKv+/VQMO0aSSAZER4Z
 3xSiIbTodOArXqDyaISFXWqk/dOX0VmgHfIBej8AreSIrCNWoH4wAov/MDTvMbg3BQ5u2Vqs
 hwrj6kX8E8N2KeoMy4jOK4By2DUyKP0CcfeSp6tQ0AbWPYAIUh/LD3tXklYKsoDWb07psqH/
 JpC9yZ7PFKcUmCZ3ScpWV3xsewN05DVStub3Jy8/B96QIm1ExR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY/vY1a9DC7kISaXOxDqBasHM3XCp9r+56g0/vijfNgNwIEpkJ
 rMXVtEvSo5el7oC8eJwJpXmyq9ClmVTHDo0IVT9pJ5srrzSP7iNjCCUkknl4+6r/AWEqTgKo
 CO0VJtcojexEfVaPN0NlfFKupvwFElIb8ok8d+REyAuIbRNojnrKjSae/XJLbheAxULl/CPg
 ==
X-Talos-CUID: 9a23:KKPGrmGXQjXZV/OUqmI4zUU6CPoAWEbm73ruOleAWFtGTI+8HAo=
X-Talos-MUID: 9a23:Q3dXkwVRn4TJQq3q/Dm32RA7Ppln2KPtC3Agocsep5HfPwUlbg==
X-IronPort-AV: E=Sophos;i="6.02,146,1688443200"; 
   d="scan'208";a="125355355"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0de2YSxcuREQqcmlQQG1N1xqoiEZmb4DH/KldW+1EEUFzvhwLhGRIUeMqywr8Fvs11U0OxmKb9dINDyhuEZyzOu9KI3iGOGwAIMPS//KbaEcxI0H0GTJbKSbgIZfX0VV+558iwxDDxwxsZPws5IiqZCen6D0eZaGX9g21xr+WTvU1HTPyELouL1UPlPo6T5hoUIDAD4lYYfEvu9gQryJHqCfAYSwd+4QnpLa6wRUYCFdm7w5TXMwznDkseG+kz+Qgopjv9BN8bJf0BYWZUFtOyYLCozJAH5xrDuLdOah/5fbDdS4UGm1b4rEcwjtDHg6zjpblTLhb2DSayZPXVE3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ihWNJDQyDekg/XPnJqApWkOSdQgu9311zR1/7EiOsc=;
 b=i+tOlcl4LFd2g9ISdZCzdOSBfFiBQairx0PPapNhIQmSIj5b98pExJ8nsQSyRRbo+achzo2/rEcQ1uRpcnasLDtMWNGCxb5ztBkB3xI0pqGEwMgdbgIPe1g4yCSdL/3566JyQuwvreZKSsjp6BwA4MtwbG9k/XrBy4Q0VIBBj0yzecu/rcjSe5ijUDfPsJRvTI1q3nKpZ++I0vVr4/bDomCTCBmhfZRsfcFyKfBn2FrVZ0Zo0TRRYHOmHcDJex+LFb6PBdQHwvQ3B+FKWY5N1paj7KbGnDHpdJ4m3ciTnkdIC3yLq9YGDMurzRB7zfNH8/InVankb8ExbbggWBwz6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ihWNJDQyDekg/XPnJqApWkOSdQgu9311zR1/7EiOsc=;
 b=ms+3IK/+Sp6z4S8s0kiXHpOPGopGlSTxLtSAAeDjADjTswfkmUUh84y+/XLPlI4HYiXjdEkwzrOcV0VTNKqZYDP99ovX+pNGI6lH0VXV0FW5FyegQrk50UWxEob9zKIrGORygevp28VgGsVMeSP9Z0f6x2fJ/Ofn4m6rr6iFNZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 14 Sep 2023 14:57:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?Q?Sol=C3=A8ne?= Rapenne <solene@openbsd.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/amd: do not expose HWCR.TscFreqSel to guests
Message-ID: <ZQMDOwGGNJVnjFEm@MacBook-MacBook-Pro-de-Roger.local>
References: <20230913145220.11334-1-roger.pau@citrix.com>
 <e2fe16de-cb08-4a0b-adfe-95da6c86ea16@suse.com>
 <ZQL-p3LJX7WfwCtC@MacBook-MacBook-Pro-de-Roger.local>
 <e8859459-53dd-aa02-b776-ba4052c7ffff@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8859459-53dd-aa02-b776-ba4052c7ffff@suse.com>
X-ClientProxiedBy: LO4P123CA0673.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6551:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d5481f5-b974-4d19-3d5c-08dbb5222b22
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+5Qa66o08LjPQLR+kN1pkEzaQnRjFAd4owfF8ELMteveBN5sNWRismTipoJBywf9AkxUrTrF4DCW68xzFx9N5S3HvHNG0Z2+l++F3rYN/MOqq5clHLtgYTUbaVQqLXVt/ILna/GogGKjV9L5L2oalMTTiooXNAxDihU3f2/z6oy1jrRyfbycHFQ/OOifywIz4av2eV6bxnCc5xx6BlmkeU7ohVlOYE/iShYU3G1D45RlIH2QXb/4c8Qn04DRZ6XIOk6spXfhZO/Xn2UDy7uPe00ufnAmWkc60+1HkYN6tTZVa492se4aYQtJCaDrsDwtJ01X/tPxqV8SyjYw3u/mU8u/GvZfP0W4L5C1ySarexPpLEjgVB/gRSMsNp41ZKJmW/sx+cHUyKw3zYxPiH7tPkybk5VwzKctgKjw+OT0zlZ4bFDRFyGGSHJgMwn8DnD+7mnvT4nKksYWep8K5av5jjbs0lrrw+lYFgEwoi8p1umNqGosfMZhuD6rGOYzQqFBi5oNRX5SAuqWUgc5vcm1FY1CmoxASNqWZ67heIO0UbQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(83380400001)(82960400001)(53546011)(9686003)(6512007)(86362001)(38100700002)(6666004)(6486002)(478600001)(6506007)(26005)(4326008)(8676002)(316002)(66556008)(41300700001)(6916009)(5660300002)(54906003)(66476007)(8936002)(66946007)(2906002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0RWdnoxL1VaeUVCTU9mQ0VIRGpaNlJvTUFVSFlaeDhrTzFGOVcxMURYRHRh?=
 =?utf-8?B?WUNwTGZUR2xpQ2sweHVSK01nZG1aVTQvdERSVzZSL0wxejJIYTRzQ3pVdVFW?=
 =?utf-8?B?SWZ5UGNiQ29WdDlnM0lNNGhvZEx5SmF3QkMydWtEQkttVDM0NDFjY2JxNE1O?=
 =?utf-8?B?TlA1VFNTVElVUEkrRmJwT1hqdEZ0USswL3kvMEsyTlFPNHgvdHFiQVZpLysv?=
 =?utf-8?B?Z1E2bzdqYTFCdU05a1YvekVhT0V5SlMwbG1pWmxiK2lxVDE5V0hsTVVvdldi?=
 =?utf-8?B?dlNsU3k2eFM4Yk43WG9DbWpGbmNYZlJtK3hqWFVGM1RubG8xbURTTlNQREhl?=
 =?utf-8?B?bnVjNGxQZENoKzJzaS95OHQ0N3NzcE5EdmNtQkE2UFc5Mm01VEtRcEs2bGFM?=
 =?utf-8?B?aW9CRHgrM1gzVUZ3RW5OeWtqVFVONDduSUFaMDZqY1dkV0lPUWxSZVc3V01H?=
 =?utf-8?B?dUZxcncyakkwK3Y1N2VIWWxNbFZBMVZWZitteG9va3NwdnlXUE5xNnRoM0hL?=
 =?utf-8?B?TXoza1RUSmtnZnd6QllWdS9IanAwWnpaN2hBZG5yMUhRQ0xJejgxUDZsYXNR?=
 =?utf-8?B?YzlCYVRnTFcvOW1jRmdTYmFyT2F1ajNRQTVwMjlGQmFvMmE4bjJnbktqZnVI?=
 =?utf-8?B?QlJVUnF6dzgxdmJsa2FMd1loOWs5WkQyOUg3Z1JwdmNNUjFxR0l5aW4xVmNO?=
 =?utf-8?B?a2lDUlkwaHR3ckM2S1Z0dW5BdmUrd25tWEZaQ2ZyN2JRTFNGTG1vaFJVSnRM?=
 =?utf-8?B?Q0FzQWh6M1FGZGVOUUdyOWlFM3lvUlQ3eW81NVV0UHZTM0l2Q2ZFOFBBYUhr?=
 =?utf-8?B?L055RGFvSWJKYW1kWHFKeHFpMTVGV3FSTWJCdDFZK1RIem1yek1uR3B6Znp2?=
 =?utf-8?B?WUVybVg1bXBIbkFuYVBkNnF1L2ZsblQrNnBiSjBaa3FLZGVybHgvOElpaC9B?=
 =?utf-8?B?VVhWZG5nUmN1a2plV0theXc1VUsvNWtCQlhJYXp0YUFrSTJBQVBicFRxaXR4?=
 =?utf-8?B?TWhwZFBlbUJ3OXdsVVN4aUQzYmdtNHlwbEdFT29IU0JCdmFUaDVBRmdkL0JE?=
 =?utf-8?B?bUdCdmgxcjVjcDBzemhYSk5KYzAzT1B4eVdsb3FaNFZBcCtnWEJiN0wvbEYw?=
 =?utf-8?B?N0hNaW1sY3FFNmtkRXlYL2RCTkFiTXVweHVTbmFiSllpMnBCSHlzY1hXUlBr?=
 =?utf-8?B?RnAwaUtmOHNpN2dBblRRdHJmeG9CKzNNRjdwSG1ZK1FaaDBJM1BqRlZkT1Vn?=
 =?utf-8?B?Y1Z1UDhTN0hpanlRTjBVQ01GRVNYTmYvQVVmWm5wbi9MMHRmamtVYk9LME4w?=
 =?utf-8?B?K3RIWXE3ejdtVnU0WE4rZEI0RCtKeUVyeFpWSUxVLzNDT3FpeWFzWExLRjdW?=
 =?utf-8?B?OEI2QVk4UzIxVzUramxTYkVyd2tLNmdlcVdwUkRSZFhjNUQ3ZzNtQ3BKb3B1?=
 =?utf-8?B?TVI0NWdNYTFMemtWUUVFbFEyc21aK0hRNkRoc0V5OHF2L0RYZWlka21aUXZP?=
 =?utf-8?B?aHdRZHNISTJpSFFpUVdRT0owcTI4QnJ5d3FGSHZaYnQ4cGRlWnlaQ3diYUQy?=
 =?utf-8?B?Q09ZdmROQjhRR0p0Q3hSRjFrRDBGelNnM2lLa0VJb2NQeHQ0NVJQUmVCRkRt?=
 =?utf-8?B?eXR3aXNTZUFQdFhvc2ZoQXZUOXExTHRvZHBKMFRGM2Q2UmoreHJtN3Z0QVRN?=
 =?utf-8?B?ZzdZWCtWVDZpVmZpMEEvaGVZY0MwSTJqK0h1aXYwUGNFMzlBUG1QUEdGVCts?=
 =?utf-8?B?cE8yUHpNTXN5RVVaRy9NOUk5K2VqV1A1SGUwRVdVU3dPWk9LcmNIcFJKQTlB?=
 =?utf-8?B?Nk90Q2NGUElsdFROMDlsMWdIS2xnUjVTb3F5UUZRRFdCUVN3Q1dyemRsYVhw?=
 =?utf-8?B?c2gycW9oSWJqY21QRExhSzNIbVhRTFg5MDlMVjRmd28xazFqdDdnd2xSSWlk?=
 =?utf-8?B?K2kzWFNzb0FUYTNxTzhvSm9vanlHZkQxQXAyT3F6TWZ4STFCdVNYSy9ySEZw?=
 =?utf-8?B?QThTeEVOTklNc2ZodUtuem42WWZNcWxBVU52aVpLN29CdStRbWFqQ0ZaV3hj?=
 =?utf-8?B?NXJPc1FqOHZCdVZka3hDUFA4aXNKRDZ3ZEFpRWlZcHdneUNzcmVUZC82VjRL?=
 =?utf-8?B?UG02L1gxdGRuTkZES0xSd3d0TkdhUUV2L0dXRmNpUmUwdllFdVA5WHNOQStr?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vS86PX3oEgFCejSkVpRXuq5aKzQ/TRXp0jDfZRaQIa8HuLmXDRG3prYiviPY++jSfzTpgUG1yXhmXoIR6c4HD2FbHzgjqhaHh9Q8if4sY0urOb4FxG8i3hcU3Z+75obymsjQTtbFDj9kFzD2T3+UuTx4gQczxpxR28UuL0M73kbZ7J85uTHNUpQXc0jOKUi8GSIo+SOJlBIPXQ+JveceaW2+uEyMjM0T48OvFY0NNlw2/Ya+RMOtpWrQ3xh7kV0dObFFm9mNDRyQhY0dGzgmQmLte0YvKjod7hg+atPUaW0tL4iB5BeuImZBhT935GPOQNQz8zn71iRBX/BA+xi/9QzDNShCN2We++u/aWyWGaYC1JLAQfT9FaHr5WK9+tggUYVlFrXdMuyz9c7Qd/d34KMX9VNZkqhqN44HXSVhKFK6KXH5sWvADBbRcrjSISAoF7yKBKXe6VcUUG2eW79vqaS2K66mRUO4/1xVgRJdePr2AluJu3hZYsCzFfvUnwD8PCnhRKRCG8uFZ9UFRu28neeVhafVk2xAo56WLu8wWlZCzHb/t7/qCHwATR84+Em3RJsPaOtik/6snWD+qZBRi+NSmZ8MGfXzrilWNrfjsolOxL3fsxfTVps45ehEr3ISgoHFjurL75StT7II5diiaBX/JJImIBZvNTKs+ywsz5NVL57cwwtm7Hja6cpWSXvNwmaEnVX7nATbBtz8WEF2Hfjf/ZEp4qDWrsq32U5+JEJASo18/0hdCFWZdteb/nBIjoF2dHN9VtCsnyzX0gjOe/4VQU4tqyCmelp9psQVe3AA1YkAaF/FEsdVfXAlICaDOPgmEOzs7mMIwKg2yg5+2js7XmnOzilibvFXF9myGYM=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5481f5-b974-4d19-3d5c-08dbb5222b22
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 12:57:36.2893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nj9T8waMDiUNWi4/KARdVtNqykN0P2bpX4U4Ge4DzlMRx98Yb+3utM8pkNrmfc/S0FD2pHKAjSYG6wZdbWtRvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6551

On Thu, Sep 14, 2023 at 02:49:45PM +0200, Jan Beulich wrote:
> On 14.09.2023 14:37, Roger Pau Monné wrote:
> > On Thu, Sep 14, 2023 at 07:52:33AM +0200, Jan Beulich wrote:
> >> On 13.09.2023 16:52, Roger Pau Monne wrote:
> >>> OpenBSD 7.3 will unconditionally access HWCR if the TSC is reported as
> >>> Invariant, and it will then attempt to also unconditionally access PSTATE0 if
> >>> HWCR.TscFreqSel is set (currently the case on Xen).
> >>>
> >>> The relation between HWCR.TscFreqSel and PSTATE0 is not clearly written down in
> >>> the PPR, but it's natural for OSes to attempt to fetch the P0 frequency if the
> >>> TSC increments at the P0 frequency.
> >>>
> >>> Exposing PSTATEn (PSTATE0 at least) with all zeroes is not a suitable solution
> >>> because the PstateEn bit is read-write, and OSes could legitimately attempt to
> >>> set PstateEn=1 which Xen couldn't handle.
> >>>
> >>> In order to fix expose an empty HWCR, which is an architectural MSR and so must
> >>> be accessible.
> >>>
> >>> Note it was not safe to expose the TscFreqSel bit because it is not
> >>> architectural, and could change meaning between models.
> >>
> >> This imo wants (or even needs) extending to address the aspect of then
> >> exposing, on newer families, a r/o bit with the wrong value.
> > 
> > We could always be exposing bits with the wrong values on newer
> > (unreleased?) families, I'm not sure why it needs explicit mentioning
> > here.
> 
> Hmm, yes, that's one way to look at things. Yet exposing plain zero is
> pretty clearly not within spec here,

As I understand it, the fact that HWCR.TscFreqSel is read-only doesn't
exclude the possibility of it changing using other means (iow: we
should consider that a write to a different register could have the
side effect of toggling the bit).

The PPR I'm reading doesn't mention that the bit must be 1, just that
it's 1 on reset and read-only.

Thanks, Roger.

