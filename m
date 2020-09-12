Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF92267A4D
	for <lists+xen-devel@lfdr.de>; Sat, 12 Sep 2020 14:34:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kH4iX-00044i-Fk; Sat, 12 Sep 2020 12:33:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aew9=CV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kH4iV-00044d-ST
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2020 12:33:19 +0000
X-Inumbo-ID: 74268571-2d77-4954-b7a1-3a61d31a9427
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74268571-2d77-4954-b7a1-3a61d31a9427;
 Sat, 12 Sep 2020 12:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599913998;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=B2q9wWLXguzxzKYACNVq/rIz5/39/+pv8ajuVzwRlL4=;
 b=CDDpdGAjOE+owln3UmDLdGZ6SQsYY1HbAZeugLcNvHoVUkwXsJ7u2MgF
 XzlntaYRNS7qOwkMoWxePT678xpfU74bwBYZV+EaGFGZOxQoHX3+meVeD
 kdZvUx+FehFYiDBW69WBKyqmK0n8NEBJKlVMSAZSGb1RMwa0T1ddUUW1o I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: OsjkrIDwW1L6/ktcLIowcugi0SFSTfdt6mEhZ0lajrRuzpmnEbpvEF4Sk52guRMxQK8fW4/UDt
 FGJHdSlpOMQnuyL/rchpxqeTrvyBbL6H0VjUjghESt79FNe1KE6i5FCtkBg96a0zSJstoEBi97
 sg1AmAxekcf++pt3I0NMYhrkYfRtVr6wm5Ese4OoSXnNRdMS4TivHsJSCa5ybUjog+hfHzWHHY
 mbrCTnZLiLJYL/MRJOPfUhszRHQSdyTkN8//Cg1/QGVYHFWkNfUK3fqWW+hXUkh0i3fnOWbI2a
 tBE=
X-SBRS: 2.7
X-MesageID: 27531093
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,420,1592884800"; d="scan'208";a="27531093"
Subject: Re: [xen-unstable test] 154090: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>,
 <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <osstest-154090-mainreport@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9e29a1ba-4878-a84c-c84e-99c1a33fe01d@citrix.com>
Date: Sat, 12 Sep 2020 13:33:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <osstest-154090-mainreport@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11/09/2020 14:19, osstest service owner wrote:
> flight 154090 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/154090/
>
> Regressions :-(
>
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-pygrub      11 guest-start              fail REGR. vs. 154016
>  test-amd64-amd64-xl-qcow2    11 guest-start              fail REGR. vs. 154016
>  test-amd64-amd64-libvirt-vhd 11 guest-start              fail REGR. vs. 154016
>  test-amd64-i386-xl-raw       11 guest-start              fail REGR. vs. 154016
>  test-armhf-armhf-libvirt-raw 11 guest-start              fail REGR. vs. 154016
>  test-armhf-armhf-xl-vhd      11 guest-start              fail REGR. vs. 154016

http://logs.test-lab.xenproject.org/osstest/logs/154090/test-amd64-amd64-pygrub/chardonnay1---var-log-xen-bootloader.2.log

Traceback (most recent call last):
  File "/usr/local/lib/xen/bin/pygrub", line 21, in <module>
    import xen.lowlevel.xc
ImportError:
/usr/local/lib/python3.7/dist-packages/xen/lowlevel/xc.cpython-37m-x86_64-linux-gnu.so:
undefined symbol: xc_dom_gnttab_seed


Something seems to have gone wrong with the python library linking.

~Andrew

